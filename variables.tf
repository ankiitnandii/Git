variable "number_of_subnets" {
  type        = number
  description = "Enter the number of subnets"
  default     = 2
  validation {
    condition     = var.number_of_subnets < 5
    error_message = "Enter a number below 5."
  }
}

variable "number_of_machines" {

  type        = number
  description = "Enter the number of subnets"
  default     = 2
  validation {
    condition     = var.number_of_machines < 4
    error_message = "Enter a number below 4."
  }
}

/*variable "storage_account_name" {
  type = string
  description = "Enter the prefix of the srorage account name"
  
}*/