
param location string  = 'eastus'
param storageName string = 'asolomtestapp'
param namePrefix string = 'bicep-asolom2'

targetScope = 'resourceGroup'

module storage 'modules/storage.bicep' = {
  name: storageName
  params: {
    kindType: 'Hot'
    storageName: storageName
    location: location
  }
}

module appPlanDeploy 'modules/servicePlan.bicep' = {
  name: 'appPlan'
  params: {
    namePrefix: namePrefix
    location: location
    sku: 'F1'
  }
}

module webAppDeploy 'modules/webApp.bicep' = {
  name: 'webApp'
  params: {
    appPlanId: appPlanDeploy.outputs.planId
    namePrefix: namePrefix
    location: location
    dockerImage: 'nginxdemos/hello'
    dockerImageTag: 'latest'
  }
}

output siteUrl string = webAppDeploy.outputs.siteUrl


/*
var  person = {  //data type - object 
  name: 'Jay'
  lastName: 'Rite'
  age: 34
  isMarried: false 
  education: {
    college: 'UW'
    year: 1987
  }
}

output result1 string = person.education.college

 var nameArray = [ //data type - array
  'James'
  'Andrew'
  3
  0
 ]

 output result2 string = nameArray[0]
*/
