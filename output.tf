output "public-ip" {
  value = aws_instance.MY_SVR_EC2_TF1.public_ip
}
output "My_username" {
  value = aws_instance.MY_SVR_EC2_TF1.security_groups
}
output "my_key" {
  value = aws_instance.MY_SVR_EC2_TF1.key_name
}