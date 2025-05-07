minikube start --driver=docker

& minikube docker-env | Invoke-Expression

docker info
docker pull mysql:8.0
docker pull sagariprashanth/gateway-router:latest
docker pull sagariprashanth/favorites-service:latest
docker pull sagariprashanth/reviews-service:latest


kubectl apply -f mysql-pv.yaml
kubectl apply -f mysql-pvc.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml

kubectl apply -f reviews-deployment.yaml
kubectl apply -f reviews-service.yaml

kubectl apply -f favorites-deployment.yaml
kubectl apply -f favorites-service.yaml

kubectl apply -f gateway-router-deployment.yaml
kubectl apply -f gateway-router-service.yaml

kubectl get pods

kubectl scale deployment mysql --replicas=1

run scripts  init_script.sql

kubectl port-forward svc/mysql 3307:3306 

kubectl port-forward svc/gateway-router 8889:8889
