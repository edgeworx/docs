# Deploy an App

This section will guide you into deploying an App.

Applications are a group of microservices bundled to work together. Apps are defined using YAML files and can be deployed and updated by uploading those YAML files

## Deploy an application

Deploying an application is a straightforward process. Applications are defined by YAML files and those files can be uploaded using the portal and/or edgectl

### Deploy the demo app using the portal

The demo application simulates a wearable device transmitting a person's heartbeat over bluetooth to a data collector microservice located on on a first node, and a web interface served by a second microservice on another node displaying the heartbeat over time.  
  
Although this demo app works best with two nodes, you can deploy the app with only one node and run alls parts on the same device.

We've made things super easy for you, the demo app YAML comes with the portal. It will detect if you have one or two nodes.

1. Go to the portal project page
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Click on `DEPLOY DEMO APP`

### Deploy a custom app using the portal

1. Go to the portal project page
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Drag n Drop a YAML file into the box
5. Et Voila!

### View an app details

You can now click on your app in the list of application to see its details.  
Feel free to play around editing the YAML.  
  
More informations about the Application YAML files can be found [here](../applications-doc/app-doc-yaml.md)



