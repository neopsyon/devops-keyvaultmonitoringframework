param name string = 'teamalphaappserviceplan'
param location string = 'West Europe'
param sku string = 'Free'
param skucode string = 'F1'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: name
  location: location
  kind: 'linux'
  sku: {
    tier: sku
    name: skucode
  }
}
