#5020

vtysh
config t

i eth0
	ip ospf network point-to-point
	ip address 192.168.1.1/24

i eth1
	ip address 10.0.1.1/16

end
exit

##### Partie VXLAN 100 #####
# Création d'un VTEP pour le VXLAN 100

# ======================== Choice ========================
# Static
# ip link add vxlan10 type vxlan id 10 dstport 4789 local 192.168.1.1

# Multicast
ip link add vxlan10 type vxlan id 10 group 239.1.1.1 dev eth0 dstport 4789

# ======================== Choice ========================

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