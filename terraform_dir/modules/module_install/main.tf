resource "null_resource" "node_docker" {
  connection {
    type = "ssh"
    user = var.ssh_user
    host = var.ssh_host
    private_key = file(var.ssh_key)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -qq > /dev/null",
      "sudo yum install nginx -y -qq > /dev/null" 
    ]
  }

  provisioner "file" {
    source = "nginx.conf"
    destination = "/tmp/default"
  }

   provisioner "remote-exec" {
    inline = [
      "sudo cp -a /tmp/default /etc/nginx/sites-available/default",
      "sudo systemctl restart nginx" 
    ]
  }

  provisioner "local-exec" {
    command = "curl {var.ssh_host}:80"
  }
 
}
