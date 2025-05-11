Write-Host "Starting services server ... "
# List of YAML files to apply
$files = @(
    "services/reviews-deployment.yaml",
    "services/favorites-deployment.yaml",
    "services/flatbuddy-deployment.yaml",
    "services/reports-deployment.yaml",
    "services/chat-deployment.yaml",
    "services/notification-deployment.yaml",
    "services/gateway-router-deployment.yaml"
)

foreach ($file in $files) {
    Write-Host "Applying $file..."
    kubectl apply -f $file
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error applying $file. Stopping script."
        break
    }
}
