variable "rds_snapshot_arn" {
  type        = string
  description = "(Required) The public snapshot arn."
}

variable "rds_db_password" {
  type        = string
  description = "(Required) Password for the master DB user."
}
