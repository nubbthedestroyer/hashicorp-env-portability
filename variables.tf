variable "azs" {
  type = "list"
}

# CIDR block to use for the Magento environment, e.g. "172.18.0.0/16"
variable "cidr" {}

# If no, nat gateways will not be deployed so private subnets have no outbound communication.
variable "nat_gateways" {
  default = true
}

# Name of the environment for which the Magento environment is being deployed.
variable "environment" {}

# Name of the Magento environment, which will be used for all default tagging.
variable "name" {
  default = "magento"
}

# List of private subnets to create in the Magento environment, e.g. ["172.18.0.0/21", "172.18.8.0/21"]
variable "private_subnets" {
  type = "list"
}

# List of public subnets to create in the Magento environment, e.g. ["172.18.168.0/22", "172.18.172.0/22"]
variable "public_subnets" {
  type = "list"
}
