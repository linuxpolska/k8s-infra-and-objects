variable "tags" {
  type    = list(string)
  default = ["hello-world", "change-it"]
}

variable "zone" {
  type = map
  default = {
    "Poland" = "europe-west3-a"
  }
}

variable "machine_type" {
  type = string
  default = "n1-standard-1"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "node_count" {
  type = number
  default = 2
}

variable "user" {
  type = string
  default = "admin"
}
