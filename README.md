# terraform-aws-amazonmq

Magicorn made Terraform Module for AWS Provider
--
```
module "amazonmq" {
  source         = "magicorntech/amazonmq/aws"
  version        = "0.0.1"
  tenant         = var.tenant
  name           = var.name
  environment    = var.environment
  vpc_id         = var.vpc_id
  cidr_block     = var.cidr_block
  subnet_ids     = var.subnet_ids
  kms_key_id     = var.mq_key_id

  # Amazon MQ Configuration
  mq_name                    = "master"
  multi_az                   = false
  instance_type              = "mq.t3.micro"
  engine_version             = "3.10.20"
  maintenance_day            = "SUNDAY"
  maintenance_time           = "01:00"
  auto_minor_version_upgrade = false
  apply_immediately          = true
}
```

## Notes
1) Works better with magicorn-aws-kms module.