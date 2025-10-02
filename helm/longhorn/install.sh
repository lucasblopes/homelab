# https://docs.k3s.io/storage
# OBS.: make sure that open-iscsi and nfs-common is installed in all nodes
#kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.8.1/deploy/longhorn.yaml

helm repo add longhorn https://charts.longhorn.io
helm repo update
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.10.0
# Run the following to add tolerations to run longhorn on master nodes
helm upgrade longhorn longhorn/longhorn \
    --namespace longhorn-system \
    -f values.yaml

# Run the following to enable ingress
kubectl apply -f ingress.yaml
