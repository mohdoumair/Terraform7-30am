variable "cidr_block" {
    type = string  
}
variable "subnet_cidr_1" {
    type = string 
}
variable "subnet_cidr_2" {
    type = string 
}

variable "az_1" {
    type = string
  
}
variable "az_2" {
    type = string
  
}


variable "ami_id" {
   type = string   
}
variable "instance_type" {
    type =  string
}
variable "instance_class" {
    type = string
  
}
variable "db_name" {
    type = string
  
}
variable "db_password" {
    type = string
  
}
variable "db_user" {
    type = string
  
}