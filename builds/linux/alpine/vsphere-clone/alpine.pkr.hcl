packer {
    required_plugins {
        vsphere = {
            version = "~> 1"
            source = "github.com/vmware/vsphere"
        }
    }
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "vsphere-clone" "alpine-clone" {
    vcenter_server = var.vcenter_server
    username = var.vsphere_username
    password = var.vsphere_password
    insecure_connection = var.vsphere_insecure_connection
    host = var.vsphere_host
    datastore = var.vsphere_datastore
    vm_name = "${var.vm_name_prefix}-${local.timestamp}"
    template = var.vm_template_name
    communicator = "none"
}

build {
    sources = ["vsphere-clone.alpine-clone"]
}