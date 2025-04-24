

### 📦 Déploiement Automatisé depuis le Master avec Ansible
Ce playbook Ansible permet d'automatiser la préparation du serveur Master pour le déploiement d'une infrastructure. Il centralise les clés SSH, les fichiers nécessaires, et assure la connectivité avec les autres hôtes définis dans l'inventaire (hosts.ini).

📁 Structure du projet

project/
├── ansible.yml
├── hosts.ini
└── application/
🚀 Objectif
Préparer le Master pour le déploiement.

Copier les fichiers nécessaires (inventaire, application, clés).

Assurer la connexion SSH entre le Master et les autres groupes de machines (Application, Pipeline, Supervision).

Installer Ansible si besoin.

Nettoyer les fichiers sensibles localement.

⚙️ Prérequis
Une machine Master avec accès root.

Des groupes d’hôtes définis dans hosts.ini (Application, Pipeline, Supervision).

Ansible installé en local ou via une autre machine d’administration.

🧩 Description des tâches du Playbook
Étape 1 : Création du répertoire distant
Création d’un répertoire ~/task sur le Master pour centraliser les fichiers nécessaires au déploiement.

Étape 2 : Génération d’une paire de clés SSH
Génère une paire de clés RSA (4096 bits) sur le Master si elle n’existe pas déjà, pour une connexion sans mot de passe aux autres machines.

Étape 3 : Copie des fichiers de configuration
Transfert des fichiers hosts.ini et ansible.yml vers le répertoire ~/task du Master.

Étapes 4 et 5 : Copie du répertoire application
Copie complète du dossier application/ vers le répertoire distant ~/task/application.

Étape 6 et 7 : Récupération des clés SSH du Master
Les clés SSH (privée et publique) du Master sont récupérées et stockées localement.

Étape 8 : Déploiement de la clé publique
La clé publique du Master est copiée vers tous les hôtes définis dans les groupes Application, Pipeline et Supervision, facilitant l’accès sans mot de passe.

Étape 9 : Installation d’Ansible sur le Master
Vérifie la présence d’Ansible sur le Master et l’installe automatiquement si absent.

Étape 10 : Enregistrement des hôtes dans known_hosts
Ajoute automatiquement les empreintes SSH de tous les hôtes du fichier hosts.ini au fichier ~/.ssh/known_hosts du Master.

Étape 11 : Nettoyage local
Supprime localement les fichiers de clé publique utilisés pour sécuriser l’environnement après l’exécution.

📌 Lancement du playbook
Exécuter le playbook depuis la machine d’administration :

bash
Copier
Modifier
ansible-playbook -i hosts.ini ansible.yml
🔐 Sécurité
Les clés SSH privées ne sont pas supprimées pour éviter toute perte accidentelle.

Seules les clés publiques sont nettoyées localement après le déploiement.

