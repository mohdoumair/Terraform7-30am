terraform {
  backend "s3" {
    bucket = "awjydfwadyhgawef"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #use lockfile = true
    dynamodb_table = "mynewtable"
    encrypt = false 
  }
}
