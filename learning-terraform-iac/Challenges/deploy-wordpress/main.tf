# module "vpc" {
#   source          = "./modules/vpc"
#   vpc_cidr       = "10.0.0.0/16"
#   availability_zone = "eu-west-2"
# }

# module "rds" {
#   source        = "./modules/rds"
#   db_name      = var.db_name
#   db_user      = var.db_user
#   db_password  = var.db_password
#   subnet_ids   = [module.vpc.subnet_id]
#   security_group = aws_security_group.wordpress_sg.id  # Referencing the security group defined later
# }

# module "ec2" {
#   source         = "./modules/ec2"
#   ami_id         = var.ami_id
#   instance_type  = var.instance_type
#   subnet_id      = module.vpc.subnet_id
#   security_group  = aws_security_group.wordpress_sg.id
#   db_name        = var.db_name
#   db_user        = var.db_user
#   db_password    = var.db_password
# }


resource "aws_instance" "wordpress_instance" {
  ami                    = "ami-0e8d228ad90af673b"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]
  subnet_id = aws_subnet.public.id

  user_data = <<-EOF
              #!/bin/bash
              # Update and install necessary packages
              apt-get update -y
              apt-get install -y apache2 php libapache2-mod-php mysql-client wget

              # Start and enable the HTTP server
              systemctl start apache2
              systemctl enable apache2

              # Download and set up WordPress
              cd /var/www/html
              wget https://wordpress.org/latest.tar.gz
              tar -xzf latest.tar.gz
              cp -r wordpress/* .
              rm -rf wordpress latest.tar.gz

              # Set permissions
              chmod -R 755 wp-content
              chown -R www-data:www-data wp-content

              # Enable mod_rewrite for Apache (needed for permalinks in WordPress)
              a2enmod rewrite
              systemctl restart apache2

              # Create wp-config.php with RDS details
              cat <<EOT > /var/www/html/wp-config.php
              <?php
              define('DBNAME', 'wordpress');
              define('DB_USER', 'admin');
              define('DB_PASSWORD', 'your_password');
              define('DB_HOST', '${aws_db_instance.default.endpoint}');
              define('DB_CHARSET', 'utf8');
              define('DB_COLLATE', '');

              $table_prefix = 'wp';
              define('WPDEBUG', false);

              if ( !defined('ABSPATH') )
              define('ABSPATH', dirname(__FILE__) . '/');
              require_once(ABSPATH . 'wp-settings.php');
              EOF

  tags = {
    Name = "WordPressInstance"
  }
}

resource "aws_security_group" "wordpress_sg" {
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTPS traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress_sg"
  }
}

# VPC AND SECURITY GROUPS

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "WordPressVPC"
  }
}

resource "aws_subnet" "public" {
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private" {
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id
  tags = {
    Name = "PrivateSubnet"
  }
}

resource "aws_subnet" "private2" {
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id
  tags = {
    Name = "PrivateSubnet2"
  }
}

resource "aws_nat_gateway" "private" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private.id
}

resource "aws_internet_gateway" "publicgateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

# RDS

resource "aws_db_subnet_group" "default" {
  name       = "wordpress-db-subnet-group" ###
  subnet_ids = [aws_subnet.private.id, aws_subnet.public.id]
  tags = {
    Name = "WordPressDBSubnetGroup"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.m5d.large"
  username               = "admin"
  password               = "your_password"
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]
  skip_final_snapshot = true                                           # Skips final snapshot

  tags = {
    Name = "WordPressDatabase"
  }
}

# Output the RDS endpoint
output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
} 

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.publicgateway.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.routetable.id
}