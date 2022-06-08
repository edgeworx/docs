---
title : "Public Services"
weight: 600
draft: false
aliases:
  - /darcy/darcy-cloud/applications-doc/public-services
---

Public services allow your microservices to securely expose public endpoints without opening ports
on your agents.

## Specifying Public Containers

When deploying Applications and microservices, you can specify a `public` configuration when
configuring the port mappings of your container.

If `public` is specified, this will open a tunnel that will forward all traffic incoming onto the
port exposed by the container.

## Schemes and Protocol

`schemes` allows you to specify the protocols supported by the underlying exposed microservice.
Controller will generate a public URL for each protocol supported.

`protocol` lets you decide between `http` and `tcp`. It tells the public port which type of traffic
to forward. the default value is `http`. `http` protocol will only work if the schemes are `http`
and/or `https`.

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
        public:
          schemes:
            - https
          protocol: http
...
```

The example above would be for a microservice exposing an HTTPS server.

Deploying such a configuration would result in a port being opened on the Controller host, and all
incoming tcp traffic would be tunneled to `agent-1`, port 5000.

The public address can be retrieved in the Portal (in the Application details, and/or microservice
details pages), or by using [edgectl]({{<ref "/docs/cloud/edgectl">}}).

Below is the YAML returned when describing the microservice/application.

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
        public:
          schemes:
            - https
          links:
            - https://<random_string>.http0.cass.edgeworx.io
          protocol: http
...
```
