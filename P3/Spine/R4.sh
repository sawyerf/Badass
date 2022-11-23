#5007

vtysh
config t
no ipv6 forwarding
i lo
	ip address 1.1.1.4/32

i eth0
	ip address 10.1.1.1/30

i eth1
	ip address 10.1.1.5/30

i eth2
	ip address 10.1.1.9/30

router bgp 1
    neighbor ibgp peer-group
	neighbor ibgp remote-as 1
	neighbor ibgp update-source lo

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