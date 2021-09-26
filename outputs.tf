output "dc_id" { value = local.datacenter_id }
output "hdd" { value = local.datastores.hdd }
output "host_id" { value = local.host_id }
output "network_id" { value = data.vsphere_network.network.id }
output "ssd" { value = local.datastores.ssd }
output "switch" { value = vsphere_host_virtual_switch.switch.name }
output "vlan" { value = var.vlan }
