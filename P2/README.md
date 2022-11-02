# Router 1
```
config t

i eth0
	ip ospf network point-to-point
	ip address 192.168.1.1/24

i eth1
	ip address 10.0.1.1/24

router ospf
	network 192.168.1.1/24 area 0
```

# Router 2
```
config t

i eth0
	ip ospf network point-to-point
	ip address 192.168.1.2/24

i eth1
	ip address 10.0.2.1/24

router ospf
	network 192.168.1.1/24 area 0
```


## bridge (VXLAN)

? Not sure of these commands ?
```
ip -4 link add vxlan100 type vxlan id 100 dstport 4789 local 10.0.2.1 group 10.0.2.0/24 dev eth0 ttl 5

ip link add vxlan0 type vxlan id 100 dstport 4789 remote 192.168.57.54 local 192.168.57.50 dev eth0
```

dstport : VTEP The communication port, the port assigned by IANA is 4789. If not specified, Linux uses by default8472。

remote : The address of the opposite VTEP.

local : Current nodeVTEP The IP address to be used is the IP address of the tunnel port of the current node.

dev eth0 : The current node is used forVTEP The communication device is used to obtain the VTEP IP address.This parameter has the same purpose as the local parameter, just choose one of the two。

VTEP:

VTEP encapsulation

The VXLAN Tunnel End Point (VTEP) is the VXLAN encapsulation point and is connected to a traffic source which may be a stand-alone server or virtual machine. For example, the VTEP could be part of the hypervisor in a server platform, part of the network interface device in the server, or part of the attached top of rack (ToR) switch.


Overlay networks based on VXLANs transport frames after encapsulating them as VXLAN packets. Encapsulation and de-encapsulation in these networks are done by an entity called the Virtual Tunnel End Point (VTEP).

# Show
```
sh ip ospf nei
```

[https://protocoholic.com/2021/12/28/gns3-cisco-lab-nexus-9000v-nxos-vxlan-lab-and-concept/](https://protocoholic.com/2021/12/28/gns3-cisco-lab-nexus-9000v-nxos-vxlan-lab-and-concept/)
[https://networktechstudy.com/home/cumulus-vxlan](https://networktechstudy.com/home/cumulus-vxlan)
[https://blog.hop16.com/2015/08/vxlan-and-gns3.html](https://blog.hop16.com/2015/08/vxlan-and-gns3.html)
[https://chasewright.com/basic-vxlan-config/](https://chasewright.com/basic-vxlan-config/)


With linux command:
[https://www.programmerall.com/article/5975549487/](https://www.programmerall.com/article/5975549487/)
[https://vincent.bernat.ch/fr/blog/2017-vxlan-linux](https://vincent.bernat.ch/fr/blog/2017-vxlan-linux)

[Sheet sheeeesh](https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf)