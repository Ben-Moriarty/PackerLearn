packer {
  required_plugins {
    vsphere = {
      version = "~> 2"
      source  = "github.com/vmware/vsphere"
    }
  }
}

source "vsphere-iso" "rhel9" {
  //vCenter Server Endpoint Settings and Credentials
  vcenter_server = var.vsphere_endpoint
  username = var.vsphere_username
  password = var.vsphere_password
  insecure_connection = var.vsphere_insecure_connection

  //vSphere Settings
  datacenter = var.vsphere_datacenter
  //cluster = var.vsphere_cluster
  host = var.vsphere_host
  datastore = var.vsphere_datastore
  folder = var.vsphere_folder
  resource_pool = var.vsphere_resource_pool
}