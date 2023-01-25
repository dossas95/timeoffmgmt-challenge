resource "google_sql_database_instance" "sql_primary_instance" {
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-g1-small" 
    availability_type = "REGIONAL"
    backup_configuration {
      binary_log_enabled = true
      enabled = true
    }
    ip_configuration {
      ipv4_enabled = false
      private_network = google_compute_network.vpc_network.id
    }
  }
  deletion_protection  = false
}

resource "google_sql_database_instance" "sql_secondary_instance" {
  region           = var.region
  database_version = "MYSQL_8_0"
  master_instance_name = google_sql_database_instance.sql_primary_instance.name
  settings {
    tier = "db-g1-small"
    availability_type = "REGIONAL"
    backup_configuration {
      binary_log_enabled = true
      enabled = false
    }
  }
  deletion_protection  = "false"
}

resource "google_sql_database" "gorilla_mysql_database" {
  name     = "database_dev"
  instance = google_sql_database_instance.sql_primary_instance.name
}

resource "google_sql_user" "database_user" {
  name     = var.db_username
  instance = google_sql_database_instance.sql_primary_instance.name
  password = var.db_user_pass
}