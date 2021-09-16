variable ssh_host {}
variable ssh_user {}
variable ssh_key {}
variable ssh_password {}
variable extern_port {}
variable intern_port {}
variable "hosts" {
  type = map
  default = {
    "192.168.2.2" = "server2"
    "192.168.2.3" = "server3"
    "192.168.2.4" = "server4"
    "192.168.2.5" = "server5"
    "192.168.2.6" = "test_server"
  }
}


module "module_install" {
  source = "./modules/module_install"
  ssh_host = var.ssh_host
  ssh_user = var.ssh_user
  ssh_key = var.ssh_key
  ssh_password = var.ssh_password
}


module "module_run" {
  source = "./modules/module_run"
  ssh_host = var.ssh_host
  ssh_user = var.ssh_user
  ssh_key = var.ssh_key
  ssh_password = var.ssh_password
  extern_port = var.extern_port
  intern_port = var.intern_port
}
