---
title : "App Overview"
---

Darcy connects to your applications to interact and share data. Applications can be configured in
the Darcy Cloud platform to connect to one or more edge nodes. Apps are defined using YAML files,
and can be deployed and updated by uploading those YAML files. Darcy nodes can be set up to interact
with applications, process information, and move data between multiple apps.

![Application view in the Darcy Cloud platform](</images/image (12).png>)

## Application Components

Darcy can connect to virtually any containerized application. We’ve outlined the touchpoints for
connecting to an application below.

### Microservices

Darcy nodes connect directly to your applications' microservices to send, retrieve, and parse data.
Many microservices are hosted in Docker or similar containerized service. More information on
connecting to your microservice can be found in the [Microservices](./#microservices) section.

### Integrations

#### Endpoints and Ports

Darcy connects to REST API Endpoints and TCP Ports. You can specify the port within the Application
YAML. For more information, please refer to the [Public Services](public-services.md) section.

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
the [Application YAML Definition](app-doc-yaml.md#fields) section.

### Variables

Variables can be defined on application inputs and outputs to be processed alongside Darcy nodes and
adjacent applications. More information on declaring and using variables can be found in
the [Application Templating](app-doc-advanced-templating.md) section.

## Creating and Managing Applications

### Creating an Application

Applications can be created within the Darcy platform by creating a YAML configuration file linking
to your existing containerized application. The steps for creating and deploying a custom
application in Darcy can be found [here](../get-started-ec/deploy-a-custom-application.md).

### Deploying a Demo Application

Darcy provides a demo application you can deploy within minutes to see an example of an Application
in action. You need one node live in order to deploy the demo app. More information on deploying the
app can be found [here](../get-started-ec/heart-rate-application/get-started-deploy-app.md).

### Managing your Application

Applications can be managed through
the [portal](../get-started-ec/heart-rate-application/get-started-deploy-app.md#deploy-a-custom-app-using-the-portal)
or using [edgectl](../get-started-edgectl/#deploy-an-application).
