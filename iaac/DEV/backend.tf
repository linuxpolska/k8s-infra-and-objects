terraform {
  backend "gcs"{
    bucket      = "gke-hello-world"
    prefix      = "dev"
  }
}
