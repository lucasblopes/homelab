helm upgrade \
    --install \
    tailscale-operator \
    tailscale/tailscale-operator \
    --namespace=tailscale \
    --create-namespace \
    --set-string oauth.clientId=(clientID) \
    --set-string oauth.clientSecret=(clientSecret) \
    --wait
