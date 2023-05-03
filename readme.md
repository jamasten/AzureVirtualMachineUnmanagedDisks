# Azure Virtual Machine with an Unmanaged Disk

This solution will allow you to deploy an Azure Virtual Machine while specifiying a VHD as the source image. Deploying virtual machines from VHDs in an Azure Storage Account (aka unmanaged disks) is not a best practice but may be required in some scenarios.

## Deployment Options

### Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjamasten%2FAzureVirtualMachineUnmanagedDisks%2Fmain%2Ftemplate.json)
[![Deploy to Azure Gov](https://aka.ms/deploytoazuregovbutton)](https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjamasten%2FAzureVirtualMachineUnmanagedDisks%2Fmain%2Ftemplate.json)

### PowerShell

````powershell
New-AzDeployment `
    -Location '<Azure location>' `
    -TemplateFile 'https://raw.githubusercontent.com/jamasten/AzureVirtualMachineUnmanagedDisks/main/template.json' `
    -Verbose
````

### Azure CLI

````cli
az deployment sub create \
    --location '<Azure location>' \
    --template-uri 'https://raw.githubusercontent.com/jamasten/AzureVirtualMachineUnmanagedDisks/main/template.json'
````
