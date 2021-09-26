variable "dc" {
  type        = string
  description = "Base datacenter name, required parameter"
}

variable "hdd" {
  type        = list(string)
  description = "Required parameter, can be shared with HDD/SSD if preferred"
}

variable "ssd" {
  type        = list(string)
  description = "Required parameter, can be shared with HDD/SSD if preferred"
}

variable "parent_host" {
  type        = string
  description = <<EOT
The parent ESXI host you will be using from VCSA to build on.

NOTE: this design is not battle tested on a mix of ESXI hosts; in theory it
may be of value to split over multiple base hosts. This is likely not hard to develop functionality for if there is
a demand for it
EOT
}

variable "pg_name" {
  type        = string
  default     = "Nested ESXI"
  description = "the name you want your nested ESXI hosts port group to live under, feel free to customize"
}

variable "switch_name" {
  type        = string
  default     = "vSwitch1"
  description = "defaul vSwitch1 to no overlap with any defaults created, feel free to customize this"
}

variable "switch_security_disabled" {
  type        = bool
  default     = true
  description = "Switch security mus be disabled if using nested ESXI to ensure ARP does not error"
}

variable "vlan" {
  type        = number
  default     = 4095
  description = <<EOT
VLAN range between 0 and 4095

0 Inherits from the upstream VLAN for the vSwitch

4095 trunks allowing all VLANs

Leave at 4095 unless you really know what you are doing; the VLAN can be set per ESXI host then via the OVH template.
EOT
  validation {
    condition     = (var.vlan >= 0) && (var.vlan <= 4095)
    error_message = "Invalid VLAN ID, Range between 0-4095."
  }
}

variable "network_adapters" {
  type        = list(string)
  description = "vmnic's used for virtual switches"
  default     = ["vmnic1", "vmnic2", "vmnic3"]
}