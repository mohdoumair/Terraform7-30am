
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      
    }
  
}
  resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
      name = "subnet1a"
    }
 }
   resource "aws_subnet" "subnet_2" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.name.id
    availability_zone = "us-east-1b"
        tags = {
          name = "subnet2"
    }
   } 
   resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             =  data.aws_secretsmanager_secret_version.rds_secret_version.secret_string["username"]
  password             = data.aws_secretsmanager_secret_version.rds_secret_version.secret_string["password"]
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true  
}

   
      resource "aws_db_subnet_group" "default" {
       name = "mycutsubnets" 
       subnet_ids = [aws_subnet.subnet_1.id,aws_subnet.subnet_2.id]
      }
      resource "aws_secretsmanager_secret" "rds_secret" {
  name        = "rds-mysql-secret"
  description = "Credentials for MySQL RDS instance"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = "Activa$1"
  })
}
resource "aws_secretsmanager_secret_rotation" "rds_rotation" {
  secret_id           = aws_secretsmanager_secret.rds_secret.id
  rotation_lambda_arn = "arn:aws:lambda:us-east-1:669597026109:function:SecretsManagerRDSMySQLRotationSingleUser"

  rotation_rules {
    automatically_after_days = 30
  }
}

