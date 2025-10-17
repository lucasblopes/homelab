## Add certs to docker to yor docker client
# Use Tailscale DNS or MetalLB ip
REGISTRY_DNS="<dns>"

# Create the directory for your registry
# Change xxxx to your DNS
sudo mkdir -p /etc/docker/certs.d/${REGISTRY_DNS}

# Copy the certificate (rename to ca.crt)
sudo cp certs/tls.crt /etc/docker/certs.d/${REGISTRY_DNS}/ca.crt

# Also create for the port variant (just in case)
sudo mkdir -p /etc/docker/certs.d/${REGISTRY_DNS}:5000
sudo cp certs/tls.crt /etc/docker/certs.d/${REGISTRY_DNS}:5000/ca.crt

# Restart Docker
sudo systemctl restart docker
