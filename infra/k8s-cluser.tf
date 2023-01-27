resource "google_container_cluster" "kubernetes_cluster" {
  name     = "kubernetes-cluster"
  location = "us-east1"
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_service_account" "kubernetes_node_sa" {
  account_id   = "kubernetes-node-sa"
  display_name = "Kubernetes node Service Account"
}

resource "google_container_node_pool" "cluster_node_pool" {
  name       = "kubernetes-node-pool"
  location   = "us-east1"
  cluster    = google_container_cluster.kubernetes_cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.kubernetes_node_sa.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
