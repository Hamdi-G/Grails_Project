# Grails_Project

#PRESENTATION
Ce TP nous a permet de bien découvrir le Framework Grails
ce dossier contient les images d'initialisation:https://drive.google.com/open?id=0B4mcIOcRR6phbjAzVmR4RnVZTm8  et on doit le mettre sous htdocs.

#OUTILS et Technologies DE DEVELOPPEMENT***
Java 8
Grails 3.3.0
IntelliJ IDEA Ultimate dont la dernière version
Un serveur Apache


#INITIALISATION
Groupes et points d'intérêts 
Génération de 3 groupes
Génération de 5 points d'intérêts
Génération de 3 types d'utilisateur : 1 Administrateurs; 1 Modérateurs et 1 Utilisateurs

Spring Security
Spring Security génère les classes User/Role/UserRole

#Info
*Authentification
Il existe 3 utilisateur:
adminisstrateur : admin 
mot de passe: password

moderateur : moderator
mot de passe: password

simple utilisateur : user 
mot de passe: password

*server

Pour upload/download des images : Démarrer le serveur apache sur le port 80 et modifier updateImage et pathServer dans application.yml
uploadImage: 'C:/xampp/htdocs/images/'
pathServer: 'http://localhost:80'


#Application
Notre application est développé pour etre dédié dans un thème touristiques.
En effet, les groupes présentent un ensemble de lieux qui partagent des caractéristiques particulières.
Ces lieux sont repésentés dans notre application par les Pois.
D'ou on obtient un groupe qui regroupes plusieurs POIS.

Pour la partie IHM, notre application offre pour ses utilisateurs un menu qui facilite l'interaction avec l'application pour accéder au besoin.
ce menu se diffère selon le role de l'utilisateur.

Pour l'interface d'accueil il fourni des accés direct au pois, groupes et users.
De plus statistiques sur la répartition des pois.

lors de l'affichage de tous les pois, l'application affiche tous pois et elle affiche les unes qui sont prés de la localisation de l'utilisateur sur le map.

Pour la création d'un Groupe on peut rattacher plusieurs POIs et Images.
Pour la modification d'un Groupe on peut choisir les POIs et Images.
Affichage la liste des groupes (pour l'admin).
Affichage des détails d'un Groupe, ses images et des POIs lui correspondant sur une map.
Suppression d'un groupe.

  
Pour la création d'un POI on peut le rattacher à plusieurs Groupes et Images.
Pour la modification d'un POI on peut l'affecter à plusieurs Groupes des POIs et changer l'Emplacements et Images déjà affectés.
Affichage liste des pois. 
Affichage d'un POI avec ses Images et sa Localisation dans la map.
Suppression d'un POI. 


Pour la création et modification d'un utilisateur (rôle, identifiant et mot de passe).
Affichage d'une liste d'utilisateurs ou d'un profil utilisateur (rôle, identifiant et mot de passe).
Suppression d'un profil utilisateur


#Bonus
Uploader les images en faisant un simple drag and drop. 
Mettre en place une map au niveau de la gestion des Groupes et POIs:
Visualisation du POI sur la map et centrage avec la geolocalisation du utilisateur
Visualisation des POI du groupe sélectionné sur une Google Map 
Changement des emplacements avec le marker  
