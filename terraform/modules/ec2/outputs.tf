output "instance_public_ip" {
  value = aws_instance.prometheus-instance.public_ip
}
