#!/bin/bash

# === 🎨 Couleurs stylées ===
GREEN=$(tput setaf 2 2>/dev/null || echo "")
YELLOW=$(tput setaf 3 2>/dev/null || echo "")
RED=$(tput setaf 1 2>/dev/null || echo "")
BLUE=$(tput setaf 6 2>/dev/null || echo "")
BOLD=$(tput bold 2>/dev/null || echo "")
RESET=$(tput sgr0 2>/dev/null || echo "")

# === 💫 Animation deluxe avec effet spinner ===
spinner() {
  local pid=$1 delay=0.08 spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
  while kill -0 "$pid" 2>/dev/null; do
    for ((i = 0; i < ${#spinstr}; i++)); do
      printf "\r${YELLOW}⏳  %s  ${RESET}" "${spinstr:$i:1}"
      sleep $delay
    done
  done
  printf "\r${GREEN}✔️  Terminé avec succès !${RESET}\n"
}

# === 🪧 Bannières et messages ===
banner() { echo -e "\n${BLUE}${BOLD}🔷 $1${RESET}"; sleep 0.5; }
success() { echo -e "${GREEN}✅ $1${RESET}"; sleep 0.2; }
fail() { echo -e "${RED}❌ $1${RESET}"; exit 1; }

# === Étape 1 : Extraction IP du Master ===
banner "Étape 1 : Détection de l'adresse IP du Master via hosts.ini"

INPUT_FILE="hosts.ini"

[[ ! -f "$INPUT_FILE" ]] && fail "Fichier $INPUT_FILE introuvable dans le dossier courant."

MASTER_IP=$(awk '/\[Master\]/{flag=1; next} /^\[/{flag=0} flag && /ansible_host=/' "$INPUT_FILE" | head -n 1 | sed -n 's/.*ansible_host=\([^ ]*\).*/\1/p')
[[ -z "$MASTER_IP" ]] && fail "Impossible d'extraire l'adresse IP du Master depuis le fichier."

success "Adresse IP du Master détectée : $MASTER_IP"

# === Étape 2 : Création du dossier distant ~/task ===
banner "Étape 2 : Création du répertoire distant ~/task sur le Master"
(ssh ubuntu@"$MASTER_IP" "mkdir -p ~/task") & spinner $!

# === Étape 2.5 : Génération d'une paire de clés SSH sur le Master ===
banner "Étape 2.5 : Génération d'une paire de clés SSH (si absente) sur le Master"
(ssh ubuntu@"$MASTER_IP" <<'EOF'
  if [[ ! -f ~/.ssh/id_rsa ]]; then
    echo "🔐 Aucune clé SSH détectée, création de la paire..."
    ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
  else
    echo "🔐 Clé SSH déjà présente, rien à faire."
  fi
EOF
) & spinner $!
success "Paire de clés SSH prête sur le Master."

# === Étape 3 : Transfert des fichiers et dossiers nécessaires ===
banner "Étape 3 : Transfert de hosts.ini, ansible.yml et du dossier application/ vers le Master"

# → Transfert des fichiers
(scp "$INPUT_FILE" ansible.yml ubuntu@"$MASTER_IP":~/task/) & spinner $!
success "Fichiers hosts.ini et ansible.yml transférés."

# → Transfert du dossier application/
(scp -r application ubuntu@"$MASTER_IP":~/task/) & spinner $!
success "Dossier application/ transféré avec succès."

# === Étape 4 : Installation d'Ansible si besoin ===
banner "Étape 4 : Vérification et installation d'Ansible sur le Master (si manquant)"
(ssh ubuntu@"$MASTER_IP" <<'EOF'
  if ! command -v ansible-playbook >/dev/null; then
    echo "⏳ Ansible non détecté. Installation en cours..."
    sudo apt update -qq
    sudo apt install -yqq software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -yqq ansible
  else
    echo "✅ Ansible est déjà installé."
  fi
EOF
) & spinner $!

# === 🎉 Fin ===
banner "🎉 Le déploiement initial est prêt ! Tous les fichiers sont en place."
