resource "aws_instance" "this" {
  ami                     = "ami-0e8d228ad90af673b"
  instance_type           = "t2.micro"
}

resource "aws_instance" "wordpress_instance" {
  ami           = "ami-0e8d228ad90af673b"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  security_groups = [aws_security_group.wordpress_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y apache2 php libapache2-mod-php mysql-client
              apt install -y php-mysql
              systemctl start apache2
              systemctl enable apache2
              
              # Download and configure WordPress
              cd /var/www/html
              wget -c http://wordpress.org/latest.tar.gz
              tar -xzvf latest.tar.gz
              cp -R wordpress/* .
              chown -R www-data:www-data /var/www/html/*
              chmod -R 755 /var/www/html/*
              
              # Configure WordPress
              cp wp-config-sample.php wp-config.php
              sed -i "s/database_name_here/${var.db_name}/" wp-config.php
              sed -i "s/username_here/${var.db_user}/" wp-config.php
              sed -i "s/password_here/${var.db_password}/" wp-config.php
              EOF

  tags = {
    Name = "WordPressInstance"
  }
}

resource "aws_security_group" "wordpress_sg" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress_sg"
  }
}
