variable "default_tags" {
  type = map(string)
  default = {
    "env" = "gmarts"
  }
  description = "Description for my variable"
}

variable "public_subnet_count" {
  type    = number
  default = 2
}
variable "private_subnet_count" {
  type    = number
  default = 2
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "sg_db_ingress" {
  type = map(object({
    port     = number
    protocol = string
    self     = bool
  }))
  default = {
    "postgresql" = {
      port     = 5432
      protocol = "tcp"
      self     = true
    }
  }
}

variable "sg_db_egress" {
  type = map(object({
    port     = number
    protocol = string
    self     = bool
  }))
  default = {
    "all" = {
      port     = 0
      protocol = "-1"
      self     = true
    }
  }
}

variable "db_credentials" {
  type = map(any)
  sensitive = true 
  default = {
    username = "username"
    password = "password"
  }
}