variable ssh_host {}
variable ssh_user {}
variable ssh_password {}
variable info {
  type = string
  default = "bonjour"
}

resource "null_resource" "test" {
  connection {
    type = "ssh"
    user = var.ssh_user
    host = var.ssh_host
    password = var.ssh_password
  }

  provisioner "remote-exec" {
    inline = [
      "sudo echo ${var.info} > test"
    ] 
  } 
  
}
