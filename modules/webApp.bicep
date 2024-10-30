param location string = resourceGroup().location
param appPlanId string
param namePrefix string

param dockerImage string
param dockerImageTag string

resource webApplication 'Microsoft.Web/sites@2023-12-01' = {
  name: '${namePrefix}-webapp'
  location: location
  properties: {
    serverFarmId: appPlanId
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVICE_URL'
          value: 'https://index.docker.io0'
        }
        {
          name: 'DOCKER_REGISTRY_SERVICE_USERNAME'
          value: ''
        }
        {
          name: 'DOCKER_REGISTRY_SERVICE_PASSWORD'
          value: ''
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
      ]
      linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'
    }
  }
}

output siteUrl string = webApplication.properties.hostNames[0]
