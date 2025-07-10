resource "aws_instance" "name" {
    instance_type = var.instance_type
    ami = var.aws_instance

  
} 
resource "aws_s3_bucket" "name" {
    bucket = var.aws_s3_bucket
  
}
  
