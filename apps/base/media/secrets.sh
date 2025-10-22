kubectl create secret generic protonvpn-secrets \
    --from-literal=WIREGUARD_PRIVATE_KEY='private-key' \
    --namespace media
