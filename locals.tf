locals {
  datacenter_id = data.vsphere_datacenter.dc.id
  datastores = {
    hdd = data.vsphere_datastore.hdd
    ssd = data.vsphere_datastore.ssd
  }
  host_id = data.vsphere_host.host.id
}