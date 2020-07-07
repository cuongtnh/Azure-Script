$resourceGroupName = Get-AzResource | Select ResourceGroupName
$location = Get-AzResource | Select Location
$adminUsername = Read-Host -Prompt "Enter the administrator username"
$adminPassword = Read-Host -Prompt "Enter the administrator password" -AsSecureString
$dnsLabelPrefix = Read-Host -Prompt "Enter an unique DNS name for the public IP"

#New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/cuongtnh/Azure-Script/master/DC01-template.json" `
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `

 (Get-AzVm -ResourceGroupName $resourceGroupName).name
