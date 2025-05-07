"# flat_services" 
# start minikube inside docker
minikube start --driver=docker

# point to minikube env
& minikube docker-env | Invoke-Expression

# verify its pointed to minikube or not
docker info

# pull all the required images  
docker pull mysql:8.0    
docker pull sagariprashanth/gateway-router:1.0  
docker pull sagariprashanth/favorites-service:1.0  
docker pull sagariprashanth/reviews-service:1.0  
docker pull sagariprashanth/reports-service:1.0  
docker pull sagariprashanth/flatbuddy-service:1.0  

# verify images are pulled or not 
docker images 

# start services
kubectl apply -f mysql-pv.yaml  
kubectl apply -f mysql-pvc.yaml  
kubectl apply -f mysql-deployment.yaml  
kubectl apply -f mysql-deployment_v.yaml  
kubectl apply -f mysql-service.yaml  
 

# open init_script.sql file and run inside mysql
kubectl port-forward svc/mysql 3307:3306 

kubectl apply -f reviews-deployment.yaml  
kubectl apply -f reviews-service.yaml  

kubectl apply -f favorites-deployment.yaml  
kubectl apply -f favorites-service.yaml  

kubectl apply -f flatbuddy-deployment.yaml 

kubectl apply -f reports-deployment.yaml 
 

kubectl apply -f gateway-router-deployment.yaml  
kubectl apply -f gateway-router-service.yaml  

setup-nodejs.ps1 

kubectl get pods   

<!-- kubectl scale deployment mysql --replicas=1 -->

kubectl port-forward svc/gateway-router 8889:8889  

# if any issues 
kubectl describe pod <pod_name>
