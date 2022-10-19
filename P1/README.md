## Router
```
vtysh

config t

i eth0
 ip address 10.0.0.1/24

router ospf
 network 10.0.0.0/24 area 0

show ip route ospf

router bgp 1
    set router-id 10.10.10.1

show bgp summary
```

## Notes


```
If you are new with BGP you need to know some information first:

    Private autonomous system (AS) numbers which range from 64512 to 65535 are used to conserve globally unique AS numbers. Globally unique AS numbers (1 - 64511) are assigned by InterNIC
    Each BGP router belong only to one Autonomous System (AS);
    IBGP means Internal BGP;
    EBGP means External BGP;
    BGP neighbors can be of two types:

- IBGP – when two neighbors are in the same AS;
- EBGP – when two neighbors belong to different AS.

```

```
You can use few tools to verify bgp status:

- show ip bgp;
- show ip bgp summary;
- show ip bgp neighbors;
- show ip bgp rib-failure.
```

## Area OSPF
An OSPF network can be divided into sub-domains called areas. An area is a logical collection of OSPF networks, routers, and links that have the same area identification. A router within an area must maintain a topological database for the area to which it belongs. The router does not have detailed information about network topology outside of its area, which thereby reduces the size of its database.

- [How to use FRR (Free Range Routing) container on GNS3 ?](https://www.n-study.com/en/how-to-use-gns3/how-to-use-frr-free-range-routing-container-on-gns3/)
- [FRRouting SR Segment Routing tech demo](http://www.uni-koeln.de/~pbogusze/posts/FRRouting_SR_Segment_Routing_tech_demo.html)
- [Github - gns3-bgp-frr](https://github.com/GSGBen/gns3-bgp-frr)
- [cisco-bgp-route-reflector-configuration-on-gns3](https://ipcisco.com/lesson/cisco-bgp-route-reflector-configuration-on-gns3/)
- [bgp-configuration-basique/](https://www.networklab.fr/bgp-configuration-basique/)
- [https://www.linkedin.com/pulse/bgp-lab-gns3-alessandro-knobloch/](https://www.linkedin.com/pulse/bgp-lab-gns3-alessandro-knobloch/)
