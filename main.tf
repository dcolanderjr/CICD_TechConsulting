# This file contains the terraform code to create an ec2 instance, ebs volume, and security group.
# The code also creates an elastic ip for the ec2 instance.
# # For the EBS volume, I would recommend a minimum of 20GB, as Jenkins can consume a lot of space.
# 
provider "aws" {                           
    region = "ca-central-1"
}

# Jenkins-Master Configuration
resource "aws_instance" "jenkins-master" {     
    ami = "ami-05d4121edd74a9f06"
    instance_type = "t2.micro"
    key_name = "Jenkins-CICD"
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.pipe_line_jenkins.id]
    root_block_device {
        volume_size = 20
        volume_type = "gp2"
        delete_on_termination = true
        encrypted = false
        
        }
    

# Performs apt update, installs wget, sets hostname, installs openjdk-17-jre, and installs Jenkins - you
# can uncomment this block and comment the next block if you want to use user_data, and forgo the manual
# installation of the neessary updates.
 user_data  = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install openjdk-17-jre -y
    sudo apt install openjdk-8-jdk -y
    sudo apt install openjdk-11-jdk -y
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword > /home/ubuntu/intialAdminPassword.txt
    sudo hostnamectl set-hostname Jenkins-Master
    sudo apt-get install docker.io -y
    sudo usermod -aG docker $USER
    sudo init 6

  EOF

# Desired tags (optional, but recommended)
    tags = {                        
        Name = "Jenkins-Master"
        Terraform = "true"
        Environment = "dev"
        Project = "CI/CD"
    }
}

# Jenkins-Agent Configuration
resource "aws_instance" "jenkins-agent" {     
    ami = "ami-05d4121edd74a9f06"
    instance_type = "t2.micro"
    key_name = "Jenkins-CICD"
    associate_public_ip_address = true
    root_block_device {
        encrypted = false
        volume_size = 20
        volume_type = "gp2"
        delete_on_termination = true
        }

# Performs apt update, installs wget, sets hostname, installs openjdk-17-jre, and installs Jenkins
user_data  = <<-EOF
     #!/bin/bash
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install openjdk-17-jre -y
    sudo apt install openjdk-8-jdk -y
    sudo apt install openjdk-11-jdk -y
    sudo apt-get install docker.io -y
    sudo usermod -aG docker $USER
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    sudo hostnamectl set-hostname Jenkins-Agent
    sudo init 6
 
 EOF

# Desired tags (optional, but recommended)
    tags = {                        
        Name = "Jenkins-Agent"
        Terraform = "true"
        Environment = "dev"
        Project = "CI/CD"
    }
}

resource "aws_security_group" "Jenkins-SG" {       
    name = "Jenkins-SG"
    description = "Ingress_Egress_Rules"
    
    ingress {                               
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        description = "Allow Jenkins"
    }
    ingress {
        from_port = 9000
        to_port = 9000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        description = "Allow SonarQube"
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        description = "Allow SSH"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        description = "Allow all outbound traffic"
    }
}

resource "aws_eip" "jenkins-master" {       // 
    instance = aws_instance.jenkins-master.id
}

resource "aws_eip" "jenkins-agent" {       // 
    instance = aws_instance.jenkins-agent.id
}
