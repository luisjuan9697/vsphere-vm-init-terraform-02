# Example building a Kubernetes cluster consisting of 4 virtual machines (1 control plane and 3 worker nodes).
vsphere_user       = "administrator@vsphere.local"
vsphere_password   = "S3cret"
vsphere_server     = "x.x.x.x"
vsphere_datacenter = "Datacenter"
vsphere_cluster    = "Cluster"
vsphere_datastore  = "datastore1"
vsphere_network    = "VM Network"

# Global template to apply to all virtual machines
vm_template_name    = "ubuntu-jammy-22.04-cloudimg"
vm_user             = "appuser"
vm_group            = "appowner"
vm_password_user    = "$6$ISencCYSMllGHg3A$FriUtVHzF4Lur9tm413IEH8dTkkJfjve0QEyWtxnvOhpbCbfltgEzTF.2Iw8eJ8/BseY3QGONXOZDnY8mgURW/"
vm_timezone         = "America/Mexico_City"
vm_disk_size        = 20
ssh_authorized_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKoMZkKJmbpmtlvU5BncOVSfQ4RdVPbkWeCAv/IB4oS albertoluisjuan@SUTA-0008"]
userdata_file       = "examples/kubernetes/userdata.tftpl"

virtual_machines = [
  {
    fqdn         = "c1-cp1.lab",
    cpu          = 2,
    memory       = 4096,
    ip           = "x.x.x.229/24",
    gateway      = "x.x.x.254",
    nameservers = ["8.8.8.8", "1.1.1.1"]
  },
  {
    fqdn         = "c1-node1.lab",
    cpu          = 2,
    memory       = 4096,
    ip           = "x.x.x.x1/24",
    gateway      = "x.x.x.254",
    nameservers = ["8.8.8.8", "1.1.1.1"]
  },
  {
    fqdn         = "c1-node2.lab",
    cpu          = 2,
    memory       = 4096,
    ip           = "x.x.x.x/24",
    gateway      = "x.x.x.x",
    nameservers = ["8.8.8.8", "1.1.1.1"]
  },
  {
    fqdn         = "c1-node3.lab",
    cpu          = 2,
    memory       = 4096,
    ip           = "x.x.x.x3/24",
    gateway      = "x.x.x.254",
    nameservers = ["8.8.8.8", "1.1.1.1"]
  }
]

addl_disks = [
  {
    label            = "disk1",
    size             = 30,
    eagerly_scrub    = false,
    thin_provisioned = false,
    unit_number      = 1
  }
]
