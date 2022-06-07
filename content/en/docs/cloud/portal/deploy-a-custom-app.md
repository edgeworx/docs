---
title: "Deploy a custom app"
weight: 50
aliases:
  - /darcy-cloud/get-started-ec/deploy-a-custom-application
---

## Prerequisites

To deploy your custom app, you will need a Darcy Cloud account with at least one node accessible
and `ONLINE`. You will need a basic understanding
of [how to structure app YAML]({{<ref "/docs/apps/yaml-definition.md">}}) for Darcy Cloud.

## Deploy a Custom Application via Darcy Cloud

1. Go to the Darcy Cloud project page
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Drag n' drop a [YAML file]({{<ref "/docs/apps/yaml-definition.md">}}) into the box

![Application Deployment Page](/images/cloud-deploy-demo.png)

## View your Application Details

Click on your app in the list of application to see its details.

![Application Detail View](/images/18done.png)

The appl details page contains information about its microservices, routes, the nodes
involved in running the microservices and its YAML Definition.

Darcy Cloud Portal allows you to edit your app YAML right in the browser. More information about the
Application YAML files can be found [here]({{<ref "/docs/apps/">}}).

{{<alert>}} Everything shown above using Darcy Cloud Portal can also be achieved using
our CLI, [edgectl]({{<ref "/docs/cloud/edgectl">}}).
{{</alert>}}
