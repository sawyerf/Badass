# 5003

##### Partie VXLAN 100 #####
# Création d'un VTEP pour le VXLAN 100
ip link add vxlan10 type vxlan id 10 group 239.1.1.1 dev eth0 dstport 4789

# Déclaration des VTEP distants
bridge fdb append 00:00:00:00:00:00 dev vxlan10 dst 192.168.1.2
bridge fdb append 00:00:00:00:00:00 dev vxlan10 dst 192.168.3.2

# Création du pont et ajout des interfaces devants faire partie du VXLAN 10
brctl addbr br0
brctl addif br0 vxlan10
brctl addif br0 eth1

# Désactivation du spanning tree (les VTEP étant du point à point, aucune boucle ne peut être formée par ce biais)
brctl stp br0 off
ip link set up dev br0
ip link set up dev vxlan10

vtysh
config t

i eth0
	ip ospf area 0
	ip address 192.168.2.2/16

i eth1
	ip address 10.0.2.1/16

i lo0
	ip address 1.1.1.2/32
	ip ospf area 0

router bgp 1
    neighbor 1.1.1.4 remote-as 1
	neighbor 1.1.1.4 update-source lo0

address-family l2vpn evpn
	neighbor 1.1.1.4 activate
	advertise-all-vni
exit-address-family

router ospf

do sh ip route

end
exit