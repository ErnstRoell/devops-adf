variable "location" {
  type = string
  default = "westeurope"
}

variable "suffix" {
  type = string
  default = "7381a"
}

variable "tenant_id" {
  type = string
  default = "72f988bf-86f1-41af-91ab-2d7cd011db47"
}

###################################
# Resource Groups
##################################

variable "resource_group_dev" {
  type = string
  default = "demo-devops-dev"
}


variable "resource_group_test" {
  type = string
  default = "demo-devops-test"
}


variable "resource_group_prod" {
  type = string
  default = "demo-devops-prod"
}


variable "resource_group_mgmt" {
  type = string
  default = "demo-devops-mgmt"
}


###################################
# Storage
##################################

variable "storage_dev" {
  type = string
  default = "demostorage7381dev"
}

variable "storage_test" {
  type = string
  default = "demostorage7381test"
}

variable "storage_prod" {
  type = string
  default = "demostorage7381prod"
}

###################################
# ADF
##################################

variable "adf_dev" {
  type = string
  default = "demo-devops-adf-dev"
}

variable "adf_test" {
  type = string
  default = "demo-devops-adf-test"
}

variable "adf_prod" {
  type = string
  default = "demo-devops-adf-prod"
}

###################################
#  KV
##################################

variable "kv_dev" {
  type = string
  default = "demo-devops-kv2-dev"
}

variable "kv_test" {
  type = string
  default = "demo-devops-kv2-test"
}

variable "kv_prod" {
  type = string
  default = "demo-devops-kv2-prod"
}

