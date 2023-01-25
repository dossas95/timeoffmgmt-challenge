resource "google_compute_network" "vpc_network" {
    name                    = "vpc-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public_subnet" {
    name = "public-subnet"
    ip_cidr_range = "10.1.0.0/22"
    region = var.region
    network = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private_subnet" {
    name = "private-subnet"
    ip_cidr_range = "10.2.0.0/22"
    region = var.region
    network = google_compute_network.vpc_network.id
}