<#
.SYNOPSIS
    Automated Azure Infrastructure Deployment Script for AZ-104 Labs.
.DESCRIPTION
    This script provisions a baseline environment including a Resource Group, 
    Virtual Network, Subnet, and Network Security Group (NSG).
#>

# 1. Define Parameters & Variables
$ResourceGroupName = "rg-az104-labs"
$Location          = "eastus"
$VNetName          = "vnet-az104-eastus"
$SubnetName        = "snet-frontend"

# 2. Create Azure Resource Group
Write-Host "Creating Resource Group: $ResourceGroupName in $Location..." -ForegroundColor Green
New-AzResourceGroup -Name $ResourceGroupName -Location $Location -Force

# 3. Provision Virtual Network and Subnet
Write-Host "Configuring Networking Infrastructure..." -ForegroundColor Cyan
$SubnetConfig = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix "10.0.1.0/24"
$VNet = New-AzVirtualNetwork -ResourceGroupName $ResourceGroupName -Name $VNetName -Location $Location -AddressPrefix "10.0.0.0/16" -Subnet $SubnetConfig

Write-Host "Deployment completed successfully!" -ForegroundColor Yellow
