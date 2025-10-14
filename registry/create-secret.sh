# Create registry namepace and certs/auth secrets

kubectl create ns registry
kubectl delete secret registry-auth -n registry --ignore-not-found
kubectl delete secret registry-cert -n registry --ignore-not-found
kubectl delete configmap registry-ca -n registry --ignore-not-found

kubectl create secret generic registry-auth -n registry --from-file=htpasswd=certs/htpasswd
kubectl create secret tls registry-cert -n registry --cert=certs/tls.crt --key=certs/tls.key
kubectl create configmap registry-ca -n registry --from-file=ca.crt=certs/tls.crt
