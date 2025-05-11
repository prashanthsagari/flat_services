# Write-Host "Start minikube using docker ..."
minikube start --driver=docker

# Write-Host "Point minikube to docker environment ..."
& minikube docker-env | Invoke-Expression

Write-Host "Pulling required images first ..."
docker pull mysql:8.0  
docker pull mongo:latest  
docker pull sagariprashanth/gateway-router:2.0  
docker pull sagariprashanth/favorites-service:2.0  
docker pull sagariprashanth/reviews-service:2.0  
docker pull sagariprashanth/reports-service:2.0  
docker pull sagariprashanth/flatbuddy-service:2.0  
docker pull sagariprashanth/flat-listing-service:1.0  
docker pull sagariprashanth/chat-service:1.0  
docker pull sagariprashanth/notification-service:1.0  


Write-Host "Start mysql server ... "
# List of YAML files to apply
$files = @(
    "services/mysql-deployment.yaml",
    "services/kafka-deployment.yaml",
    "services/mongo-deployment.yaml",
    "services/node-deployment.yaml"

)

foreach ($file in $files) {
    Write-Host "Applying $file..."
    kubectl apply -f $file
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error applying $file. Stopping script."
        break
    }
}
