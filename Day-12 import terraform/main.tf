resource "aws_instance" "name" {
    ami = "ami-0cbbe2c6a1bb2ad63"
    availability_zone = "us-east-1d"
    instance_type = "t2.micro"
    tags = {
      Name = "webserver"
    }

}