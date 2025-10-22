# Replace 'yourname@example.com' with your actual Tailscale username/email.
kubectl create clusterrolebinding your-user-cluster-admin \
    --clusterrole=cluster-admin \
    --user="your-email"
