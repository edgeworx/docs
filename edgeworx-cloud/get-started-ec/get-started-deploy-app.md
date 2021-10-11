# Deploy an App

Applications are groups of microservices bundled to work together. Apps are defined using YAML files and can be deployed and updated by uploading those YAML files through the Edgeworx Cloud Portal UI or through edgectl CLI.

## Deploy the demo app using the portal

### About the "Heart Rate Demo App"

The Heart Rate Demo App provided with the Edgeworx Portal simulates a wearable device transmitting a person's heartbeat at the Edge. The Wearable sends heart rate data over bluetooth to a data collector microservice located on Node 1. The Data collector microservice then communicates with another microservice running a web server on Node 2 to display the heart rate data on a graph.

![](<../../.gitbook/assets/image (6).png>)

### Deploying the Heart Rate Demo App

Using the Edgeworx Cloud Portal, you can deploy the demo with just a couple of clicks. 

1. Go to the portal project page (make sure you have [added at least 1 node](get-started-add-node.md))
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Click on `DEPLOY DEMO APP`

![](<../../.gitbook/assets/image (6) (1).png>)

{% hint style="info" %}
Although this demo app works best with two nodes, you can deploy the app with only one node and run alls parts on the same device. The demo app YAML will automatically detect if you have one or two nodes.
{% endhint %}

## Deploy a custom app using the portal

1. Go to the portal project page
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Drag n Drop a YAML file into the box
5. Et Voila!

## View an app details

You can now click on your app in the list of application to see its details.\
Feel free to play around editing the YAML.\
\
More informations about the Application YAML files can be found [here](../applications-doc/app-doc-yaml.md)

## Deploy apps using edgectl

See [Getting Started: edgctl](get-started-deploy-app.md#undefined)

