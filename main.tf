terraform {
  required_version = ">= 0.10.3" # introduction of Local Values configuration language feature
}

provider "aws" {
  region = var.region
}

resource "aws_key_pair" "terraform_ec2_key" {
  key_name   = "terraform_ec2_key"
  public_key = file("./.ssh/terraform.pub")
}

module "mgmt_vpc" {
  source = "github.com/interrobangc/terraform-aws-vpc?ref=v0.2.2"
  env    = var.mgmt_env

  azs = var.mgmt_azs

  create_vpc       = var.create_mgmt_vpc
  cidr             = var.mgmt_cidr
  private_subnets  = var.mgmt_private_subnets
  public_subnets   = var.mgmt_public_subnets
  database_subnets = var.mgmt_database_subnets

  redshift_subnets    = var.mgmt_redshift_subnets
  elasticache_subnets = var.mgmt_elasticache_subnets
  intra_subnets       = var.mgmt_intra_subnets

  map_public_ip_on_launch = var.map_public_ip_on_launch

  create_database_subnet_group = var.mgmt_create_database_subnet_group
  enable_nat_gateway           = var.mgmt_enable_nat_gateway
  single_nat_gateway           = var.mgmt_single_nat_gateway
  enable_vpn_gateway           = var.mgmt_enable_vpn_gateway
}

module "mgmt_sg" {
  source = "github.com/interrobangc/terraform-aws-security-groups?ref=v0.2.1"
  env    = var.mgmt_env

  create_security_groups = var.create_mgmt_vpc

  vpc_id = module.mgmt_vpc.id
}

module "prod_vpc" {
  source = "github.com/interrobangc/terraform-aws-vpc?ref=v0.2.2"
  env    = var.prod_env

  azs = var.prod_azs

  create_vpc       = var.create_prod_vpc
  cidr             = var.prod_cidr
  private_subnets  = var.prod_private_subnets
  public_subnets   = var.prod_public_subnets
  database_subnets = var.prod_database_subnets

  redshift_subnets    = var.prod_redshift_subnets
  elasticache_subnets = var.prod_elasticache_subnets
  intra_subnets       = var.prod_intra_subnets

  map_public_ip_on_launch = var.map_public_ip_on_launch

  create_database_subnet_group = var.prod_create_database_subnet_group
  enable_nat_gateway           = var.prod_enable_nat_gateway
  single_nat_gateway           = var.prod_single_nat_gateway
  enable_vpn_gateway           = var.prod_enable_vpn_gateway
}

module "prod_sg" {
  source = "github.com/interrobangc/terraform-aws-security-groups?ref=v0.2.1"

  create_security_groups = var.create_mgmt_vpc ? var.create_prod_vpc : false

  env    = var.prod_env
  vpc_id = module.prod_vpc.id
}

module "prod_vpc_peering" {
  source = "github.com/interrobangc/terraform-aws-vpc-peering?ref=v0.2.2"

  create_vpc_peering = var.create_prod_vpc

  owner_account_id = ""
  vpc_peer_id      = module.prod_vpc.id
  vpc_id           = module.mgmt_vpc.id

  source_private_route_count     = 1
  source_private_route_table_ids = module.mgmt_vpc.private_route_table_ids
  source_public_route_count      = 1 # only one public route table is created
  source_public_route_table_ids  = module.mgmt_vpc.public_route_table_ids
  source_peer_cird_block         = var.mgmt_cidr
  target_private_route_count     = 1
  target_private_route_table_ids = module.prod_vpc.private_route_table_ids
  target_public_route_count      = 1 # only one public route table is created
  target_public_route_table_ids  = module.prod_vpc.public_route_table_ids
  target_peer_cird_block         = var.prod_cidr
  auto_accept_peering            = true
}

module "dev_vpc" {
  source = "github.com/interrobangc/terraform-aws-vpc?ref=v0.2.2"
  env    = var.dev_env

  azs = var.dev_azs

  create_vpc       = var.create_dev_vpc
  cidr             = var.dev_cidr
  private_subnets  = var.dev_private_subnets
  public_subnets   = var.dev_public_subnets
  database_subnets = var.dev_database_subnets

  redshift_subnets    = var.dev_redshift_subnets
  elasticache_subnets = var.dev_elasticache_subnets
  intra_subnets       = var.dev_intra_subnets

  map_public_ip_on_launch = var.map_public_ip_on_launch

  create_database_subnet_group = var.dev_create_database_subnet_group
  enable_nat_gateway           = var.dev_enable_nat_gateway
  single_nat_gateway           = var.dev_single_nat_gateway
  enable_vpn_gateway           = var.dev_enable_vpn_gateway
}

module "dev_sg" {
  source = "github.com/interrobangc/terraform-aws-security-groups?ref=v0.2.1"

  create_security_groups = var.create_dev_vpc

  env    = var.dev_env
  vpc_id = module.dev_vpc.id
}

module "dev_vpc_peering" {
  source = "github.com/interrobangc/terraform-aws-vpc-peering?ref=v0.2.2"

  create_vpc_peering = var.create_mgmt_vpc ? var.create_dev_vpc : false

  owner_account_id = ""
  vpc_peer_id      = module.dev_vpc.id
  vpc_id           = module.mgmt_vpc.id

  source_private_route_count     = 1
  source_private_route_table_ids = module.mgmt_vpc.private_route_table_ids
  source_public_route_count      = 1 # only one public route table is created
  source_public_route_table_ids  = module.mgmt_vpc.public_route_table_ids
  source_peer_cird_block         = var.mgmt_cidr
  target_private_route_count     = 1
  target_private_route_table_ids = module.dev_vpc.private_route_table_ids
  target_public_route_count      = 1 # only one public route table is created
  target_public_route_table_ids  = module.dev_vpc.public_route_table_ids
  target_peer_cird_block         = var.dev_cidr
  auto_accept_peering            = true
}

module "bastion" {
  source = "github.com/interrobangc/terraform-aws-bastion?ref=v0.2.9"
  env    = var.mgmt_env
  ami    = var.bastion_ami

  vpc_id        = module.mgmt_vpc.id
  vpc_ids_count = 3
  vpc_ids       = [
    module.mgmt_vpc.id,
    module.dev_vpc.id,
    module.prod_vpc.id,
  ]

  key_name = "terraform_ec2_key"

  instance_type = var.bastion_instance_type

  security_groups = [
    module.mgmt_sg.public_ssh,
    module.mgmt_sg.allow_egress,
  ]

  # count can't be calculated, so we have to get it from a hard variable
  bastion_count = var.create_mgmt_vpc ? var.bastion_count : 0
  subnets = module.mgmt_vpc.public_subnets
}
