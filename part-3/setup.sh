#!/bin/bash

set -e

echo "Starting ArgoCD setup..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 1. Create k3d cluster
echo -e "${BLUE} Creating k3d cluster 'playground'...${NC}"
k3d cluster create playground \
    --port "8888:80@loadbalancer" \
    --port "8443:443@loadbalancer"

echo -e "${GREEN} Cluster created${NC}"

# 2. Create argocd namespace
echo -e "${BLUE} Creating namespace 'argocd'...${NC}"
kubectl create namespace argocd

echo -e "${GREEN} Namespace created${NC}"

# 3. Install ArgoCD
echo -e "${BLUE}🔧 Installing ArgoCD...${NC}"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo -e "${GREEN} ArgoCD installed${NC}"

# 4. Wait for ArgoCD to be ready
echo -e "${BLUE} Waiting for ArgoCD to be ready (this may take 1-2 minutes)...${NC}"
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-server -n argocd --timeout=300s

echo -e "${GREEN} ArgoCD is ready${NC}"

# 5. Apply ArgoCD application configuration
echo -e "${BLUE} Applying ArgoCD application configuration...${NC}"
kubectl apply -f argocd-app.yml

echo -e "${GREEN} ArgoCD application configured${NC}"

# 6. Get ArgoCD initial password
echo -e "${BLUE} Retrieving ArgoCD password...${NC}"
ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

echo ""
echo -e "${GREEN}═══════════════════════════════════════════════════════${NC}"
echo -e "${GREEN} Setup complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${BLUE}ArgoCD Credentials:${NC}"
echo "  Username: admin"
echo "  Password: $ARGOCD_PASSWORD"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Run: kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo "  2. Open: https://localhost:8080"
echo "  3. Login with the credentials above"
echo ""
echo -e "${BLUE}To access your application:${NC}"
echo "  http://localhost:8080 (via Ingress)"
echo ""
