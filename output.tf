output "instance_public_ip" {
  description = "public_ip of the instance"
  value = aws_instance.my_instance.public_ip
}