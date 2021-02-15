locals {
  auth_file = file(var.path)
}

provider "google" {
 credentials = local.auth_file
 project     = var.project
}

module "kubernetes" {
  source = "../Module/GKE"
  tags = ["hello-world", "prod"]
  environment = "prod"
  node_count = 3
}
