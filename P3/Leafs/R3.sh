#5005

##### Partie VXLAN 100 #####
# Création d'un VTEP pour le VXLAN 100
ip link add vxlan10 type vxlan id 10 dstport 4789

# Création du pont et ajout des interfaces devants faire partie du VXLAN 10
brctl addbr br0
brctl addif br0 vxlan10
brctl addif br0 eth1

# Désactivation du spanning tree (les VTEP étant du point à point, aucune boucle ne peut être formée par ce biais)
ip link set up dev br0
ip link set up dev vxlan10

vtysh
config t
no ipv6 forwarding
i eth0
	ip ospf area 0
	ip address 10.1.1.10/30

i lo
	ip address 1.1.1.3/32
	ip ospf area 0

router bgp 1
    neighbor 1.1.1.4 remote-as 1
	neighbor 1.1.1.4 update-source lo

address-family l2vpn evpn
	neighbor 1.1.1.4 activate
	advertise-all-vni
exit-address-family

router ospf

do sh ip route

end
exit