variable "environment" {
  description = "Specify the environment indentifier for the VPC"
  type        = string
  default     = ""
}

variable "name" {
  description = "Specify the name of the VPC"
  type        = string
  default     = ""

}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  default     = "10.0.0.0/16"
  type        = string
}

variable "availability_zones" {
  description = "Number of Availability Zone to be used by VPC Subnets"
  default     = []
  type        = list(any)
}

variable "public_subnet_enabled" {
  description = "Set true to enable public subnets"
  default     = false
  type        = bool
}

variable "public_subnet_cidrs" {
  description = "A list of public subnets CIDR to be created inside the VPC"
  default     = []
  type        = list(any)
}

variable "private_subnet_enabled" {
  description = "Set true to enable private subnets"
  default     = false
  type        = bool
}

variable "private_subnet_cidrs" {
  description = "A list of private subnets CIDR to be created inside the VPC"
  default     = []
  type        = list(any)
}

variable "database_subnet_enabled" {
  description = "Set true to enable database subnets"
  default     = false
  type        = bool
}

variable "database_subnet_cidrs" {
  description = "Database Tier subnet CIDRs to be created"
  default     = []
  type        = list(any)
}

variable "intra_subnet_enabled" {
  description = "Set true to enable intra subnets"
  default     = false
  type        = bool
}

variable "intra_subnet_cidrs" {
  description = "A list of intra subnets CIDR to be created"
  default     = []
  type        = list(any)
}

variable "vpn_server_enabled" {
  description = "Set to true if you want to deploy VPN Gateway resource and attach it to the VPC"
  default     = false
  type        = bool
}

variable "vpn_server_instance_type" {
  description = "EC2 instance Type for VPN Server, Only amd64 based instance type are supported eg. t2.medium, t3.micro, c5a.large etc. "
  default     = "t3a.small"
  type        = string
}

variable "vpn_key_pair_name" {
  description = "Specify the name of AWS Keypair to be used for VPN Server"
  default     = ""
  type        = string
}

variable "default_network_acl_ingress" {
  description = "List of maps of ingress rules to set on the Default Network ACL"
  type        = list(map(string))

  default = [
    {
      rule_no    = 98
      action     = "deny"
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no    = 99
      action     = "deny"
      from_port  = 3389
      to_port    = 3389
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no    = 100
      action     = "allow"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no         = 101
      action          = "allow"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "one_nat_gateway_per_az" {
  description = "Set to true if a NAT Gateway is required per availability zone for Private Subnet Tier"
  default     = false
  type        = bool
}

variable "flow_log_enabled" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group for VPC flow logs."
  type        = number
  default     = null
}

variable "flow_log_max_aggregation_interval" {
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds."
  type        = number
  default     = 60
}

variable "auto_assign_public_ip" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  type        = bool
  default     = false
}


variable "ipv6_enabled" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
  type        = bool
  default     = false
}

variable "private_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on private subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "public_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on public subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}


variable "database_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on database subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}


variable "intra_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on intra subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "flow_log_cloudwatch_log_group_kms_key_arn" {
  description = "The ARN of the KMS Key to use when encrypting log data for VPC flow logs"
  type        = string
  default     = null
}

variable "ipv6_only" {
  description = "Enable it for deploying native IPv6 network"
  type        = bool
  default     = false
}

variable "secondary_cidr_blocks" {
  description = "List of the secondary CIDR blocks which can be at most 5"
  type        = list(string)
  default     = []
}

variable "secondry_cidr_enabled" {
  description = "Whether enable secondary CIDR with VPC"
  default     = false
  type        = bool
}

variable "enable_database_subnet_group" {
  description = "Whether create database subnet groups"
  default     = false
  type        = bool
}

# variable "tags" {
#   description = "The Tags attached with the resources"
#   default = {}
#   type = any
# }

variable "ipam_pool_id" {
  description = "The existing IPAM pool id if any"
  default     = null
  type        = string
}

variable "ipam_enabled" {
  description = "Whether enable IPAM managed VPC or not"
  default     = false
  type        = bool
}

variable "create_ipam_pool" {
  description = "Whether create new IPAM pool"
  default     = true
  type        = bool
}

variable "ipv4_netmask_length" {
  description = "The netmask length for IPAM managed VPC"
  default     = 16
  type        = number
}

variable "region" {
  description = "The AWS region name"
  type        = string
  default     = null
}

variable "existing_ipam_managed_cidr" {
  description = "The existing IPAM pool CIDR"
  default     = ""
  type        = string
}
