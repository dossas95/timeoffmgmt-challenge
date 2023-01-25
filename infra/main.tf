provider "google" {
  project = "gorilla-time-management-app"
  region  = var.region
}

provider "google-beta" {
  project = "gorilla-time-management-app"
  region  = var.region
}

