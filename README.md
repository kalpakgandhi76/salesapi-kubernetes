# New Business (Sales Platform)
New Business Platform API

# Build and Push the Image using Docker file.
az acr build --registry $ACRNAME --image salesapi:v1 --file ./Dockerfile .

# Create Kubernetes Objects
create namespace
create load balancer service
create deployment

