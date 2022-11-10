
## Leaf spine ?

Une architecture Leaf-Spine est une topologie de réseau de datacenters qui consiste en deux niveaux composés de commutateurs « feuilles » (Leaf) et de commutateurs « troncs » (Spine). Le niveau Leaf est constitué de commutateurs d’accès qui regroupent le trafic des serveurs et se connectent directement au Spine ou au cœur du réseau. Les commutateurs Spine interconnectent tous les commutateurs Leaf dans une topologie à maillage complet.


Compte tenu de la prévalence des infrastructures cloud et conteneurisées dans les datacenters modernes, le trafic est-ouest continue d’augmenter. Le trafic est-ouest se déplace latéralement, de serveur à serveur. Ce déplacement s’explique principalement par le fait que les applications modernes possèdent des composants qui sont répartis sur un plus grand nombre de serveurs ou de machines virtuelles.

Dans le cas du trafic est-ouest, il est impératif d’avoir un faible temps de latence et d’optimiser les flux de trafic pour assurer la performance, en particulier pour les applications sensibles au temps de réponse ou à forte intensité de données. Une architecture Leaf-Spine permet de garantir que le trafic contient toujours le même nombre de sauts (hops) vers sa prochaine destination, de sorte que la latence est plus faible et prévisible.


Les avantages de l’architecture LEAF & SPINE :

- Une architecture scalable qui offre un plan de capacité très important (< 100000 serveurs)
- Une architecture flexible et résiliente qui permet :
- D’augmenter la bande passante montante par le rajout des switchs SPINE
- D’augmenter la densité des ports en ajoutant des switchs LEAF
- Prédictible dans le sens ou chaque serveur doit passer par trois équipements (LEAF > SPINE > LEAF) pour communiquer avec n’importe quel serveur dans la fabrique.



## Multihop

Multi-hop routing (or multihop routing) is a type of communication in radio networks in which network coverage area is larger than radio range of single nodes. Therefore, to reach some destination a node can use other nodes as relays.

## Fonctionnement du route reflector

À l'intérieur d'un système autonome, les routes ne sont pas transitives, c'est-à-dire qu'une route reçue d'un voisin iBGP n'est pas transmise aux autres voisins iBGP. Pour que les routes soient connues par l'ensemble des routeurs de l'AS, ceux-ci établissent donc des connexions entre eux dans un maillage complet (full mesh, chaque routeur communique avec tous les autres), ce qui pose un problème d'échelle quand ces routeurs sont nombreux, le nombre de connexions augmentant comme le carré du nombre de routeurs. L'addition d'un nouveau routeur oblige à modifier la configuration de tous les routeurs BGP de l'AS. 

Le route reflector permet de diminuer cette contrainte : il redistribue les routes apprises par iBGP à des pairs iBGP (appelés ses clients). Ceux-ci n'ont besoin que d'établir des sessions iBGP qu'avec le RR. 

En général on utilise au moins deux RR pour assurer la redondance en cas de défaillance d'un RR. 

- [https://mhd-experts.com/larchitecture-leaf-spine/](https://mhd-experts.com/larchitecture-leaf-spine/)
- [https://www.arubanetworks.com/fr/faq/quest-ce-quune-architecture-leaf-spine/](https://www.arubanetworks.com/fr/faq/quest-ce-quune-architecture-leaf-spine/)