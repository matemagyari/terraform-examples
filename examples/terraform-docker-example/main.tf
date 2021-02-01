terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

// Nginx won't be up when it's called
//data "http" "nginx_http_result" {
//  url = "http://localhost:8000"
//}

//output "nginx_http_result" {
//  value = data.http.nginx_http_result.body
//}
