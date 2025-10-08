#kubectl create namespace minecraft --dry-run=client -o name
kubectl create secret generic playit-gg-secret --from-literal=SECRET_KEY={TUNNEL_KEY_GOES_HERE} -n minecraft
