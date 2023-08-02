
variable "fsx_deployment_type" {
  type        = string
  description = "FSx deployment type"
  default     = "MULTI_AZ_1"
  validation {
    condition     = can(regex("^SINGLE_AZ_1|SINGLE_AZ_2|MULTI_AZ_1$", var.fsx_deployment_type))
    error_message = "Must be one of `SINGLE_AZ_1` or `SINGLE_AZ_2` or `MULTI_AZ_1`."
  }
}

variable "fsx_storage_type" {
  type        = string
  description = "FSx storage type"
  default     = "SSD"
  validation {
    condition     = can(regex("^SSD|HDD$", var.fsx_storage_type))
    error_message = "Must be one of `SSD` or `HDD`."
  }
}

variable "aws_directory_service_directory_id" {
  type        = string
  description = "Directory ID"
  default     = "d-90679ff8f5"
}
variable "ad_name" {
  type        = string
  description = "AD name (FQDN), in the format `example.com`"
  default     = "example.com"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
  default     = ["subnet-054d0f7e614d00931", "subnet-03ea0bce90603cf7a"]
  #preferred_subnet_id = "subnet-054d0f7e614d00931"
  #Standby_subnet_id = "subnet-03ea0bce90603cf7a"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = "vpc-00bad80ece8c7a8b1"
}

variable "aws_kms_key_name" {
  type        = string
  description = "value"
  default     = "aws/fsx(default)"

}

variable "aws_security_group_ids" {
  type        = string
  description = "security group ID are matched with VPC 'default'"
  default     = "sg-02ae9580c6d6e8527"
}

variable "fsx_storage_capacity" {
  type        = number
  description = "FSx Storage capacity"
  default     = 32
}

variable "fsx_throughput_capacity" {
  type        = number
  description = "FSx throughput capacity"
  default     = 8
}

variable "fsx_skip_final_backup" {
  type        = bool
  description = "Skip final FSx backup?"
  default     = true
}


variable "fsx_file_system_name" {
  type        = string
  description = "Name of the FSx Windows file system"
  default     = "File Server"
}
