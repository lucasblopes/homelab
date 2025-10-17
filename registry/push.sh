# Change this to your DNS
export REGISTRY_HOST="your-dns"

# Check if you need port 5000 - try without first
# If Tailscale LoadBalancer is configured correctly, it should work without the port

# 1. Log In (try without port first)
docker login $REGISTRY_HOST -u <username> -p <password>

# If that fails, try with port:
# docker login $REGISTRY_HOST:5000 -u <username> -p <password>

# 2. Get a local image
docker pull alpine

# 3. Tag the image (without port)
docker tag alpine $REGISTRY_HOST/my-alpine:latest

# 4. Push the image
docker push $REGISTRY_HOST/my-alpine:latest
