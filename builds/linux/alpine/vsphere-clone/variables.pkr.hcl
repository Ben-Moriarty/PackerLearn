variable "vcenter_server" {
    type = string
}

variable "vsphere_username" {
    type = string
}

variable "vsphere_password" {
    type = string
}

variable vsphere_insecure_connection {
    type = string
}

variable vsphere_host {
    type = string
}

variable vsphere_datastore {
    type = string
}

variable "vm_name_prefix" {
    type = string
    default = "doom"
}

variable "vm_template_name" {
    type = string
}