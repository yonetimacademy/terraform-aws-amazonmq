resource "aws_ssm_parameter" "main_rmq_console_url" {
  name        = "/${var.tenant}/${var.name}/${var.environment}/amazonmq/${var.mq_name}/console_url"
  description = "Managed by Magicorn"
  type        = "SecureString"
  value       = aws_mq_broker.rmq.instances.0.console_url

  tags = {
    Name        = "${var.tenant}-${var.name}-${var.environment}-amazonmq-${var.mq_name}-console-url"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}

resource "aws_ssm_parameter" "main_rmq_endpoint" {
  name        = "/${var.tenant}/${var.name}/${var.environment}/amazonmq/${var.mq_name}/endpoint"
  description = "Managed by Magicorn"
  type        = "SecureString"
  value       = aws_mq_broker.rmq.instances.0.endpoints.0

  tags = {
    Name        = "${var.tenant}-${var.name}-${var.environment}-amazonmq-${var.mq_name}-endpoint"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}

resource "aws_ssm_parameter" "main_rmq_user" {
  name        = "/${var.tenant}/${var.name}/${var.environment}/amazonmq/${var.mq_name}/user"
  description = "Managed by Magicorn"
  type        = "SecureString"
  value       = random_string.mquser.result

  tags = {
    Name        = "${var.tenant}-${var.name}-${var.environment}-amazonmq-${var.mq_name}-user"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}

resource "aws_ssm_parameter" "main_rmq_pass" {
  name        = "/${var.tenant}/${var.name}/${var.environment}/amazonmq/${var.mq_name}/pass"
  description = "Managed by Magicorn"
  type        = "SecureString"
  value       = random_password.mqpass.result

  tags = {
    Name        = "${var.tenant}-${var.name}-${var.environment}-amazonmq-${var.mq_name}-pass"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}