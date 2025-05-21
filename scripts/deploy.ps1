param (
    [string]$resourceGroupName = "rg-iac-demo",
    [string]$location = "eastus"
)

Write-Host "🔐 Logging into Azure..."
az account show > $null 2>&1
if ($LASTEXITCODE -ne 0) {
    az login
    if ($LASTEXITCODE -ne 0) {
        Write-Error "❌ Azure login failed. Exiting."
        exit 1
    }
}

$rgExists = az group exists --name $resourceGroupName --output tsv
if ($rgExists -eq "false") {
    Write-Host "📦 Creating resource group: $resourceGroupName"
    az group create --name $resourceGroupName --location $location | Out-Null
}

Write-Host "🚀 Starting deployment..."
az deployment group create `
  --resource-group $resourceGroupName `
  --template-file "../templates/mainTemplate.json" `
  --parameters "../templates/parameters.json"

if ($LASTEXITCODE -ne 0) {
    Write-Error "❌ Deployment failed."
    exit 1
}

Write-Host "✅ Deployment complete."
