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

    http_directory = "${path.root}/http"
    http_port_min = var.http_port_min
    http_port_max = var.http_port_max

    convert_to_template = var.convert_to_template
    folder = var.vsphere_template_folder

    storage {
        disk_size = var.vm_disk_size
        disk_thin_provisioned = true
    }

    network_adapters {
        network_card = var.vm_network_card
        network = var.vm_network_name
    }

    boot_command = [
        "root<enter><wait>",
        "ifconfig eth0 up && udhcpc -i eth0 -x 0x33:00000e10<enter><wait5>",
        "wget -O /tmp/answerfile http://{{ .HTTPIP }}:{{ .HTTPPort }}/answerfile<enter>",
        "setup-alpine -f /tmp/answerfile<enter>",
        "<wait5>",
        "${var.root_password}<enter>",
        "${var.root_password}<enter>",
        "y<enter><wait15>",
        "reboot<enter><wait15>",
        "root<enter>",
        "${var.root_password}<enter><wait>",
        "wget -O /tmp/setup.sh http://{{ .HTTPIP }}:{{ .HTTPPort }}/setup.sh<enter>",
        "chmod +x /tmp/setup.sh && /tmp/setup.sh<enter>",
    ]
}

build {
  sources = ["source.vsphere-iso.alpine-builder"]

  provisioner "shell" {
    inline = ["ls /"]
  }
}