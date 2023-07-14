---
title: "Registries"
weight: 550
aliases:
  - /darcy/darcy-cloud/applications-doc/registries
---

When configuring an [Edgeworx Cloud](/docs/cloud/start-portal) [application](../more/terminology#application) YAML file, it is necessary to specify the registry of
each [microservice](./microservices.md) container image. The field for this specification
is `spec.microservices.image.registry`, and the registry tells the [node](../cloud/adding-nodes/_index.md) the microservice is being
deployed to how to access the image container.

There are 3 options for a registry:

1. `local`

   When an image registry is set to local, the container image will be pulled from the local cache
   of the node when initially deploying the microservice to the node.

2. `remote`

   When an image registry is set to local, the container image will be pulled from the local cache
   of the node when initially deploying the microservice to the node.

3. `[registry_id]`

   When an image registry is set to a specific registry ID, the container image will be pulled using
   the registry key when initially deploying the microservice to the node. The registry key must
   have permission to access the container images.

## What is a Edgeworx Cloud Registry?

Edgeworx Cloud registries are a clean, convenient way to give Edgeworx Cloud applications access to
private Docker images or other containers that are being deployed to the Edgeworx Cloud.

Before adding a microservice with private container images (or with images not on Dockerhub) to a
node in [Edgeworx Cloud]({{<ref "/docs/cloud">}}) it is necessary to register a key with permissions
to access the microservice container images to a [project's](../more/terminology#project) Edgeworx Cloud registry so that the
microservice will be able to pull the container images upon being deployed.

Each registry is pre-configured with 2 entries. The first entry is for a `remote` registry (
the `remote` registry selection is just an alias for the value `1`), and the second entry is for
a `local` registry (the `local` registry selection is just an alias for the value `2`). Additional
entries to the registry can be created directly in ioFog as
shown [here](http://iofog.staging.edgeworx.io/docs/3/applications/microservice-registry-catalog.html)
, or they can be managed and created more simply using [edgectl]({{<ref "/docs/cloud/edgectl">}}) directly.

## View Current Registry Content

To see your current registry contents on your node(s), use the following command:

```bash
edgectl registry list
```

By default, this will return a JSON list where the first entry is the remote selection and the
second entry is the local selection:

```json
[
  {
    "id": 1,
    "url": "registry.hub.docker.com",
    "isPublic": true,
    "isSecure": true,
    "certificate": "",
    "requiresCert": false,
    "username": "",
    "email": ""
  },
  {
    "id": 2,
    "url": "from_cache",
    "isPublic": true,
    "isSecure": true,
    "certificate": "",
    "requiresCert": false,
    "username": "",
    "email": ""
  }
]
```

| Field        | Description                                                                                 |
| ------------ | ------------------------------------------------------------------------------------------- |
| id           | The unique identifier for each application in the registry                                  |
| url          | The URL of the registered application                                                       |
| isPublic     | Indicates whether the registry is public or private. False by default                       |
| isSecure     | <p>Indicates whether</p><p> the registry requires authentication.</p>                       |
| certificate  | The certificate of the registry                                                             |
| requiresCert | Indicates whether a certificate is required or not to use the application. False by default |
| username     | If authentication is required, the username to use.                                         |
| email        | If authentication is required, the associated email.                                        |

## Creating New Entries

To create a new entry in the registry, use the following command:

```bash
edgectl registry create
```

Use the `--help` command to see all of the available fields to be set when creating a new registry.
If the `--project` field is empty, the the default project is used (if one is set).

## Create a Registry Entry Using Google Cloud

A simple way to give permissions to the Edgeworx Cloud to deploy applications is to create a Google
Service Account key that has permissions to access the applications containers (whether they be on
Dockerhub or elsewhere). A service account can be created by following the
tutorial [here](https://cloud.google.com/container-registry/docs/advanced-authentication#json-key).

Once a JSON key that has access to the desired containers is created, it can be added to the Edgeworx
Cloud registry as shown below:

```bash
edgectl registry create --url "gcr.io" --username "_json_key" --password "$(cat /path/to/json_key_file.json)"
```

This will print out the information about the newly created entry in the registry:

```text
ID  URL     USERNAME   EMAIL                                        PUBLIC
3   gcr.io  _json_key  s3g9gxfxpixcelledgeproject1@api.edgeworx.io  False
```

If you want to check all of the settings on the entry, you can run `edgectl registry list` again and
verify that everything is set correctly.

## Registry Example

To use the registry to deploy an example, just add the `registry` keyword with the registry `id` to
the `images` section of the `microservice` definition in the YAML file of the application being
deployed to a node.

```yaml
kind: Application
apiVersion: iofog.org/v3
metadata:
  name: example-private-registry
spec:
  microservices:
    - name: "example"
      agent:
        name: "{% raw %}
{% assign agent = \"\" | findAgent | first %}
{% endraw %}{{ agent.name }}"
      images:
        arm: "gcr.io/my-org/my-private-image:latest"
        x86: "gcr.io/my-org/my-private-image:latest"
        registry: 3 # Use the private registry ID here
      container:
        rootHostAccess: false
        ports: []
      config: {}
```
