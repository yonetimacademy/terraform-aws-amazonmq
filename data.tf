data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  subnet_set = (
    (var.multi_az == true) ? var.subnet_ids : false ||
    (var.multi_az == false) ? [var.subnet_ids[0]] : [""]
  )
}

resource "random_string" "mquser" {
  length  = 12
  numeric = false
  special = false
}

resource "random_password" "mqpass" {
  length           = 16
  special          = true
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 2
  min_special      = 2
  override_special = "!#$%&*()-_+[]{}<>?"
}