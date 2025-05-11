"# Flat Services"   

https://hub.docker.com/repository/docker/sagariprashanth/

### Run below command to allow running  .psl file in poweshell 
Set-ExecutionPolicy Unrestricted  

# start minikube inside docker and setup db's
.\db_deployment.ps1

# open init_script.sql file and run inside mysql
kubectl port-forward svc/mysql 3307:3306 

# start services 
.\services_deploy.ps1

# verify docker is pointed to minikube or not
docker info

# verify images are pulled or not 
docker images 

# check pod status
kubectl get pods   

<!-- kubectl scale deployment mysql --replicas=1 -->

# Access gateway service
kubectl port-forward svc/gateway-router 8889:8889  

# Stop minikube
minikube stop  


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
