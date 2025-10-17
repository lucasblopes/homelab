# 1. Build the image
docker build -t . <registry >/wol:latest

# 2. Push the image to your registry (e.g., Docker Hub, GCR, ECR)
docker push <registry >/wol:latest
