resource "aws_instance" "prometheus-instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data = file("${path.module}/provision.sh")
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = format("%s-%s-ec2", var.project_name, var.environment)
  }
}
