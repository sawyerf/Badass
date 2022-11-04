# Router 1
```
vtysh
config t

i eth0
	ip ospf network point-to-point
	ip address 192.168.1.1/24

i eth1
	ip address 10.0.1.1/16

router ospf
	network 192.168.1.1/24 area 0
end
exit
```


### bridge (VXLAN)
```
ip link add vxlan0 type vxlan id 100 dstport 4789 remote 192.168.1.2 local 192.168.1.1 dev eth0

# ? Not sure ?
brctl addbr br100
brctl addif br100 eth1
brctl addif br100 vxlan0
brctl stp br100 off
brctl addbr br100 eth1
ip link set up dev br100 
ip link set up dev vxlan0
```


# Router 2
```
vtysh
config t

i eth0
	ip ospf network point-to-point
	ip address 192.168.1.2/24

i eth1
	ip address 10.0.1.2/24

router ospf
	network 192.168.1.2/24 area 0
end
exit
```

### bridge (VXLAN)
```
ip link add vxlan0 type vxlan id 100 dstport 4789 remote 192.168.1.1 local 192.168.1.2 dev eth0

# ? Not sure ?
brctl addbr br100
brctl addif br100 eth1
brctl addif br100 vxlan0
brctl stp br100 off
ip link set up dev br100
ip link set up dev vxlan0
```


# Host 1
```sh
ip addr add 10.0.1.11/24 dev eth0
ip route add default via 10.0.1.1 dev eth0
```

```
auto eth0
iface eth0 inet static
	address 10.0.2.2
	netmask 255.255.0.0
	gateway 10.0.2.1
```

# Host 2
```sh
ip addr add 10.0.1.12/24 dev eth0
ip route add default via 10.0.1.2 dev eth0
```

---

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

- [GNS3 Cisco LAB : Nexus 9000v NxOS VxLAN Lab and concept.](https://protocoholic.com/2021/12/28/gns3-cisco-lab-nexus-9000v-nxos-vxlan-lab-and-concept/)
- [Learning Cumulus Linux and a bit of VXLAN in GNS3](https://networktechstudy.com/home/cumulus-vxlan)
- [VXLAN and GNS3!!! (video)](https://blog.hop16.com/2015/08/vxlan-and-gns3.html)
- [Basic VXLAN Config](https://chasewright.com/basic-vxlan-config/)


With linux command:
- [VXLAN Basic Tutorial: Configure VXLAN Network on Linux](https://www.programmerall.com/article/5975549487/)
- [VXLAN & Linux](https://vincent.bernat.ch/fr/blog/2017-vxlan-linux)
- [Practice VxLAN under Linux](https://programmer.help/blogs/practice-vxlan-under-linux.html)
- [Meme Composition d'equipe](https://doc.ycharbi.fr/index.php/Vxlan)

- [Sheet sheeeesh](https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf)