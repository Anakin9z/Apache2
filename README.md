# Apache2
PREMIÈRE PARTIE – PRÉPARATION (5 POINTS)

•	Le répertoire racine pour ce TP doit être « /var/www/html_tp2 ». 
•	Placez-y une page web nommée master_tp2.html et faire en sorte que cette page soit la page par défaut prioritaire de votre dossier racine. 
•	Placer sur cette page un lien pour tester chaque question et chaque situation de chaque question de ce TP. (Voir exemple à la dernière page).
DEUXIÈME PARTIE – SERVEUR VIRTUEL PAR NOM ET PORT (14 POINTS)
•	Créez un serveur virtuel par nom et par port qui utilise les noms ci-bas. 
•	L'adresse IP sera la même pour tous les serveurs 10.35.16.1 de cet exercice mais on suppose que cette adresse n'est pas la même que celle du site principal non-virtuel. Vous devrez modifier le fichier /etc/hosts.
•	Comme ce sont des serveurs virtuels les configurations de base sont les mêmes pour tous. Chaque serveur utilisera son propre emplacement pour mettre les pages Web. Chacun devra aussi utiliser ses propres fichiers logs.
	Nom hôte : virtuel1.aucegep.com
o	Dossier : /var/www/virtuels/virtuel1_80
	Nom hôte : virtuel2.aucegep.com
o	Dossier : /var/www/virtuels/virtuel2_80
	Nom hôte : virtuel1.aucegep.com   port 8000
o	Dossier : /var/www/virtuels/virtuel1_8000
	Nom hôte : virtuel2.aucegep.com   port 8000
o	Dossier : /var/www/virtuels/virtuel2_8000

TROISIÈME PARTIE – SERVEUR VIRTUEL PAR NOM (12 POINTS)

•	Créez un serveur virtuel par nom qui est accessible selon les spécifications suivantes : (adresses IP du serveur : 10.35.16.1)
	Nom hôte : www.ici.com
o	Dossier: /var/www/virtuels/ici
o	Accessible à tous
	Nom hôte : intranet.ici.com
o	Accessible seulement au sous-réseau 10.35.16.0/24
o	Dossier : /var/www/virtuels/intranet
	Nom hôte : intranet.ici.com sur le port 8000
o	Accessible seulement au sous-réseau 10.35.16.0/24
o	Dossier : /var/www/virtuels/pre_production
	Nom hôte : developpement.ici.com sur le port 80
o	Accessible seulement au sous-réseau 10.35.16.0/24
o	Dossier : /var/www/virtuels/developpement

QUATRIÈME PARTIE – SERVEUR VIRTUEL PAR IP (12 POINTS)

•	Créez et configurez les quatre serveurs Web virtuels par IP ci-bas.
•	Utilisez un répertoire différent pour chaque serveur (composé de son nom) sous : /var/www/virtuels/q4/nom_serveur. 
•	Ainsi, le serveur ventes utilisera le répertoire /var/www/virtuels/q4/ventes. 
•	Pour appeler ces serveurs, il suffit d'entrer une des adresses IP valides du serveur suivi du numéro de port désiré. Par exemple, 10.35.16.1:8080 doit nous afficher la page d'accueil du serveur ventes.
•	Voici les quatre serveurs virtuels à créer :
1.	Le serveur ventes sur le port 8080
2.	Le serveur admin sur le port 8081
3.	Le serveur chose sur le port 8082
4.	Le serveur autre sur le port 8083

CINQUIÈME PARTIE – SERVEUR VIRTUEL PAR NOM (12 POINTS)

•	Procédez à tous les changements nécessaires pour configurez les quatre serveurs Web virtuels ci-bas.
•	Utilisez un répertoire différent pour chaque serveur (composé de son nom) sous : /var/www/virtuels/q5/nom_serveur. 
•	Ainsi, le serveur www.chose.com utilisera le répertoire : /var/www/virtuels/q5/www.chose.com.
•	Voici les quatre serveurs virtuels à créer :
1.	Le serveur www.chose.com sur 10.50.1.1
2.	Le serveur ventes.chose.com sur 10.50.1.1
3.	Le serveur autre.chose.com sur 10.50.1.1
4.	Le serveur vip.chose.com sur 10.50.1.1
   
SIXIÈME PARTIE – SERVEUR VIRTUEL DYNAMIQUE (15 POINTS)

•	En utilisant VirtualDocumentRoot et un seul bloc virtualhost, configurez votre serveur Web pour supporter les six serveurs virtuels suivants : (adresse IP du serveur 10.51.1.1):
1.	Le serveur www.q6.com 
2.	Le serveur www.p6.com 
3.	Le serveur www.toto.com 
4.	Le serveur www2.q6.com 
5.	Le serveur www.q6.ca 
6.	Le serveur www2.p6.ca 
•	Les répertoires utilisés pour chaque serveur dépendent du nom du serveur dans le format suivant : utilisez l’interpolation des noms de serveur /var/www/virtuels/virt_q6/w/x/y/z où les lettres w, x, y et z représentent :
w = com ou ca 
x = 1er caractère suivi d’un . et du 2e caractère. ex: q6 donne q.6 et toto donne t.o
y = la première partie au complet, ex: www ou www2
z = le nom au long, ex: www.q6.com
Exemple, le répertoire pour www.toto.com est : …/virt_q6/com/t.o/www/www.toto.com
•	Envoyez les messages d'erreurs dans /var/log/httpd/tp2/error_virtuel_q6_log
Pour cette question vous pouvez utiliser tree pour vous aider à visualiser la structure des répertoires

SEPTIÈME PARTIE – SCRIPT (10 POINTS)

•	Vous devez écrire un script pour automatiser la création de serveurs virtuels. 
•	Le script reçoit un paramètre le nom du serveur virtuel à créer et votre script doit faire les entrées nécessaires pour créer le serveur, en plus comme nous n’utilisons pas de DNS le script devra ajouter une entrée dans le fichier /etc/hosts. (Utilisez l’adresse IP 192.168.100.1).
•	Plus spécifiquement, vous allez créer un répertoire /etc/httpd/conf/virtuels.d et c’est dans ce répertoire que vous allez ajouter les configurations des nouveaux serveurs virtuels. 
•	Le script devra créer un dossier dans /var/www/virtuels/q7/ pour le site et une page Web index.html qui affiche le nom du serveur virtuel et repartir le service httpd pour prendre en compte les changements. 
•	Ce script fonctionne pour n'importe quel nom de serveur (autre que ceux déjà utilisés) sur le port 80. 
•	Finalement, le script doit ouvrir le site sur votre navigateur avec comme texte le nom de votre site Web. 
•	Par exemple, en lançant la commande : tp2_q7.script test.local le script crée le site Web test.local et affiche dans le navigateur la page d’accueil du site qui doit afficher le texte test.local dans cette page.
