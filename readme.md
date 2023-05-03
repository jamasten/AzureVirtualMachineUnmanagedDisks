# Azure Virtual Machine with an Unmanaged Disk

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

## Description

Deploying virtual machine disks as VHD's in an Azure Storage Account is not a best practice but may be required in some scenarios.  This solution provides an example of the required properties and values in an ARM template.
