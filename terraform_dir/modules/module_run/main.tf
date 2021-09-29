provider "docker" {
  host = "tcp://${var.ssh_host}:2375"
}


resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

resource "docker_container" "container_wordpress" {
  image = docker_image.ubuntu.latest
  name = "wordpress"
  ports {
    internal = "${var.intern_port}"
    external = "${var.extern_port}"
  }
}
