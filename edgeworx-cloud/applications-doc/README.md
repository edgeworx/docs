# Applications

## Overview

Edgeworx connects to your Applications to interact and share data. Applications can be configured in the Edgeworx platform to connect to one or more edge nodes. Apps are defined using YAML files and can be deployed and updated by uploading those YAML files. Edgeworx nodes can be set up to interact with applications, process information, and move data between multiple apps.

![Application view in the Edgeworx platform](<../../.gitbook/assets/image (9).png>)

## Touchpoints <a href="#touchpoints" id="touchpoints"></a>

Edgeworx can connect to virtually any containerized application. We’ve outlined the touchpoints for connecting to an application below.

### Microservices <a href="#microservices" id="microservices"></a>

Edgeworx nodes connect directly to your applications' microservices to send, retrieve, and parse data. Many microservices are hosted in Docker or similar containerized services. Microservices a within the Application YAML specification to

&#x20;

More information on connecting to your microservice [here](microservice.md).

### Integrations <a href="#integrations" id="integrations"></a>

#### Endpoints and Ports <a href="#endpoints-and-ports" id="endpoints-and-ports"></a>

Edgeworx connects to REST API Endpoints and TCP Ports. You can specify the port within the Application YAML.&#x20;

#### Routing <a href="#routing" id="routing"></a>

Applications may contain microservices on more than one node. When this happens, it may be required to set up message routing. Routing is set up to transmit data from one instance of your application to another. Routing is configured within the Application YAML.&#x20;

```yaml
routes:
- name: monitor-to-viewer
  from: monitor
  to: viewer
```

&#x20;More information on routing can be found in the [Application Templating](app-doc-advanced-templating.md) page.

### Variables <a href="#variables" id="variables"></a>

Variables can be defined on application inputs and outputs to be processed alongside Edgeworx nodes and adjacent applications. More information on declaring and using variables can be found here.

&#x20;

\
Applications can be managed through the [portal](../get-started-ec/get-started-deploy-app.md#deploy-a-custom-app-using-the-portal)  or using [edgectl](../get-started-edgectl/#deploy-an-application)

