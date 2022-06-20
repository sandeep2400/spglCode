#  variables.tf

variable "domain_name" {
  type        = string
  description = "Domain name of the website"
}

variable "domain_origin" {
  type        = string
  description = "Origin of the CloudFront Distribution"
}

variable "tags" {
  type        = map(any)
  description = "Tags for all resource"
}