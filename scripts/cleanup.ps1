param (
    [string]$ResourceGroupName = "rg-fioneer-vinoth"
)

Write-Host "🧹 Deleting resource group: $ResourceGroupName..."
az group delete --name $ResourceGroupName --yes --no-wait
Write-Host "✅ Cleanup command issued."
