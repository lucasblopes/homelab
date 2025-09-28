helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus-stack prometheus-community/kube-prometheus-stack --namespace=monitoring --create-namespace
# helm show values prometheus-community/kube-prometheus-stack >prometheus-default-values.yaml
helm upgrade prometheus-stack prometheus-community/kube-prometheus-stack -n monitoring --values values.yaml
