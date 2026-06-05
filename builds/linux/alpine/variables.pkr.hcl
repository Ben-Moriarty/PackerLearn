variable "vcenter_server" {
    type = string
}

variable "guest_os_type" {
    type = string
}

variable "vsphere_username" {
    type = string
}

variable "vsphere_password" {
    type = string
}

variable "vsphere_insecure_connection" {
    type = string
}

variable "vsphere_datacenter" {
    type = string
}

variable "vsphere_host" {
    type = string
}

variable "vsphere_datastore" {
    type = string
}

variable "vsphere_datastore_iso_path" {
    type = string
}

variable "ssh_username" {
    type = string
}

variable "ssh_password" {
    type = string
}

variable "vm_cpu_core" {
    type = number
    default = 1
}

variable "vm_ram" {
    type = number
    default = 512
}

variable "vm_network_name" {
    type = string
}

variable "vm_disk_size" {
    type = number
    default = 1024
}

variable "vm_disk_controller_type" {
    type = list(string)
    default = ["pvscsi"]
}

variable "vm_network_card" {
    type = string
    default = "vmxnet3"
}

variable "vm_name" {
    type = string
    default = "noche-alpine"
}

variable "http_port_min" {
    type = number
}

variable "http_port_max" {
    type = number
}

variable "root_password" {
    type = string
    sensitive = true
}

variable "convert_to_template" {
    type = bool
}

variable "vsphere_template_folder" {
    type = string
}