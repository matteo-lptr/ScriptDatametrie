# Script Datamétrie

## Objectif
Réaliser un outil de datamétrie inspiré d'un mini projet de l'académie de Nantes.

## Cahier des Charges
Le RSSI du Rectorat de Rennes souhaite être informé sur les temps de chargement des pages d'accueil de certains services Web hébergés dans le service informatique du Rectorat ou chez des prestataires de services (OVH, Oceanet, ...), à partir d'un panel d'établissements scolaires.

### Exemples de services web du Rectorat de Rennes :
- [https://www.ac-rennes.fr/](https://www.ac-rennes.fr/)
- [https://pedagogie.ac-rennes.fr/](https://pedagogie.ac-rennes.fr/)

### Exemples de sites web d'établissements scolaires :
- [https://citescolairebroceliande.fr/](https://citescolairebroceliande.fr/)

## Problèmes identifiés
- Accès internet perturbé dans certains établissements scolaires à certaines heures de la journée.
- Fournisseurs d'accès moins performants que d'autres.
- Services du Rectorat difficiles d'accès à certaines heures de la journée.

## Fonctionnalités du Script
Le programme est réalisé sous la forme d'un script Shell implanté sur la passerelle d'accès internet de chaque lycée test. Le script réalise les tâches suivantes toutes les 5 minutes :
- Lancer le chargement de la page d'accueil du service web testé et mesurer le temps de chargement.
- Mémoriser les informations suivantes pour fabriquer un rapport par 24H :
  - La plus petite et la plus grande des grandeurs mesurées (ping et temps de chargement) ainsi que la datation de ces mesures.
  - Le nombre de tests fructueux et infructueux.
  - Les moyennes des temps de réponse mesurés.

## Envoi de Rapport
Toutes les 24H, le script envoie un email récapitulatif au DSI avec les principales informations recueillies, incluant le nom du lycée et le fournisseur d'accès Internet.

## Exemple de Mail
Le RSSI est déjà abonné à un service de datamétrie et reçoit régulièrement des rapports par mail. On se sert de cet exemple pour le contenu du rapport à générer.

### Algorithme
- Propose un algorithme complet du script Datamétrie
- Utilise des structures algorithmiques simples.
- Commencement d'une version simplifiée de l'algorithme demandé au final.

### Décomposition en Tâches Élémentaires
- Commence par un découpage soigneux en tâches élémentaires.
- Numérote et classe par ordre de priorité les tâches découvertes lors de l'analyse de l'algorithme.
- Chaque tâche élémentaire est écrite sur un bloc-notes.
- Choix des tâches élémentaires permettant d'obtenir une première version fonctionnelle du script.

### Codage des Tâches Élémentaires
- Matteo : Mise en place d'une page html qui sera reliée au script afin d'afficher les résultats obtenus.
- Carl : Configuration de SSMTP, création du script d'envoie de mail
- Valentin : Création des boucles, calcul de différence de ping envoies/réponses

### Fin de la Première Itération et Itérations Suivantes
- À la fin de la première itération, une première version du script est opérationnelle.
- Cette version est présentée au formateur pour une première démonstration.
- Si la démonstration est concluante, l'équipe propose la liste des fonctionnalités à inclure dans la version de l'itération suivante.

## Fin du Mini-Projet
Après plusieurs itérations, une fois que le script de Datamétrie possède suffisamment de fonctionnalités, l'équipe se consacre à la rédaction du diaporama résumant les principales étapes du projet.