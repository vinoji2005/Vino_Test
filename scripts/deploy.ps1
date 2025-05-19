param (
    [string]$ResourceGroupName = "rg-fioneer-vinoth",
    [string]$Location = "eastus"
)

Write-Host " Logging in to Azure..."
az login

Write-Host " Checking or creating resource group..."
$exists = az group exists --name $ResourceGroupName | ConvertFrom-Json
if (-not $exists) {
    az group create --name $ResourceGroupName --location $Location
    Write-Host "✅ Resource group '$ResourceGroupName' created."
} else {
    Write-Host "ℹ️ Resource group '$ResourceGroupName' already exists."
}

Write-Host "🚀 Deploying ARM template..."
az deployment group create `
    --resource-group $ResourceGroupName `
    --template-file "./templates/mainTemplate.json" `
    --parameters "./templates/parameters.json"

Write-Host "🎉 Deployment complete."
