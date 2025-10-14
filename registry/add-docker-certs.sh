## Add certs to docker to yor docker client

# Create the directory for your registry
# Change xxxx to your DNS
sudo mkdir -p /etc/docker/certs.d/xxxx

# Copy the certificate (rename to ca.crt)
sudo cp certs/tls.crt /etc/docker/certs.d/xxxx/ca.crt

# Also create for the port variant (just in case)
sudo mkdir -p /etc/docker/certs.d/xxxx:5000
sudo cp certs/tls.crt /etc/docker/certs.d/xxxx:5000/ca.crt

# Restart Docker
sudo systemctl restart docker
