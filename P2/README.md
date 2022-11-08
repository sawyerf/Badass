# Router 1
```
vtysh
config t

i eth0
	ip ospf network point-to-point
	ip address 192.168.1.1/24

i eth1
	ip address 10.0.1.1/16

end
exit
```


### bridge (VXLAN)

```
##### Partie VXLAN 100 #####
# Création d'un VTEP pour le VXLAN 100
```

### bridge static
```
ip link add vxlan10 type vxlan id 10 dstport 4789 local 192.168.1.1
```

### bridge multicast
```
ip link add vxlan10 type vxlan id 10 group 239.1.1.1 dev eth0 dstport 4789
```

```
# Déclaration des VTEP distants
bridge fdb append 00:00:00:00:00:00 dev vxlan10 dst 192.168.1.2

# Création du pont et ajout des interfaces devants faire partie du VXLAN 10
brctl addbr br0
brctl addif br0 vxlan10
brctl addif br0 eth1

# Désactivation du spanning tree (les VTEP étant du point à point, aucune boucle ne peut être formée par ce biais)
brctl stp br0 off
ip link set up dev br0
ip link set up dev vxlan10
```


# Router 2
```
vtysh
config t

i eth0
	ip ospf network point-to-point
	ip address 192.168.1.2/24

i eth1
	ip address 10.0.2.1/16

end
exit
```

### bridge (VXLAN)

```
##### Partie VXLAN 100 #####
# Création d'un VTEP pour le VXLAN 100
```

### bridge static
```
ip link add vxlan10 type vxlan id 10 dstport 4789 local 192.168.1.2
```

### bridge multicast
```
ip link add vxlan10 type vxlan id 10 group 239.1.1.1 dev eth0 dstport 4789
```

```
# Déclaration des VTEP distants
bridge fdb append 00:00:00:00:00:00 dev vxlan10 dst 192.168.1.1

# Création du pont et ajout des interfaces devants faire partie du VXLAN 100
brctl addbr br0
brctl addif br0 vxlan10
brctl addif br0 eth1

# Désactivation du spanning tree (les VTEP étant du point à point, aucune boucle ne peut être formée par ce biais)
brctl stp br0 off
ip link set up dev br0
ip link set up dev vxlan10
```


# Host 1
```sh
ip addr add 10.0.1.2/16 dev eth0
ip route add default via 10.0.1.1 dev eth0
```

# Host 2
```sh
ip addr add 10.0.2.2/16 dev eth0
ip route add default via 10.0.2.1 dev eth0
```


# Visualisation

```
ip -d link show vxlan10
bridge fdb show dev vxlan10
```

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
- [VXlan multicast](https://www.kernel.org/doc/html/v5.17/networking/vxlan.html)
- [Sheet sheeeesh](https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf)