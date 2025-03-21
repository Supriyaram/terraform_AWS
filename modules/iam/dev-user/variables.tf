variable "user_name" {
    description = "The IAM username"
    type        = string
}

variable "group_name" {
    description = "The IAM group name"
    type        = string
}

variable "policy_arn" {
    description = "The ARN of the policy to attach"
    type        = string
}

variable "tags" {
    description = "A map of tags to apply to resources"
    type        = map(string)
    default     = {}
}

