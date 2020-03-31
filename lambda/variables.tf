variable "name" {}

variable "environments" {
  default = {}
  type    = map
}

variable "timeout" {
  default = 10
}
