#!/bin/bash

# === Style ===
GREEN=$(tput setaf 2 2>/dev/null || echo "")
YELLOW=$(tput setaf 3 2>/dev/null || echo "")
RED=$(tput setaf 1 2>/dev/null || echo "")
BLUE=$(tput setaf 4 2>/dev/null || echo "")
RESET=$(tput sgr0 2>/dev/null || echo "")

banner() { echo -e "\n${BLUE}🧹 $1${RESET}\n"; }
step() { echo -e "${YELLOW}➡️  $1...${RESET}"; }
success() { echo -e "${GREEN}✅ $1${RESET}"; }
fail() { echo -e "${RED}❌ $1${RESET}"; exit 1; }

# === Étape 1 : Extraire l'IP du Master depuis hosts.ini ===
banner "Étape 1 : Extraction de l'IP du Master"

if [[ ! -f hosts.ini ]]; then
  fail "Le fichier hosts.ini est introuvable."
fi

MASTER_IP=$(awk '/\[Master\]/{flag=1; next} /^\[/{flag=0} flag' hosts.ini | grep ansible_host | sed -n 's/.*ansible_host=\([^ ]*\).*/\1/p')

if [[ -z "$MASTER_IP" ]]; then
  fail "Impossible d'extraire l'adresse IP du Master."
fi

success "IP du Master détectée : $MASTER_IP"

# === Étape 2 : Supprimer ~/task sur le Master ===
banner "Étape 2 : Suppression du dossier ~/task sur le Master"

step "Connexion SSH et suppression du dossier"
ssh ubuntu@"$MASTER_IP" "rm -rf ~/task" && success "Dossier ~/task supprimé" || fail "Échec de la suppression"

# === Fin ===
banner "🧼 Rollback terminé. Le Master est propre !"
