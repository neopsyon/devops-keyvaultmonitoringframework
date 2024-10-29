targetScope = 'subscription'

param resourceGroupName string = 'myResourceGroup'
param location string = 'West Europe'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
}

resource resourceGroupLock 'Microsoft.Authorization/locks@2020-05-01' = { 
  name: 'rgCanNotDeleteLock' // Give your lock a unique name
  scope: resourceGroup // Referencing the resourceGroup scope
  properties: {
    level: 'CanNotDelete' // Set the lock level (options: CanNotDelete, ReadOnly)
    notes: 'This lock prevents deletion of the resource group.'
  }
}

output resourceGroupName string = resourceGroup.name
