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
docker pull sagariprashanth/flat-listing-service:1.0

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

### Run below command to allow running  .psl file in poweshell 
Set-ExecutionPolicy Unrestricted  

# if below command is not working then clone flat-listing-service repo from there run
 .\setup-nodejs.ps1   

kubectl get pods   

<!-- kubectl scale deployment mysql --replicas=1 -->

kubectl port-forward svc/gateway-router 8889:8889  


# Get service name 
kubectl get svc

# To delete any deployments and services 
kubectl delete deployment <service_name>  
kubectl delete service <service_name>  

# if any issues 
kubectl describe pod <pod_name>


### DANGER 
minikube delete --all
### Deletes all Minikube clusters on your system, including:
  All VMs or containers created by Minikube  
  Cluster configuration  
  Associated data like volumes and persistent data  
  Network settings created by Minikube  

# to build and push images 
docker build -t gateway-router:1.0 .
docker build -t flat-listing-service:1.0 .
docker build -t reviews-service:1.0 .
docker build -t reports-service:1.0 .
docker build -t favorites-service:1.0 .
docker build -t flatbuddy-service:1.0 .

docker tag favorites-service:1.0 sagariprashanth/favorites-service:1.0
docker push sagariprashanth/favorites-service:1.0

docker tag flatbuddy-service:1.0 sagariprashanth/flatbuddy-service:1.0
docker push sagariprashanth/flatbuddy-service:1.0

docker tag reports-service:1.0 sagariprashanth/reports-service:1.0
docker push sagariprashanth/reports-service:1.0

docker tag flat-listing-service:1.0 sagariprashanth/flat-listing-service:1.0
docker push sagariprashanth/flat-listing-service:1.0

docker tag gateway-router:1.0 sagariprashanth/gateway-router:1.0
docker push sagariprashanth/gateway-router:1.0

docker tag reviews-service:1.0 sagariprashanth/reviews-service:1.0
docker push sagariprashanth/reviews-service:1.0


docker tag gateway-router:latest sagariprashanth/gateway-router:latest
docker push sagariprashanth/gateway-router:latest



-- kubectl delete -f reports-deployment.yaml 
