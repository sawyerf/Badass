# Badass-doc

## Materiel
### Routeur
Un routeur est un équipement réseau informatique assurant le routage des paquets.
Son rôle est de faire transiter des paquets d'une interface réseau vers une autre, au mieux, selon un ensemble de règles.

### Bridge
A network bridge is a computer networking device that creates a single, aggregate network from multiple communication networks or network segments. This function is called network bridging.[1] Bridging is distinct from routing. Routing allows multiple networks to communicate independently and yet remain separate, whereas bridging connects two separate networks as if they were a single network.

### Switch
L'objectif du swicth est de faire communiquer les machines virtuelles entre elles.

## Logiciel
### Zebra (or quagga)
Zebra is a multi–server routing software which provides TCP/IP based routing protocols. Zebra turns your machine into a full powered router.

### VLAN
Un VLAN est un réseau local virtuel. Les VLANs permettent de créer plusieurs LAN sur une même infrastructure physique.
Cela permet:
  - De limiter l'acces de certains peripheriques a des VLANs.
  - D'interconnecte plusieur reseaux local independament de leur localisation.

### VXLAN
La technologie VXLAN vous permet de segmenter vos réseaux (à l'instar des VLAN), résout les limitations des VLAN en terme d'évolutivité et offre plus d'avantages que ces derniers.


### Port Trunking
Le port trunking permet de partager une ressource commune à plusieurs VLANs. Cette ressource partagée (serveurs, imprimantes réseaux, NAS, accès Internet, etc...) peut ainsi être accessible des VLAN déclarés dans le port trunk.

### BGPD Service
BGPD is a Border Gateway Protocol (BGP) daemon which manages the network routing tables. Its main purpose is to exchange information concerning "network reachability" with other BGP systems.
The route decision process selects the best path by evaluating all paths to the same destination.

### OSPFD Service
ospfd is an Open Shortest Path First (OSPF) daemon which manages routing tables.

### OSPFD vs BGPD
Although BGP and OSPF are both dynamic routing protocols and perform similar tasks, they calculate their routing decisions and advertise routes in different ways. Thus, some situations favor BGP as a protocol, while others prefer OSPF.
Unlike BGP, OSPF is an interior gateway protocol that is most often used within a company's private LAN. OSPF is generally considered easier to deploy and manage compared with BGP and requires little manual adjustment to operate in most corporate settings. [source](https://www.techtarget.com/searchnetworking/tip/BGP-vs-OSPF-When-to-use-each-protocol)
Si vous effectuez un routage interne, tel que le routage au sein d'un site, une entreprise ou un campus, vous devriez utiliser OSPF. BGP est généralement nécessaire au bord d'un site, là où on accède à l'internet public. [source](https://community.fs.com/fr/blog/ospf-vs-bgp-routing-protocol-choice.html)

### IS-IS Protocol
IS-IS is an IGP, link-state routing protocol, similar to OSPF.


### VTEP
Encapsulation and de-encapsulation in these networks are done by an entity called the Virtual Tunnel End Point (VTEP).