@minLength(5)
@maxLength(24)
@description('Storage name must have min 5 chars and max 24 chars')
param storageName string
param location string = resourceGroup().location
@description('Storage type could be Hot or Cold')
param kindType string

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    accessTier: kindType

  }
}
