#!/bin/bash #
if [ -z "$1" ]
  then
    echo "fournir le nom du serveur: $0 nom_du_serveur_virtuel"
    exit 1

fi
 
if [ ! -d "/etc/httpd/conf/virtuels.d" ]
  then
    echo "Le répertoire /etc/httpd/conf/virtuels.d n'existe pas"
    exit 1

fi

if [ -d "/var/www/virtuels/q7/$1" ]
  then
    echo "Le répertoire /var/www/virtuels/q7/$1 existe déjà"
    exit 1
fi 
sudo mkdir -p "/var/www/virtuels/q7/$1"

echo "<html><body><h1>Site Web: $1</h1></body></html>" > "/var/www/virtuels/q7/$1/index.html" 
echo "10.80.100.17 $1" >> /etc/hosts # Création du fichier de configuration
echo "<VirtualHost 10.80.100.17>
    ServerName $1
    DocumentRoot /var/www/virtuels/q7/$1</VirtualHost>" > "/etc/httpd/conf/virtuels.d/$1.conf" 
if [ ! -f "/etc/httpd/conf/virtuels.d/$1.conf" ]
  then
    echo "Le fichier de configuration /etc/httpd/conf/virtuels.d/$1.conf n'a pas été créé"
    exit 1
fi 
systemctl restart httpd.service # Ouverture du site dans le navigateur
xdg-open "http://$1/"
