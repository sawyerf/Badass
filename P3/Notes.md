
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


- [https://mhd-experts.com/larchitecture-leaf-spine/](https://mhd-experts.com/larchitecture-leaf-spine/)
- [https://www.arubanetworks.com/fr/faq/quest-ce-quune-architecture-leaf-spine/](https://www.arubanetworks.com/fr/faq/quest-ce-quune-architecture-leaf-spine/)