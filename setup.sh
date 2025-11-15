#!/bin/bash

LOGFILE="setup_ohmyzsh.log"
alias up='apt-get update; apt-get upgrade'
alias down='apt-get install'

# Mettre à jour la machine
echo "Mise à jour du système..." | tee -a "$LOGFILE"
sudo apt update
sudo apt upgrade -y

echo "Installation des paquets requis..." | tee -a "$LOGFILE"
sudo apt install -y libcurl4 vim curl git zsh

# Vérification de l'installation de Vim
if dpkg -l | grep -q "vim"; then
    echo "Le paquet 'vim' s'est correctement installé." | tee -a "$LOGFILE"
else
    echo "Le paquet 'vim' n'a pas été installé." | tee -a "$LOGFILE"
fi

# Vérification de l'installation de Curl
if dpkg -l | grep -q "^ii\s\+curl"; then
    echo "Le paquet 'curl' est installé." | tee -a "$LOGFILE"
else
    echo "Le paquet 'curl' n'est pas installé." | tee -a "$LOGFILE"
fi

# Configuration de Git
git config --global user.name "Your name"
git config --global user.email "Youremail"
git config --global init.defaultBranch main

# Configuration pour WSL (Windows Subsystem for Linux)
# Désactive filemode si on est sur un système de fichiers Windows monté
if mountpoint -q /mnt/c 2>/dev/null || [ -d /mnt/c ]; then
    echo "Configuration Git pour WSL..." | tee -a "$LOGFILE"
    git config --global core.filemode false
    git config --global core.autocrlf input
fi

# Installation de Zsh
if command -v zsh >/dev/null; then
    echo "zsh est déjà installé." | tee -a "$LOGFILE"
else
    echo "Installation de zsh..." | tee -a "$LOGFILE"
    sudo apt install -y zsh
fi

# Installation de Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh est déjà installé." | tee -a "$LOGFILE"
else
    echo "Installation de Oh My Zsh..." | tee -a "$LOGFILE"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s "$(which zsh)"
fi

# Génération de la clé SSH
echo "Génération d'une clé SSH..." | tee -a "$LOGFILE"
ssh-keygen -t rsa -b 4096 -C "Your email"

echo " Installation terminée." | tee -a "$LOGFILE"


