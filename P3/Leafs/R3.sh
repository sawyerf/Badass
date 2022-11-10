#5004

vtysh
config t

i eth0
	ip ospf network point-to-point
	ip address 192.168.1.4/24

i eth1
	ip address 10.0.4.1/16
end
exit