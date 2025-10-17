# Create certs and auth files
# Use Tailscale DNS or MetalLB ip
REGISTRY_IP="<ip>"
REGISTRY_DNS="<dns>"

mkdir -p certs

openssl req \
    -newkey rsa:4096 -nodes -sha256 -keyout certs/tls.key \
    -addext "subjectAltName = IP:${REGISTRY_IP},DNS:${REGISTRY_DNS}" \
    -x509 -days 3650 -out certs/tls.crt \
    -subj "/CN=${REGISTRY_IP}"

docker run --rm --entrypoint htpasswd httpd:latest -Bbn <username> <password> >certs/htpasswd
