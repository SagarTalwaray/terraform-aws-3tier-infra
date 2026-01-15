variable "vpc_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "alb_cidr_ingress" {
  type = list(string)
}

variable "ssh_cidr_ingress" {
  type = list(string)
}

