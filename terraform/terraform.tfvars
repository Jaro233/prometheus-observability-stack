region        = "us-east-1"
instance_type = "t2.micro"
ami_id        = "ami-0c7217cdde317cfec"
key_name      = "ec2_apache"
vpc_id        = "vpc-01707bb84c39d0cec"
my_ip         = "91.189.139.56/32"
environment   = "dev"
project_name  = "prometheus-stack"

ingress_rules = [
  {
    from_port   = 22,
    to_port     = 22,
    protocol    = "tcp",
    cidr_blocks = ["91.189.139.56/32"],
    description = "SSH Access"
  },
  {
    from_port   = 80,
    to_port     = 80,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"],
    description = "HTTP Access"
  },
  {
    from_port   = 443,
    to_port     = 443,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"],
    description = "HTTPS Access"
  },
  {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Grafana access"
  },
  {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Prometheus access"
  },
  {
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Alert man ager access"
  },
  {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "node exporter access"
  },

]

egress_rules = [{
  description      = "All traffic out"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = []
  prefix_list_ids  = []
  security_groups  = []
  self             = false
}]
  