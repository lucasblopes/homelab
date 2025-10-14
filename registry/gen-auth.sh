# Create certs and auth files

mkdir certs

# Change this to your DNS
openssl req \
    -newkey rsa:4096 -nodes -sha256 -keyout certs/tls.key \
    -addext "subjectAltName = DNS:xxxx.ts.net" \
    -x509 -days 3650 -out certs/tls.crt \
    -subj "/CN=xxxx.ts.net"

docker run --rm --entrypoint htpasswd httpd:latest -Bbn <username> <password> >certs/htpasswd
