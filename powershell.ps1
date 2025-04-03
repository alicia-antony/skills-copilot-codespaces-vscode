# Login to Azure
Connect-AzAccount

# Variables
$resourceGroupName = "example-resource-group"
$location = "EastUS"
$vmName = "exampleVM"
$vmSize = "Standard_DS1_v2"
$adminUsername = "azureuser"
$adminPassword = "P@ssw0rd123!" # Ensure this meets Azure's password complexity requirements
$networkName = "exampleVNet"
$subnetName = "exampleSubnet"
$ipName = "examplePublicIP"
$nicName = "exampleNIC"
$osDiskName = "exampleOSDisk"

# Create a Resource Group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a Virtual Network and Subnet
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroupName -Location $location `
  -Name $networkName -AddressPrefix "10.0.0.0/16"
Add-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix "10.0.1.0/24" -VirtualNetwork $vnet
$vnet | Set-AzVirtualNetwork

# Create a Public IP Address
$publicIP = New-AzPublicIpAddress -ResourceGroupName $resourceGroupName -Location $location `
  -Name $ipName -AllocationMethod Dynamic

# Create a Network Interface
$subnet = Get-AzVirtualNetworkSubnetConfig -Name $subnetName -VirtualNetwork $vnet
$nic = New-AzNetworkInterface -ResourceGroupName $resourceGroupName -Location $location `
  -Name $nicName -SubnetId $subnet.Id -PublicIpAddressId $publicIP.Id

# Create a Virtual Machine Configuration
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize
$vmConfig = Set-AzVMOperatingSystem -VM $vmConfig -Windows -ComputerName $vmName `
  -Credential (New-Object PSCredential ($adminUsername, (ConvertTo-SecureString $adminPassword -AsPlainText -Force)))
$vmConfig = Set-AzVMSourceImage -VM $vmConfig -PublisherName "MicrosoftWindowsServer" `
  -Offer "WindowsServer" -Skus "2019-Datacenter" -Version "latest"
$vmConfig = Add-AzVMNetworkInterface -VM $vmConfig -Id $nic.Id

# Create the Virtual Machine
New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VM $vmConfig -Name $vmName