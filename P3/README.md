# BGP P3

<div align="center">

<img src="https://user-images.githubusercontent.com/28403617/203608173-02595dee-07fd-4914-9fc3-10c5d4583ead.gif" />

<small>Salut c’est ninho</small>
</div>

## Topologie

> Structure de data center vxlan + bgp

<img align="right" height="400" src="https://user-images.githubusercontent.com/22857002/203620410-e0747d64-d650-458a-9915-8cc8d1257a3b.svg">
<img height="400" src="https://user-images.githubusercontent.com/28403617/203608171-6c3124cb-7563-421e-b231-5d9cdbab9703.png">

----
 

### Definition

La structure se nomme [EVPN](https://en.wikipedia.org/wiki/Ethernet_VPN), norme [RFC 7432](https://www.rfc-editor.org/rfc/rfc7432.html)

> *Ethernet VPN-Virtual Extensible LAN (EVPN-VXLAN) fournit aux grandes entreprises un cadre commun pour la gestion de leurs réseaux de campus et de datacenter. Une architecture EVPN-VXLAN prend en charge une connectivité réseau efficace de couche 2 et de couche 3 avec évolutivité, simplicité et agilité, tout en réduisant les coûts OpEx.

Source:* [https://www.juniper.net/fr/fr/research-topics/what-is-evpn-vxlan.html](https://www.juniper.net/fr/fr/research-topics/what-is-evpn-vxlan.html)
> 

Il se compose en 5 types de routes différentes les plus importantes (celle utilisé dans l’exercice) sont les suivantes:

- Route 2 - Transportera les addresses mac des machines extrémité (alpines)
- Route 3 - La route 3 va transporter les informations pour traffic BUM ( broadcast unknown unicast and multicast)

[BUM (broadcast unknown unicast and multicast)](https://en.wikipedia.org/wiki/Broadcast,_unknown-unicast_and_multicast_traffic):



<table align="center" style="border: none!important;" cellspacing="0" cellpadding="0">
  <tr style="boder:none;" style="border: none!important;">
    <td valign="top" style="border: none!important;">
        <h4>Est un trafic réseau transmis par l'une des trois méthodes suivantes:</h4>
        <ul>
            <li><strong>Broadcast</strong></li>
            <li><strong>Unknown-unicast (la meme que unicast mais avec des adresses MAC de destination inconnue)</strong></li>
            <li><strong>Multicast</strong></li>
        </ul>
    </td>
    <td valign="top" style="border: none!important;">
      <img align="right" width="207" src="https://user-images.githubusercontent.com/28403617/203608165-d99aa22c-6605-4036-8fe0-cd35b6f773f9.png" /><br />    
      <a href="https://fr.wikipedia.org/wiki/Routage">Rappel sur les types de routage.</a>
     </td>
  </tr>
</table>
 


### Leaf et Spine

Tout les switch (Leaf) peuvent être appeler. Ce qui implique:

Les vxlan des leafs iront vers le spine, frr2 a un vxlan qui sera similaires au deux autres (frr3, frr4).

Les frr leafs ne se connaissent pas entre eux, donc pour qu’ils se connaissent ils vont envoyer des routes de types 3 et ils vont dire:

“eh frere ca dis quoi ? Je suis là si tu as du traffic pour un VNI (identifiant du vxlan) particulier je lui envois”

Ensuite ils enverront le trafic en fonction des cibles.

Toutes les adresses mac seront envoyées via le IBGP et NLRI.

Les mac adresses des frr des leafs vont être partager avec le  IBGP et NLRI du spine grace au ospf qui est configuré sur le spine.

Grace a OSPF le spine va avoir une visibilité completes sur les adresses loopback des leafs.

Le spine lui est un route reflector.

Il va donc se charger de refleter le EVPN et le NLRI (**BGP Network Layer Reachability Information (NLRI))** des leafs. Pour faire transiter l’information entre les leafs.


### Usefull links:

- [BGP EVPN VXLAN Configuration (3-3-1)](https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9500/software/release/17-6/configuration_guide/vxlan/b_176_bgp_evpn_vxlan_9500_cg/configuring_spine_switches_in_a_bgp_evpn_vxlan_fabric.html)
- [Understanding the Loopback Interface & Loopback Address](https://study-ccna.com/loopback-interface-loopback-address/)
