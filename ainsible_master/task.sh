#!/bin/bash

# === Couleurs stylées ===
GREEN=$(tput setaf 2 2>/dev/null || echo "")
YELLOW=$(tput setaf 3 2>/dev/null || echo "")
RED=$(tput setaf 1 2>/dev/null || echo "")
BLUE=$(tput setaf 6 2>/dev/null || echo "")
RESET=$(tput sgr0 2>/dev/null || echo "")

# === Animations ===
spinner() {
  local pid=$1 delay=0.1 spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
  while kill -0 "$pid" 2>/dev/null; do
    for ((i = 0; i < ${#spinstr}; i++)); do
      printf "\r${YELLOW}⏳ %s ${RESET}" "${spinstr:$i:1}"
      sleep $delay
    done
  done
  printf "\r${GREEN}✔️  Fait${RESET}\n"
}

banner() { echo -e "\n${BLUE}🔷 $1${RESET}"; sleep 0.5; }
success() { echo -e "${GREEN}✅ $1${RESET}"; sleep 0.2; }
fail() { echo -e "${RED}❌ $1${RESET}"; exit 1; }

# === Étape 1 : Extraction IP du Master depuis hosts.ini ===
banner "Étape 1 : Extraction IP du Master"

INPUT_FILE="hosts.ini"

[[ ! -f "$INPUT_FILE" ]] && fail "Fichier $INPUT_FILE introuvable."

MASTER_IP=$(awk '/\[Master\]/{flag=1; next} /^\[/{flag=0} flag && /ansible_host=/' "$INPUT_FILE" | head -n 1 | sed -n 's/.*ansible_host=\([^ ]*\).*/\1/p')
[[ -z "$MASTER_IP" ]] && fail "Impossible d'extraire l'adresse IP du Master."

success "IP du Master : $MASTER_IP"

# === Étape 2 : Créer ~/task sur le Master ===
banner "Étape 2 : Création du dossier ~/task sur le Master"
(ssh ubuntu@"$MASTER_IP" "mkdir -p ~/task") & spinner $!

# === Étape 3 : Transfert des fichiers ===
banner "Étape 3 : Transfert de hosts.ini et ansible.yml"
(scp "$INPUT_FILE" ansible.yml ubuntu@"$MASTER_IP":~/task/) & spinner $!

# === Étape 4 : Correction de hosts.ini → hosts_corrected.ini sur le Master ===
banner "Étape 4 : Correction de hosts.ini sur le Master"

ssh ubuntu@"$MASTER_IP" 'bash -s' <<'EOF' & spinner $!
cd ~/task
INPUT="hosts.ini"
OUTPUT="hosts_corrected.ini"
GROUPS=("Master" "application" "CiCd" "monitoring")

> "$OUTPUT"

for group in "${GROUPS[@]}"; do
  echo "[$group]" >> "$OUTPUT"
  awk -v grp="$group" '
    $0 ~ "\\[" grp "\\]" {flag=1; next}
    $0 ~ /^\[/ {flag=0}
    flag && NF {
      count[grp]++
      printf "%s-node%d %s\n", tolower(grp), count[grp], $0
    }
  ' "$INPUT" >> "$OUTPUT"
done
EOF

success "Fichier hosts_corrected.ini généré sur le Master"

# === Étape 5 : Installer Ansible si nécessaire ===
banner "Étape 5 : Installation d'Ansible (si nécessaire)"
(ssh ubuntu@"$MASTER_IP" <<'EOF'
  if ! command -v ansible-playbook >/dev/null; then
    sudo apt update -qq
    sudo apt install -yqq software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -yqq ansible
  fi
EOF
) & spinner $!

# === Étape 6 : Exécution du playbook ===
banner "Étape 6 : Exécution de ansible.yml avec hosts_corrected.ini"
(ssh ubuntu@"$MASTER_IP" "cd ~/task && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts_corrected.ini ansible.yml") & spinner $!

# === Fin ===
banner "🎉 Déploiement terminé avec succès !"
