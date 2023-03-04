---
title: "App YAML definition"
weight: 450
aliases:
  - /darcy/darcy-cloud/applications-doc/app-doc-yaml
  - /docs/cloud/portal/ai-explorer-app/app-yaml/
---

[Darcy Cloud](/docs/cloud/start-portal) uses [Eclipse ioFog](https://iofog.org) under the covers to deploy and manage
[applications](../more/terminology#application), and all Darcy applications are deployed to edge [node(s)](../cloud/adding-nodes/_index.md) via a YAML configuration file.

We directly use the ioFog YAML specifications for defining different resource `Kinds`. For
application deployments, the `Kind` in the YAML file will always be `Application`. In this section,
you'll find an example application YAML file and description of all fields supported by Darcy Cloud.

## Fields

| Field                | Description                                                                                                                                                                                                                                                                                                                                |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `apiVersion`         | Specifies the version of ioFog API to be used by the application and [microservices](./microservices.md). The different versions of the ioFog API can be found in the [documentation](https://iofog.org/releases.html), and in general the latest version should be used.                                                                  |
| `kind`               | Defines what is being deployed to the node(s). For the Darcy Cloud deployments, the kind will always be Application (although ioFog accepts many other kind types).                                                                                                                                                                        |
| `metadata`           | The metadata object is a place to specify pertinent Application information. The main thing to be specified in the metadata specification for Darcy Cloud applications is the name of the application.                                                                                                                                     |
| `metadata.name`      | The name of the application. This has to be unique within the namespace of the edge [project](../more/terminology#project). The name of the application must start and end with lowercase alphanumeric characters, and it can include the `-` character.                                                                                |
| `spec`               | Object containing actual specifications of the application being deployed to the Darcy Cloud. For applications, the main specs to define are the microservices that compose the application, and the routes between the microservices.                                                                                                     |
| `spec.microservices` | Object containing the microservices that make up your application. See the [microservices]({{<ref "#microservices">}}) section below for more information.                                                                                                                                                                                 |
| `spec.routes`        | A list of Application Routes. Application routes define message passing between microservices. `From` and `To` use microservice names as identifiers, and must match a microservice defined in the [microservices]({{<ref "#microservices">}}) section. When deploying an application, prefer this method to the microservice route field. |

## Microservices

Microservices are the core components of the Darcy Cloud application. Microservices configuration
and set up are defined inside the application YAML files. Darcy Cloud allows for several
microservices to be configured within the same YAML file, and these microservices can be assigned to
any of the available nodes in the project.

| Field                      | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`                     | The name of the microservice. This has to be unique within the list of the microservices in the application. The name of the microservice must start and end with lowercase alphanumeric characters, and it can include the `-` character.                                                                                                                                                                                                                                                            |
| `agent`                    | The agent object is used to specify information about the node the microservice is to be deployed on. By default, the YAML file can specify the the node name generically using YAML templating. See the [Application Templating]({{<ref "templating.md">}}) section for a more detailed explanation about this field.                                                                                                                                                                                |
| `agent.name`               | The name of the Darcy Cloud node that the microservice should be deployed to.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `images`                   | <p>The images object is used to specify the location of the x86 and arm container images to be used by the node running the microservice<br><br>It is currently required to set both an x86 and an arm container image for the microservice. This allows the same application can be deployed across a variety of hardware.                                                                                                                                                                           |
| `images.x86`               | Container image to be used on node(s) using an x86 processor.                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `images.arm`               | Container image to be used on node(s) using an ARM processor.                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `images.registry`          | The image registry specifies how the node should access the microservice x86 and `ARM` container images. The registry can be set to either `local`, `remote`, or to a specific Darcy `registryID`. More information about the Darcy registry can be found in the [Registries]({{<ref "registries.md">}}) section or in the ioFog [documentation](http://iofog.staging.edgeworx.io/docs/3/applications/microservice-registry-catalog.html).                                                            |
| `config`                   | User-defined arbitrary object to be passed to the microservice runtime as its configuration. This is similar to the microservice’s environment variable section, only the variables set in the config will be encrypted so that only other microservices can access them. This adds a layer of security to the fields, so this is the typical place to store secrets as it’s safer. Using config does require changing the actual code in the microservice to be able to handle the config variables. |
| `container`                | This variable is used to specify the configuration of the container that wraps the images.                                                                                                                                                                                                                                                                                                                                                                                                            |
| `container.rootHostAccess` | This variable is the same as the `privilege` mode on Docker; when it is set to true, the container will be able to access the `host`. This will also set the network of the container to host. See the [Docker to Darcy]({{<ref "docker-to-darcy.md">}}) section for a more detailed explanation about this field.                                                                                                                                                                                    |
| `container.ports`          | List of port mapping to be provided to the container running the microservice. See the [Docker to Darcy]({{<ref "docker-to-darcy.md">}}) section for a more detailed explanation about this field.                                                                                                                                                                                                                                                                                                    |
| `container.ports.external` | The external port exposed to the node.                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `container.ports.internal` | The internal port used by the microservice.                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `container.ports.protocol` | The protocol used to send data between the internal and external ports via a proxy tunnel. The choices for the field are `tcp` or `udp`.                                                                                                                                                                                                                                                                                                                                               |
| `container.ports.scheme` | Define the protocol to be used when accessing the proxy.                                                                                                                                                                                                                                                                                                               || `container.ports.public`                 | This is a specialized field that exposes a `public` port to the internet at large. Setting this port allows the URL to map directly to the internal port outside of the microservice. See [public services]({{<ref "port-broker.md">}}) for a more detailed explanation of the public section.                                                                                                                                                                                                    |
| `container.volumes`                      | List of volume mapping to be provided to the container running the microservice. See the [Docker to Darcy]({{<ref "docker-to-darcy.md">}}) section for a more detailed explanation about this field.                                                                                                                                                                                                                                                                                                  |
| `container.volumes.hostDestination`      | Specifies where a volume directory is on the host’s external operating system.<br/>The volume specified must be available on the host; microservices are not able to create volumes on the host.                                                                                                                                                                                                                                                                                                      |
| `container.volumes.containerDestination` | Specifies where a volume directory is on a container’s operating system.                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `container.volumes.accessMode`           | The type of access the microservice should have to the volume. The choices for this field are the standard `w` (write), `ro` (read-only), `rw` (read-write), etc..                                                                                                                                                                                                                                                                                                                                    |
| `container.volumes.type`                 | The type of the mount being specified. The choices are either `bind` (the default) or `volume`. `bind` mounts are files mounted from the host machine onto the container. A `volume` mount is a separate storage space managed by a different container or service like Docker.                                                                                                                                                                                                                       |
| `container.env`                          | A list of environment variables to be provided to the container running the microservice.                                                                                                                                                                                                                                                                                                                                                                                                             |
| `container.env.key`                      | The name of the environment variable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `container.env.value`                    | The value of the environment variable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `container.commands`                     | A list of command line style arguments passed to the container at runtime.                                                                                                                                                                                                                                                                                                                                                                                                                            |


## Routes

Application routes define message passing between microservices. Routing in Darcy Cloud applications
is special in that it allows for an end-to-end encrypted, secure way for microservices to
communicate with each other through the cloud.

Darcy Cloud provides an API to publish data to and to read data from so that a specific applications
microservices can communicate with each other through generic “service” microservices run in the
background by the Darcy Cloud control plane.

Because it is necessary to change the code in the actual images in order to utilize routing, likely
routing will not be implemented when moving an existing cloud project to the Darcy Cloud.

| Field         | Description                                                                                                                                                                                                          |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `routes.name` | The name of the route being defined to pass messages or data between specified microservices. The name of the route must start and end with lowercase alphanumeric characters, and it can include the `-` character. |
| `routes.from` | The name of the microservice that data will be routed from.                                                                                                                                                          |
| `routes.to`   | The name of the microservice that data will be routed to.                                                                                                                                                            |

## Example YAML

```yaml
apiVersion: iofog.org/v3
kind: Application
metadata:
  name: my-application-name
spec:
  microservices:
    agent:
      name: zebra-1
    images:
      x86: edgeworx/healthcare-heart-rate:x86-v1
      arm: edgeworx/healthcare-heart-rate:arm-v1
      registry: remote
    config:
      data_label: test_mode=false_cross_agent_microservice_routing_aug_27
      test_mode: trueYaml
    container:
      rootHostAccess: false
      volumes:
        - hostDestination: /tmp/msvc
          containerDestination: /data
          accessMode: "rw"
          type: "bind"
      env:
        - key: BASE_URL
          value: http://localhost:8080/data
      ports:
        - internal: 80
          external: 5000
          protocol: http
          public: 14341
      commands:
        # This will result in the container being started as
        # `docker run <image> <options> dbhost localhost:27017`
        - "dbhost"
        - "localhost:27017"
  routes:
    - name: monitor-to-viewer
      from: heart-rate-monitor
      to: heart-rate-viewer
```

{{<info>}}
For more YAML examples see [Heart Rate Demo]({{<ref "/docs/apps/demo-apps/heart-rate.md">}})
or [Darcy AI Explorer]({{<ref "/docs/apps/demo-apps/ai-explorer.md">}}).
{{</info>}}
