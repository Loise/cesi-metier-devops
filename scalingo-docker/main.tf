# Set the required provider and versions
terraform {
  required_providers {
    scalingo = {
      source  = "scalingo/scalingo"
      version = "2.3.0" # Or the latest version
    }
  }
}

variable "scalingo_token" {
  type        = string
  description = "the scalingo token"
}

provider "scalingo" {
  api_token = var.scalingo_token
  region    = "osc-fr1"
}

resource "scalingo_app" "loisefenoll-test-01" {
  name     = "loisefenoll-test-01"
}

resource "scalingo_addon" "db" {
  provider_id = "mysql"
  plan = "mysql-starter-512"
  app = "${scalingo_app.loisefenoll-python-api.id}"
}

resource "scalingo_container_type" "web" {
  app_id = scalingo_app.my_docker_app_python.id
  name   = "web"
  size   = "S"
  amount = 1
}

resource "scalingo_container_type" "api-python" {
  app_id = scalingo_app.my_docker_app_python.id
  name   = "api-python"
  size   = "S"
  amount = 1
}

resource "scalingo_container_type" "api-node" {
  app_id = scalingo_app.my_docker_app_python.id
  name   = "api-node"
  size   = "S"
  amount = 1
}
