### Notion de DR / BDR


Dans un réseau multi-accès, beaucoup de routeurs peuvent être connectés sur une même facilité de couche 2.

Si chaque routeur doit établir une adjacence complète (Full Adjacency) avec tous les autres routeurs et échanger des informations d’état de lien avec chaque voisin, <strong>ceux-ci pourraient subir des surcharges en calcul.</strong>


La solution à cette surcharge est l’organisation de <strong>l’élection d’un routeur désigné (designated router, DR).</strong> Ce routeur devient adjacent à tous les autres routeurs dans un segment de Broadcast. Tous les autres routeurs sur le même segment envoient leurs informations d’état de lien au DR. <strong>Le DR agit comme porte-parole pour le segment.</strong>

BDR => BACKUP DE DR



[http://mhd-experts.com/quel-underlay-pour-ma-fabric-leaf-spine-partie-2/](http://mhd-experts.com/quel-underlay-pour-ma-fabric-leaf-spine-partie-2/)