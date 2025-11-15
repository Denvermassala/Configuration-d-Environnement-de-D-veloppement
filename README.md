# Projet de Configuration d'Environnement de Développement

Ce projet contient un script d'automatisation pour configurer un environnement de développement Linux complet avec Oh My Zsh, Git, et d'autres outils essentiels.

## Description

Ce projet automatise la configuration d'un environnement de développement sur Linux en installant et configurant :
- **Zsh** : Un shell avancé pour remplacer bash
- **Oh My Zsh** : Framework de configuration pour Zsh avec des thèmes et plugins
- **Git** : Système de contrôle de version
- **Vim** : Éditeur de texte en ligne de commande
- **Curl** : Outil pour transférer des données
- **Clés SSH** : Pour l'authentification sécurisée

## 🚀 Utilisation

### Prérequis
- Système d'exploitation Linux (Debian/Ubuntu)
- Accès sudo/root
- Connexion Internet

### Installation

1. Rendez le script exécutable :
```bash
chmod +x setup.sh
```

2. Exécutez le script :
```bash
./setup.sh
```

Le script va :
- Mettre à jour le système
- Installer les paquets requis
- Configurer Git (vous devrez modifier les valeurs par défaut)
- Installer Zsh et Oh My Zsh
- Générer une clé SSH

### Configuration personnalisée

Avant d'exécuter le script, modifiez les lignes suivantes dans `setup.sh` :
- Ligne 30 : `git config --global user.name "Your name"` → Remplacez par votre nom
- Ligne 31 : `git config --global user.email "Youremail"` → Remplacez par votre email
- Ligne 52 : `ssh-keygen -t rsa -b 4096 -C "Your email"` → Remplacez par votre email

## Structure du Projet

```
.
├── README.md              # Ce fichier - Documentation du projet
├── setup.sh               # Script principal d'installation
├── setup_ohmyzsh.log      # Fichier de log des opérations
└── configuration/         # Dossier contenant les fichiers de configuration
    ├── git_config.example      # Exemple de configuration Git
    ├── zshrc.example           # Exemple de configuration Zsh
    ├── ssh_config.example      # Exemple de configuration SSH
    └── packages.txt            # Liste des paquets installés
```

## Dossier Configuration

Le dossier `configuration/` contient des fichiers d'exemple et de référence pour configurer votre environnement :

### `git_config.example`
Fichier d'exemple pour la configuration Git. Contient :
- Configuration utilisateur (nom et email)
- Paramètres de l'éditeur
- Configuration des branches par défaut
- Paramètres de push

**Utilisation** : Copiez le contenu dans `~/.gitconfig` ou utilisez les commandes `git config --global`

### `zshrc.example`
Fichier d'exemple pour la configuration Zsh/Oh My Zsh. Contient :
- Configuration du thème Oh My Zsh
- Liste des plugins recommandés
- Alias personnalisés
- Variables d'environnement

**Utilisation** : Ce fichier est créé automatiquement lors de l'installation d'Oh My Zsh. Vous pouvez le personnaliser selon vos besoins.

### `ssh_config.example`
Fichier d'exemple pour la configuration SSH. Contient :
- Configuration pour GitHub
- Configuration pour GitLab
- Paramètres généraux de sécurité

**Utilisation** : Copiez dans `~/.ssh/config` pour configurer vos connexions SSH

### `packages.txt`
Liste des paquets installés par le script. Utile pour :
- Référence des dépendances
- Réinstallation sur un nouveau système
- Documentation des outils utilisés

## 🔧 Fonctionnalités du Script

Le script `setup.sh` effectue les opérations suivantes :

1. **Mise à jour du système** : Met à jour la liste des paquets et le système
2. **Installation des paquets** : Installe libcurl4, vim, curl, git, zsh
3. **Vérification** : Vérifie que vim et curl sont correctement installés
4. **Configuration Git** : Configure le nom et l'email Git (à personnaliser)
5. **Installation Zsh** : Installe Zsh s'il n'est pas déjà présent
6. **Installation Oh My Zsh** : Installe Oh My Zsh et change le shell par défaut
7. **Génération SSH** : Génère une clé SSH RSA 4096 bits (à personnaliser)

## 📝 Logs

Toutes les opérations sont enregistrées dans `setup_ohmyzsh.log` pour un suivi des installations et des erreurs potentielles.

## ⚠️ Notes Importantes

- Le script nécessite des privilèges sudo
- Certaines configurations (Git, SSH) doivent être personnalisées avec vos informations
- Après l'installation, vous devrez redémarrer votre terminal ou vous reconnecter pour que Zsh devienne le shell par défaut
- La clé SSH générée sera stockée dans `~/.ssh/id_rsa` (privée) et `~/.ssh/id_rsa.pub` (publique)

## 🔐 Sécurité

- Ne partagez jamais votre clé SSH privée (`~/.ssh/id_rsa`)
- Vous pouvez partager votre clé SSH publique (`~/.ssh/id_rsa.pub`) pour l'ajouter à vos services (GitHub, GitLab, etc.)
- Personnalisez les configurations Git et SSH avec vos propres informations

## 📚 Ressources

- [Oh My Zsh Documentation](https://ohmyz.sh/)
- [Git Documentation](https://git-scm.com/doc)
- [Zsh Documentation](https://www.zsh.org/)
- [SSH Documentation](https://www.openssh.com/)

## 🤝 Contribution

N'hésitez pas à améliorer ce script et à partager vos configurations personnalisées !

## 📄 Licence

Ce projet est libre d'utilisation et de modification.

