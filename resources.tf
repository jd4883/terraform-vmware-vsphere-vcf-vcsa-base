resource "vsphere_host_virtual_switch" "switch" {
  active_nics            = [var.network_adapters.0]
  allow_forged_transmits = var.switch_security_disabled
  allow_mac_changes      = var.switch_security_disabled
  allow_promiscuous      = var.switch_security_disabled
  host_system_id = local.host_id
  name           = var.switch_name
  network_adapters = var.network_adapters
  standby_nics           = setsubtract(var.network_adapters, [var.network_adapters.0])
}

resource "vsphere_host_port_group" "pg" {
  host_system_id      = local.host_id
  name                = var.pg_name
  virtual_switch_name = vsphere_host_virtual_switch.switch.name
  vlan_id             = var.vlan
}
