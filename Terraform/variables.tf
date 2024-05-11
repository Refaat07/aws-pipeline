variable "vpc_cidr" {
  type        = string
  description = "description"
}

variable "common_resource_name" {
  type        = string
  default= "mrefaat"
  description = "description"
}

variable "region" {
  type        = string
  description = "description"
}


variable "machine_details" {
  type        = object({
    type = string,
    public_ip = bool
  })
  description = "description"
}


variable subnets_details {
  type        = list(object({
    name = string,
    cidr = string,
    type = string,
    az = string
  }))
  description = "description"
}

