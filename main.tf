resource "aws_instance" "MY_SVR_EC2_TF1" {
  ami =  "ami-0eaf7c3456e7b5b68"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  key_name = aws_key_pair.aws_key.key_name
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [ aws_security_group.my_security_group ]
  user_data = file("server-config.sh")
  associate_public_ip_address = true
  tags = {
    Name = "MY_SVR_EC2_TF1"
    Team      = "Devops"
    env       = "Dev - Team"
    create_by = "Yohanan - Terraform"
  }
}

resource "aws_ebs_volume" "Volumme_01" {
  availability_zone = aws_instance.MY_SVR_EC2_TF1.availability_zone
  size = 40
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.Volumme_01.id
  instance_id = aws_instance.MY_SVR_EC2_TF1.id
}

