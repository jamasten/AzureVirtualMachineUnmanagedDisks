param DiskName string
param ImageOffer string
param ImagePublisher string
param ImageSku string
param ImageVersion string
param Location string = resourceGroup().location
param NetworkInterfaceName string
param OperatingSystemType string
param StorageAccountName string
param StorageAccountResourceGroupName string
param StorageAccountSubscriptionId string
param StorageContainerName string
param SubnetName string
param VhdName string
param VirtualMachineName string
param VirtualNetworkName string
param VirtualNetworkResourceGroupName string
@secure()
param VirtualMachineLocalAdministratorPassword string
param VirtualMachineLocalAdministratorUsername string
param VirtualMachineSize string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' existing = {
  scope: resourceGroup(StorageAccountSubscriptionId, StorageAccountResourceGroupName)
  name: StorageAccountName
}

resource networkInterface 'Microsoft.Network/networkInterfaces@2015-06-15' = {
  name: NetworkInterfaceName
  location: Location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: resourceId(subscription().subscriptionId, VirtualNetworkResourceGroupName, 'Microsoft.Network/virtualNetworks/subnets', VirtualNetworkName, SubnetName)
          }
        }
      }
    ]
  }
}

resource virtualMachine 'Microsoft.Compute/virtualMachines@2016-04-30-preview' = {
  name: VirtualMachineName
  location: Location
  properties: {
    hardwareProfile: {
      vmSize: VirtualMachineSize
    }
    osProfile: {
      computerName: VirtualMachineName
      adminUsername: VirtualMachineLocalAdministratorUsername
      adminPassword: VirtualMachineLocalAdministratorPassword
    }
    storageProfile: {
      imageReference: {
        publisher: ImagePublisher
        offer: ImageOffer
        sku: ImageSku
        version: ImageVersion
      }
      osDisk: {
        createOption: 'FromImage'
        vhd: {
          uri: '${storageAccount.properties.primaryEndpoints.blob}${StorageContainerName}/${VhdName}'
        }
        name: DiskName
        osType: OperatingSystemType
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface.id
        }
      ]
    }
  }
}
