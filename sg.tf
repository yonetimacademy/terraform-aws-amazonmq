resource "aws_security_group" "main" {
  name        = "${var.tenant}-${var.name}-amazonmq-${var.mq_name}-sg-${var.environment}"
  description = "Managed by Magicorn"
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 5671
    to_port     = 5671
    cidr_blocks = [var.cidr_block]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    ignore_changes = [ingress]
  }

  tags = {
    Name        = "${var.tenant}-${var.name}-amazonmq-${var.mq_name}-sg-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}