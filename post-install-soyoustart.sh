#!/bin/bash                                                                                   
# Partionnement
mdadm --manage /dev/md2 --fail /dev/sdc2
mdadm --manage /dev/md2 --fail /dev/sdd2
mdadm --manage /dev/md2 --remove /dev/sdc2
mdadm --manage /dev/md2 --remove /dev/sdd2

# Désactivation ipv6
echo "# Désactivation ipv6" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf

# Configuration vim
cat << EOF > /root/.vimrc
set backspace=indent,eol,start  " Support du backspace
syntax on                       " Colorition syntaxique
set nocompatible                " Mode de compatibilité
set nu                          " Affiche la numérotation des lignes
set cursorline                  " Affiche une ligne sous le curseur
set incsearch                   "Déplace le curseur au fur et à mesure lors d'une recherche
set showcmd                     "Affiche la dernière commande
EOF

# Désactivation dépots entreprise Proxmox
sed -i 's/^/#/g' /etc/apt/sources.list.d/pve-enterprise.list
