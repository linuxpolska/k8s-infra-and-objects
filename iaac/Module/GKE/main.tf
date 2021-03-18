resource "random_id" "id" {
  byte_length = 10
}

resource "random_password" "password" {
  length = 20
  special = true
}

resource "google_container_cluster" "primary" {
  name     = "gke-${var.environment}"
  location = var.zone["Poland"]

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = var.user
    password = random_password.password.result

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "np-${random_id.id.hex}"
  location   = var.zone["Poland"]
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = var.machine_type
    tags = var.tags
    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
  }
}



