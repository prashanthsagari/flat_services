minikube start --driver=docker

& minikube docker-env | Invoke-Expression

docker pull mysql:8.0


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



run scripts  init_script.sql



kubectl port-forward svc/gateway-router 8889:8889
