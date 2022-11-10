# 5007

vtysh
config t

i lo0
	ip address 1.1.1.4/32

i eth0
	ip address 192.168.1.1/16

i eth1
	ip address 192.168.2.1/16

i eth2
	ip address 192.168.3.1/16

router bgp 1
    neighbor ibgp peer-group
	neighbor ibgp remote-as 1
	neighbor ibgp update-source lo0

	bgp listen range 1.1.1.0/29 peer-group ibgp

	address-family l2vpn evpn
	neighbor ibgp activate
	neighbor ibgp route-reflector-client
exit-address-family

router ospf
	network 0.0.0.0/0 area 0 

do sh ip route
end
exit