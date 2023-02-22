---
title: "Port Broker"
weight: 600
draft: false
aliases:
  - /darcy/darcy-cloud/applications-doc/public-services
---

Port Broker allows your [microservices](../apps/microservices.md) to securely expose public endpoints without opening ports
on your agents.

## Specifying Public Containers

When deploying [applications](../more/terminology#application) and microservices, you can specify a `proxy` configuration when
configuring the port mappings of your container.

If `proxy` is specified and set to `true`, this will open a tunnel that will forward all traffic incoming onto the port exposed by the container.

Deploying such a configuration would result in a port being opened on the Controller host, and all
incoming tcp traffic would be tunneled to `agent-1`, port 5000.

The public address can be retrieved in the Portal (in the Application details, and/or microservice
details pages), or by using [edgectl]({{<ref "/docs/cloud/edgectl">}}).

Below is the YAML returned when describing the microservice/application.

Deploying such a configuration would result in a port being opened on a public host, and all incoming tcp traffic would be tunneled to `agent-1`, port 5000.

## YAML Example

```yaml
...
name: msvc-1
agent:
  name: agent-1
container:
  ...
  ports:
      - internal: 80
        external: 5000
        proxy: true
...
```
{{<info>}}
We recommend securing any port you decide to open using Port Broker in your application. 
{{</info>}}