resource "aws_instance" "name"{
    instance_type = var.instance_type
    ami=var.aws_instance
    availability_zone = var.availability_zone
    #ey_name = var.instance_type
}