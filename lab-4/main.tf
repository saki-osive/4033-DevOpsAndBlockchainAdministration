# Required providers
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# Docker provider
provider "docker" {}

# MongoDB container
resource "docker_container" "mongodb" {
  name    = "mongodb"
  image   = "mongo:latest"
  restart = "always"
}

# Node.js application container
resource "docker_container" "nodejs" {
  name    = "nodejs"
  image   = "node:latest"
  restart = "always"

  depends_on = [docker_container.mongodb]
}

# Nginx server container
resource "docker_container" "nginx" {
  name    = "nginx"
  image   = "nginx:latest"
  restart = "always"
  ports {
    internal = "80"
    external = "8081"
  }

  depends_on = [docker_container.nodejs]
}





