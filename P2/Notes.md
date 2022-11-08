# Notion de DR / BDR


Dans un réseau multi-accès, beaucoup de routeurs peuvent être connectés sur une même facilité de couche 2.

Si chaque routeur doit établir une adjacence complète (Full Adjacency) avec tous les autres routeurs et échanger des informations d’état de lien avec chaque voisin, <strong>ceux-ci pourraient subir des surcharges en calcul.</strong>


La solution à cette surcharge est l’organisation de <strong>l’élection d’un routeur désigné (designated router, DR).</strong> Ce routeur devient adjacent à tous les autres routeurs dans un segment de Broadcast. Tous les autres routeurs sur le même segment envoient leurs informations d’état de lien au DR. <strong>Le DR agit comme porte-parole pour le segment.</strong>

BDR => BACKUP DE DR



[http://mhd-experts.com/quel-underlay-pour-ma-fabric-leaf-spine-partie-2/](http://mhd-experts.com/quel-underlay-pour-ma-fabric-leaf-spine-partie-2/)


# Ip Command 
dstport : VTEP The communication port, the port assigned by IANA is 4789. If not specified, Linux uses by default8472。

remote : The address of the opposite VTEP.

local : Current nodeVTEP The IP address to be used is the IP address of the tunnel port of the current node.

dev eth0 : The current node is used forVTEP The communication device is used to obtain the VTEP IP address.This parameter has the same purpose as the local parameter, just choose one of the two。

# VTEP

VTEP encapsulation

The VXLAN Tunnel End Point (VTEP) is the VXLAN encapsulation point and is connected to a traffic source which may be a stand-alone server or virtual machine. For example, the VTEP could be part of the hypervisor in a server platform, part of the network interface device in the server, or part of the attached top of rack (ToR) switch.


Overlay networks based on VXLANs transport frames after encapsulating them as VXLAN packets. Encapsulation and de-encapsulation in these networks are done by an entity called the Virtual Tunnel End Point (VTEP).

