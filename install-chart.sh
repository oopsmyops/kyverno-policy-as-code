#!/bin/bash

helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo add policy-reporter https://kyverno.github.io/policy-reporter
helm repo update
# Install Kyverno using Helm
helm upgrade -i kyverno kyverno/kyverno -n kyverno --create-namespace --version 3.4.1

# Install Policy Reporter using Helm
helm upgrade -i policy-reporter policy-reporter/policy-reporter \
    --version 3.1.3 \
    --create-namespace -n policy-reporter \
    --set ui.enabled=true \
    --set plugin.kyverno.enabled=true

# Create ingress for Policy Reporter UI
kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: policy-reporter-ingress
  namespace: policy-reporter
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  rules:
  - host: policy-reporter-7f000001.nip.io
    http: 
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: policy-reporter-ui
            port:
              number: 8080
EOF