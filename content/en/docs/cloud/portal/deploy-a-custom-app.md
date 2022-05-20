---
title: "Deploy a custom app"
weight: 50
---

## Prerequisites

To deploy your custom app, you will need an Darcy Cloud account with at least one node accessible
and `ONLINE`. You will need a basic understanding
of [how to structure app YAML](../applications-doc/app-doc-yaml.md) for Darcy Cloud.

## Deploy a Custom Application via Darcy Cloud

1. Go to the Darcy Cloud project page
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Drag n Drop a [YAML file](../applications-doc/app-doc-yaml.md) into the box
5. Et Voila!

![Application Deployment Page](/images/cloud-deploy-demo.png)

## View your Application Details

Click on your app in the list of application to see its details.

![Application Detail View](/images/18done.png)

The application details page contains informations about its microservices, routes, the nodes
involved in running the microservices and its [YAML definition](../applications-doc/app-doc-yaml.md).

Darcy Cloud Portal allows you to edit your app YAML right in the browser. More information about the
Application YAML files can be found [here](../applications-doc/app-doc-yaml.md).

{% hint style="info" %} Everything shown above using Darcy Cloud Portal can also be achieved using
our CLI, edgectl. See [Getting Started: edgectl](../get-started-edgectl/)
{% endhint %}
