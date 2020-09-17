resource "aws_default_vpc" "default" {}

resource "aws_security_group" "this" {
  name   = "allow_from_anywhere"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "this" {
  snapshot_identifier     = var.rds_snapshot_arn
  instance_class          = "db.t2.micro"
  publicly_accessible     = true
  name                    = null
  skip_final_snapshot     = true
  password                = var.rds_db_password
  backup_retention_period = 0
  vpc_security_group_ids  = [aws_security_group.this.id]
}
