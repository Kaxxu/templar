# Kubernetes

Directory containing `Kubernetes` files to deploy the Cluster

# Kubernetes commands


Create `nginx-app` namespace:

`kubectl create namespace nginx-app`


Create deployment:

`kubectl apply -f eks-nginx-deployment.yml`

Create service:

`kubectl apply -f eks-nginx-service.yml`

## Fetch k8s information 

Get deployment detailed information:

`kubectl describe deployments -n nginx-app`

Get service detailed information:

`kubectl get svc -n nginx-app`

Get all information:

`kubectl get all -n nginx-app`
