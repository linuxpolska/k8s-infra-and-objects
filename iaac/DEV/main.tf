locals {
  auth_file = file(var.path)
}

provider "google" {
 credentials = local.auth_file
 project     = var.project
}

module "kubernetes" {
  source = "../Module/GKE"
  tags = ["hello-world", "dev"]
  environment = "dev"
  node_count = 2
}
