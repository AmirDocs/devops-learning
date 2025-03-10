resource "aws_db_subnet_group" "default" {
  name       = "wordpress-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "WordPressDBSubnetGroup"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage   = 20
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t2.micro"
  username          = "admin"
  password          = "your_password"
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [var.security_group]

  tags = {
    Name = "WordPressDatabase"
  }
}
