resource "aws_instance" "jenkins_server" {
    ami = var.AMI
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
    key_name = aws_key_pair.mykeypair.key_name
    # the security group
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    user_data = file("install_jenkins.sh")
    tags = {
       Name = "Jenkins-Server"
    }
}