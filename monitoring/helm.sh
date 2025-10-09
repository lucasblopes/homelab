helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus-stack prometheus-community/kube-prometheus-stack --namespace=monitoring --create-namespace
kubectl create secret generic grafana-admin-credentials \
    --from-literal=admin-user=admin \
    --from-literal=admin-password='YourSecurePassword' \
    -n monitoring
# helm show values prometheus-community/kube-prometheus-stack >prometheus-default-values.yaml
helm upgrade prometheus-stack prometheus-community/kube-prometheus-stack -n monitoring --values values.yaml
