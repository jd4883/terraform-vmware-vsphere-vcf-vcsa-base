data "vsphere_datacenter" "dc" { name = var.dc }

data "vsphere_datastore" "hdd" {
  for_each      = toset(var.hdd)
  name          = each.value
  datacenter_id = local.datacenter_id
}

data "vsphere_datastore" "ssd" {
  for_each      = toset(var.ssd)
  name          = each.value
  datacenter_id = local.datacenter_id
}

data "vsphere_host" "host" {
  name          = var.parent_host
  datacenter_id = local.datacenter_id
}

data "vsphere_network" "network" {
  name          = vsphere_host_port_group.pg.name
  datacenter_id = local.datacenter_id
}
