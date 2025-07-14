resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name="custom_vpc"
  }

}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
      name="publicsubnet"
    }
  
}
  
  resource "aws_subnet" "private" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    tags = {
      name="privatesubnet"
    }
    
  }

  resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.name.id
    tags = {
      name="igw"
    }
    
  }
    resource "aws_eip" "nat_eip" {
    tags = {
      name = "nat_eip"
    }
      
    }



  resource "aws_nat_gateway" "customnat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public.id
    tags = {
      name="customnat"
    }
    
  }  

 resource "aws_route_table" "public" {
    vpc_id =aws_vpc.name.id
    tags = {
        name= "public_routetable"
    }
 }
 resource "aws_route" "public_route" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
   
 }

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.name.id
    tags = {
      name = "private_routetable"
    }
}
 resource "aws_route" "private_route" {
    route_table_id = aws_route_table.private.id
    destination_cidr_block = "0.0.0.0/0"
     gateway_id=aws_nat_gateway.customnat.id   
 }
  
  resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id

    
  }

  resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
    
    }
