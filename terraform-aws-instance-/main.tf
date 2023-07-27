terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {

  region = "ap-south-1" //setup according to ami
}

resource "aws_instance" "my-machine" {
  count = 2
  ami   = "ami-08c40ec9ead489470"
  //"ami-062df10d14676e201" was used to testing purpose with region "ap-south-1"
  instance_type = "t2.micro"
  tags = {
    Name = "my-machine-${count.index}"
  }

}

// Third instance after first two have been created and applied. Just uncomment it.

/* resource "aws_instance" "my-machine-new" {
  count         = 1
  ami           = "ami-06640050dc3f556bb" 
  // Amazon Linux 2 AMI (HVM), SSD Volume Type with ami-074dc0a6f6c764218 was used for testingwith region "ap-south-1"
  instance_type = "t2.micro"
  tags = {
    Name = "my-machine-new-${count.index}"
  }

} */


