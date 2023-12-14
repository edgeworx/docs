---
title: "Building edge apps"
weight: 600
linkTitle: "Building edge apps"
---

[Apps](../more/terminology#application) are groups of [microservices](./microservices.md) bundled to work together. They are defined using YAML files and can
be deployed and updated by uploading those YAML files through [Edgeworx Cloud](/docs/cloud/start-portal) or through
[edgectl]({{<ref "/docs/cloud/adding-nodes/add-node.md">}}). An app can consist of an arbitrary
number of interacting or standalone microservices that are deployed on one or may nodes.

Edgeworx connects to your applications to interact and share data. Applications can be configured in
the Edgeworx Cloud platform to connect to one or more edge nodes. Apps are defined using YAML files,
and can be deployed and updated by uploading those YAML files. Edgeworx nodes can be set up to interact
with applications, process information, and move data between multiple apps.

![Application view in the Edgeworx Cloud platform](</images/apps_full.png>)

## Application Components

Edgeworx can connect to virtually any containerized application. We’ve outlined the touchpoints for
connecting to an application below.

### Microservices

Edgeworx nodes connect directly to your applications' microservices to send, retrieve, and parse data.
Many microservices are hosted in Docker or similar containerized service. More information on
connecting to your microservice can be found in the [microservices]({{<ref "microservices.md">}}) section.

### Integrations

#### Endpoints and Ports

Edgeworx connects to REST API Endpoints and TCP Ports. You can specify the port within the Application

[//]: # 'YAML. For more information, please refer to the [Port Broker]({{<ref "port-broker.md">}}) section.'

#### Routing

Applications may contain microservices on more than one node. When this happens, it may be required
to set up message routing. Routing is set up to transmit data from one instance of your application
to another. Routing is configured within the application YAML.

```yaml
routes:
  - name: monitor-to-viewer
    from: monitor
    to: viewer
```

More information on routing can be found in
the [Application YAML Definition]({{<ref "yaml-definition.md">}}) section.

### Variables

Variables can be defined on application inputs and outputs to be processed alongside Edgeworx nodes and
adjacent applications. More information on declaring and using variables can be found in
the [Application Templating]({{<ref "templating.md">}}) section.

## Creating and Managing Applications

### Creating an Application

Applications can be created within the Edgeworx platform by creating a YAML configuration file linking
to your existing containerized application. The steps for creating and deploying a custom
application in Edgeworx can be found [here]({{<ref "/docs/cloud/deploy-an-app.md">}}).

### Deploying a Demo Application

Edgeworx provides a demo app you can deploy within minutes to see an example
in action. You need one node live in order to deploy the demo app. More information on deploying the
app can be found [here]({{<ref "/docs/apps/demo-apps/heart-rate.md">}}).

### Managing your Application

Applications can be managed through
the [portal]({{<ref "/docs/cloud/deploy-an-app.md">}})
or using [edgectl]({{<ref "/docs/cloud/edgectl/">}}).
