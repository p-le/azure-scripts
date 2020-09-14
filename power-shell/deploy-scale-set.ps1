New-AzVmss -ResourceGroupName "myResourceGroupScaleSet" -Location "JapanWest" -VMScaleSetName "myScaleSet" ` -VirtualNetworkName "myVnet" ` -SubnetName "mySubnet" -PublicIpAddressName "myPublicIPAddress" -LoadBalancerName "myLoadBalancer" -UpgradePolicyMode "Automatic"

$publicSettings = @{ "fileUris" = (,"https://raw.githubusercontent.com/Azure-Samples/compute-automation-configurations/master/automate-iis.ps1"); "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File automate-iis.ps1" }

$vmss = Get-AzVmss -ResourceGroupName "myResourceGroupScaleSet" -VMScaleSetName "myScaleSet"

Add-AzVmssExtension -VirtualMachineScaleSet $vmss -Name "customScript" -Publisher "Microsoft.Compute" -Type "CustomScriptExtension" -TypeHandlerVersion 1.8 -Setting $publicSettings