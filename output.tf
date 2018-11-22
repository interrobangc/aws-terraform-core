output "bastion_public_ip" {
  value = "${module.bastion.public_ip}"
}

output "vpc_ids" {
  value = "${map(
    "dev", "${module.dev_vpc.id}",
    "prod", "${module.prod_vpc.id}",
    "mgmt", "${module.mgmt_vpc.id}",
  )}"
}

output "data" {
  value = "${map(
    "dev", map(
      "sgs", map(
        "public_web", "${module.dev_sg.public_web}",
        "public_ssh", "${module.dev_sg.public_ssh}",
        "allow_egress", "${module.dev_sg.allow_egress}",
        "bastion_ssh", "${module.bastion.sg_ssh_allow_bastion[1]}",
      ),
      "subnets", map(
        "private", "${module.dev_vpc.private_subnets}",
        "public", "${module.dev_vpc.public_subnets}",
        "database", "${module.dev_vpc.database_subnets}",
        "natgw_ids", "${module.dev_vpc.natgw_ids}",
        "azs", "${var.dev_azs}",
      ),
      "vars", map(
        "database_subnet_group", "${module.dev_vpc.database_subnet_group}",
        "elasticache_subnets", "${module.dev_vpc.elasticache_subnets}",
        "elasticache_subnet_group", "${module.dev_vpc.elasticache_subnet_group}",
        "elasticache_subnet_group_name", "${module.dev_vpc.elasticache_subnet_group_name}",
        "redshift_subnets", "${module.dev_vpc.redshift_subnets}",
        "redshift_subnets", "${module.dev_vpc.redshift_subnets}",
      ),
    ),
    "prod", map(
      "sgs", map(
        "public_web", "${module.prod_sg.public_web}",
        "public_ssh", "${module.prod_sg.public_ssh}",
        "allow_egress", "${module.prod_sg.allow_egress}",
        "bastion_ssh", "${module.bastion.sg_ssh_allow_bastion[2]}",
      ),
      "subnets", map(
        "private", "${module.prod_vpc.private_subnets}",
        "public", "${module.prod_vpc.public_subnets}",
        "database", "${module.prod_vpc.database_subnets}",
        "natgw_ids", "${module.prod_vpc.natgw_ids}",
        "azs", "${var.prod_azs}",
      ),
      "vars", map(
        "database_subnet_group", "${module.prod_vpc.database_subnet_group}",
        "elasticache_subnets", "${module.prod_vpc.elasticache_subnets}",
        "elasticache_subnet_group", "${module.prod_vpc.elasticache_subnet_group}",
        "elasticache_subnet_group_name", "${module.prod_vpc.elasticache_subnet_group_name}",
        "redshift_subnets", "${module.prod_vpc.redshift_subnets}",
        "redshift_subnets", "${module.prod_vpc.redshift_subnets}",
      ),
    ),
    "mgmt", map(
      "sgs", map(
        "public_web", "${module.mgmt_sg.public_web}",
        "public_ssh", "${module.mgmt_sg.public_ssh}",
        "allow_egress", "${module.mgmt_sg.allow_egress}",
        "bastion_ssh", "${module.bastion.sg_ssh_allow_bastion[0]}",
      ),
      "subnets", map(
        "private", "${module.mgmt_vpc.private_subnets}",
        "public", "${module.mgmt_vpc.public_subnets}",
        "database", "${module.mgmt_vpc.database_subnets}",
        "natgw_ids", "${module.mgmt_vpc.natgw_ids}",
        "azs", "${var.mgmt_azs}",
      ),
      "vars", map(
        "database_subnet_group", "${module.mgmt_vpc.database_subnet_group}",
        "elasticache_subnets", "${module.mgmt_vpc.elasticache_subnets}",
        "elasticache_subnet_group", "${module.mgmt_vpc.elasticache_subnet_group}",
        "elasticache_subnet_group_name", "${module.mgmt_vpc.elasticache_subnet_group_name}",
        "redshift_subnets", "${module.mgmt_vpc.redshift_subnets}",
        "redshift_subnets", "${module.mgmt_vpc.redshift_subnets}",
      ),
    )
  )}"
}
