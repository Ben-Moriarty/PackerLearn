packer {
    required_plugins {
        vsphere = {
            version = "~> 2"
            source = "github.com/vmware/vsphere"
        }
    }
}

locals {
    iso_path = "[${var.vsphere_datastore}] ${var.vsphere_datastore_iso_path}"
}

source "vsphere-iso" "alpine-builder" {
    username = var.vsphere_username
    password = var.vsphere_password
    vcenter_server = var.vcenter_server
    host = var.vsphere_host
    insecure_connection = var.vsphere_insecure_connection
    vm_name = var.vm_name
    ssh_username = var.ssh_username
    ssh_password = var.ssh_password
    iso_paths = [local.iso_path]
    guest_os_type = var.guest_os_type
    CPUs = var.vm_cpu_core
    RAM = var.vm_ram
    disk_controller_type = var.vm_disk_controller_type
    datastore = var.vsphere_datastore

    storage {
        disk_size = var.vm_disk_size
        disk_thin_provisioned = true:w
    }

    boot_command = [
        "<wait30>"
        "root<enter><wait>"
        "mount -t vfat"
    ]
}

build {
    sources = ["source.vsphere-iso.alpine-builder"]
}