# 🌐 Azure Infrastructure as Code – Fioneer DevOps Challenge

This proof-of-concept  demonstrates Infrastructure as Code deployment using Azure ARM templates, PowerShell automation, and GitHub source control. It enables standardized provisioning of core Azure resources like Virtual Networks and Storage Accounts.

---

## 🚀 One-Click Deployment

Click below to deploy directly via Azure Portal:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fvinoji2005%2Ffioneer-azure-iac-poc%2Fmain%2Ftemplates%2FmainTemplate.json)

> ⚠️ **Note**: If this is a new subscription with no Resource Groups, please **run the PowerShell script below first** to create the required Resource Group.

---

## 💻 Deploy via PowerShell (Recommended)

```powershell
# Ensure Azure CLI and PowerShell are installed, then run:
.\scripts\deploy.ps1 -ResourceGroupName "rg-fioneer-vinoth" -Location "eastus"
