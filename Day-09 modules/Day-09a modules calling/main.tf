module "prod"{
    source = "../../Day-09 modules"
    aws_instance ="ami-05ffe3c48a9991133"
    #vailability_zone = "us-east-1"
    instance_type ="t2.micro"

  
}