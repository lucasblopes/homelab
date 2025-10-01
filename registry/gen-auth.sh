mkdir certs

# Change this to your Tailnet DNS
openssl req \
    -newkey rsa:4096 -nodes -sha256 -keyout certs/tls.key \
    -addext "subjectAltName = DNS:registry.wyvern-palermo.ts.net" \
    -x509 -days 3650 -out certs/tls.crt \
    -subj "/CN=registry.wyvern-palermo.ts.net"

docker run --rm --entrypoint htpasswd httpd:latest -Bbn <username> <password> >certs/htpasswd

kubectl delete secret registry-auth -n registry --ignore-not-found
kubectl delete secret registry-cert -n registry --ignore-not-found
kubectl delete configmap registry-ca -n registry --ignore-not-found

kubectl create secret generic registry-auth -n registry --from-file=htpasswd=certs/htpasswd
kubectl create secret tls registry-cert -n registry --cert=certs/tls.crt --key=certs/tls.key
kubectl create configmap registry-ca -n registry --from-file=ca.crt=certs/tls.crt

## Add certs to docker

# Create the directory for your registry
sudo mkdir -p /etc/docker/certs.d/registry.wyvern-palermo.ts.net

# Copy the certificate (rename to ca.crt)
sudo cp certs/tls.crt /etc/docker/certs.d/registry.wyvern-palermo.ts.net/ca.crt

# Also create for the port variant (just in case)
sudo mkdir -p /etc/docker/certs.d/registry.wyvern-palermo.ts.net:5000
sudo cp certs/tls.crt /etc/docker/certs.d/registry.wyvern-palermo.ts.net:5000/ca.crt

# Restart Docker
sudo systemctl restart docker

# rm certs/htpasswd
