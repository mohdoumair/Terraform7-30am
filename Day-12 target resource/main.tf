resource "aws_instance" "name" {
     ami = "ami-0cbbe2c6a1bb2ad63"
    availability_zone = "us-east-1d"
    instance_type = "t2.micro"
   
}


resource "aws_s3_bucket" "name" {
    bucket = "eriufh45f4iih54tg"
  
}

# terraform plan --target=aws_instance.name