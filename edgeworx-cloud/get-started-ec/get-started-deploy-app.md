# Deploy the Demo App

Apps are groups of microservices bundled to work together. They are defined using YAML files and can be deployed and updated by uploading those YAML files through Edgeworx Cloud or through [edgectl](../get-started-edgectl/)

## 1. Prerequisites

To deploy an app, you will need an Edgeworx Cloud account with at least one node accessible and `ONLINE`. You can deploy the demo app with no experience in YAML or application building.

### About the "Heart Rate Demo App"

The Heart Rate Demo App provided with Edgeworx Cloud simulates a wearable device transmitting a person's heartbeat at the Edge. The Wearable sends heart rate data over bluetooth to a data collector microservice located on Node 1. The Data collector microservice then communicates with another microservice running a web server on Node 2 to display the heart rate data on a graph.&#x20;

![](<../../.gitbook/assets/image (8) (1) (1).png>)

## 2. Deploy the Demo App using Edgeworx Cloud

1. Go to your Edgeworx Cloud project page (make sure you have [added at least 1 node](get-started-add-node.md))
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Click on `DEPLOY DEMO APP`

![Add App](<../../.gitbook/assets/image (6) (1) (1).png>)

## 3. See the results of the demo app

When your app is deployed successfully you will see an "Application Deployed" message in the top right of your screen.

If you are not already seeing the demo app listed, click the "APPS" tab to see all of the apps in your current project. Click the demo app to access the app detail view.&#x20;

![Apps View](<../../.gitbook/assets/image (9) (1) (1).png>)

From the app detail view, click the linked text under the "ports" column to navigate to the demo app output.

![App Detail View](<../../.gitbook/assets/image (7).png>)

You should be brought to the heart rate demo app.

![Heart rate demo app output](../../.gitbook/assets/heartrate-demo-app.png)

{% hint style="info" %}
Although this demo app works best with two nodes, you can deploy the app with only one node and run all microservices on the same device. The demo app YAML will automatically detect if you have one or two nodes.
{% endhint %}

{% hint style="info" %}
If you wish to know more about the demo app before deploying it, you can inspect its YAML definition by clicking on the curly brace in the modal
{% endhint %}

![Edgeworx Cloud Portal: Demo App YAML](<../../.gitbook/assets/image (7) (1).png>)

