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
  region = "eu-west-1"
}

#############Security Group###################

resource "aws_security_group" "Group18-DevSecOps" {
  name        = "security-group18-terraform"
  description = "security-group18-terraform"
  vpc_id      = "vpc-0c735787e36a3c094"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Group18-DevSecOps"
  }
}



resource "aws_instance" "app_server" {
  ami                    = "ami-096800910c1b781ba"
  instance_type          = "t2.medium"
  key_name               = "devops18"
  vpc_security_group_ids = ["${aws_security_group.Group18-DevSecOps.id}"]
   user_data              =  file("script.sh")
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file("devops18.pem")
  }

  provisioner "file" {
    source      = "exec_scripts"
    destination = "/home/ubuntu"
  }


  provisioner "remote-exec" {
    # scripts = ["./exec_scripts/envsetup.sh", "./exec_scripts/service.sh"]
    inline = [
       "sudo chmod -R 777 /home/ubuntu/exec_scripts",
       "./exec_scripts/envsetup.sh",
       "./exec_scripts/service.sh"
    ]
  }

  tags = {
    Name = "group18-terraform"
  }
}
