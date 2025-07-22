############################### Example-1 name with count #############
# resource "aws_instance" "name" {
#     ami = "ami-05ffe3c48a9991133"
#     instance_type = "t2.micro"
#     count = 3
#     # tags ={
#     #     Name = "dev"
#     # }
#      tags ={
#         Name = "dev-${count.index}"
#     }
  
# }

# #example-3 creating IAM users 
variable "user_names" {
  description = "IAM usernames"
   type        = list(string)
   default     = ["user1", "user2", "user4", "user5"]
 }
 resource "aws_iam_user" "example" {
   count = length(var.user_names)
   name  = var.user_names[count.index]
 }