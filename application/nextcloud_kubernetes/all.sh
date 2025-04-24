#!/bin/bash

# Variables à adapter
APP_HOST="ubuntu@192.168.0.11"           # IP privée ou publique de la VM Application
SSH_KEY="~/.ssh/my_key.pem"              # Clé privée SSH
DEPLOY_FILE="kub_nextcloud.yml"          # Fichier de déploiement local

echo "🔧 [1/4] Installation de K3s sur l'instance Application..."
ssh -i "$SSH_KEY" "$APP_HOST" <<'EOF'
  curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable traefik" sh -
EOF

echo "📤 [2/4] Transfert du fichier de déploiement Kubernetes..."
scp -i "$SSH_KEY" "$DEPLOY_FILE" "$APP_HOST:/home/ubuntu/$DEPLOY_FILE"

echo "🚀 [3/4] Application du déploiement Kubernetes..."
ssh -i "$SSH_KEY" "$APP_HOST" <<EOF
  kubectl apply -f /home/ubuntu/$DEPLOY_FILE
EOF

echo "📋 [4/4] Vérification des ressources déployées (namespace 'nextcloud')..."
ssh -i "$SSH_KEY" "$APP_HOST" "kubectl get all -n nextcloud"
