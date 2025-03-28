variable "user_name" {
    description = "The IAM username"
    type        = string
}

variable "group_name" {
    description = "The IAM group name"
    type        = string
}

variable "policy_arns" {
  type    = list(string)
  
}

variable "tags" {
    description = "A map of tags to apply to resources"
    type        = map(string)
    default     = {}
}

