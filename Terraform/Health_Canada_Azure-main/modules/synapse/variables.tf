variable "synapse_name" {
  description = "The name of the Synapse workspace"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location where the resources will be created"
  type        = string
}

variable "datalake_id" {
  description = "The ID of the Data Lake Gen 2 filesystem"
  type        = string
}
