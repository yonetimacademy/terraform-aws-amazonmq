resource "aws_mq_broker" "rmq" {
  broker_name                = "${var.tenant}-${var.name}-${var.mq_name}-${var.environment}"
  engine_type                = "RabbitMQ"
  engine_version             = var.engine_version
  host_instance_type         = var.instance_type
  deployment_mode            = (var.multi_az == true) ? "CLUSTER_MULTI_AZ" : "SINGLE_INSTANCE"
  security_groups            = [aws_security_group.main.id]
  publicly_accessible        = false
  subnet_ids                 = local.subnet_set
  authentication_strategy    = "simple"
  storage_type               = "ebs"
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  apply_immediately          = var.apply_immediately

  encryption_options {
    kms_key_id        = var.kms_key_id
    use_aws_owned_key = false
  }

  maintenance_window_start_time {
    day_of_week = var.maintenance_day
    time_of_day = var.maintenance_time
    time_zone   = "UTC"
  }

  user {
    username = random_string.mquser.result
    password = random_password.mqpass.result
  }

  tags = {
    Name        = "${var.tenant}-${var.name}-${var.mq_name}-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "yonetimacademy"
    Terraform   = "yes"
  }
}