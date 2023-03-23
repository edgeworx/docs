---
title: "Maintenance"
weight: 80
aliases:
  - /maintenance
---

From time to time, we need to perform maintenance on Darcy Cloud to
support the growth of the platform.
This document provides background information on our process.

There are two categories of maintenance we perform:

- Darcy Cloud maintenance, which includes:
  - Darcy Cloud [Portal](https://cloud.darcy.ai)
  - Darcy Cloud [API](https://api.darcy.ai)
  - [edgectl](/docs/cloud/edgectl/) CLI
- Node (edge device) maintenance:
  - Updates to the agent software/configuration installed on nodes connected
    to Darcy Cloud.

Typically Darcy Cloud maintenance is invisible to the end user. That is to say,
there is no interruption to service, and you will not have noticed that the update
has occurred. We refer to this as [Zero-Impact Maintenance](#zero-impact-maintenance).
However, on occasion
we may need to temporarily interrupt service to perform significant infrastructure
or backend upgrades. We call this [Service-Impact Maintenance](#service-impact-maintenance).

During a maintenance window, you can learn about service availability
at [status.darcy.ai](https://status.darcy.ai).


## Impact

### Zero-Impact Maintenance

Zero-Impact Maintenance, as you might expect, has zero impact on service availability.
Most often, this type of maintenance is to improve backend services or infrastructure.
If there are user-facing changes, you will be able to find information
on those changes in the [changelog](/changelog).

### Service-Impact Maintenance

During _Service-Impact Maintenance_, there is interruption to service.

- Darcy Cloud Portal will be unavailable. Visiting [cloud.darcy.ai](https://cloud.darcy.ai) in
  your browser will return an "Undergoing Maintenance" page.
- Darcy Cloud API routes that will return a `503/Service Unavailable` HTTP status code.
- `edgectl` commands will return an error.

{{<info>}}
During Service-Impact Maintenance, applications and microservices
running on your nodes **will not be affected**. They will continue to operate as normal.
But you will not be able to push any changes to those applications via Darcy Cloud
during the maintenance period.
{{</info>}}

Any user-facing changes from the update will be noted in the [changelog](/changelog).


## Node maintenance

When you [add an edge node](/docs/cloud/adding-nodes/add-node/) to your Darcy Cloud
project, three software components are installed:

- _Edgeworx Agent_ interacts with Darcy Cloud to monitor the node's status.
- _ioFog Agent_ communicates with the Darcy Cloud ioFog backend to
  deploy, update and remove microservices on your node.
- _Deviceplane Agent_ implements the [keyless SSH](docs/cloud/node-remote-access/)
  access mechanism. It is also used by Darcy Cloud to perform updates to the agents themselves.

One or more of the following can happen during node maintenance:

### Node update process

This is a broad outline of the steps that occur during node maintenance. Note
that only some of these steps may occur for any particular maintenance event.

- Darcy Cloud initiates the update process by opening a connection with Deviceplane Agent,
  and then executing an update script on the node.
  - Note that a login session may appear in your node's log files. This is the update
    process at work.
- Edgeworx Agent:
  - Edgeworx Agent's software components may be updated.
  - Edgeworx Agent's configuration files may be updated.
  - The Edgeworx Agent service may be restarted.
- ioFog Agent:
  - ioFog Agent's software components may be updated.
  - ioFog Agent's configuration files may be updated.
  - The ioFog Agent service may be restarted.
    {{<info>}}
    Note that this restart of ioFog Agent **will not affect** the microservices running on
    your node. They will continue to run without interruption.
    {{</info>}}
- Deviceplane Agent:
  - Deviceplane Agent's software components may be updated.
  - Deviceplane Agent's configuration files may be updated.
  - The Deviceplane Agent service may be restarted.

### Offline nodes

Sometimes a node will be offline during the maintenance period. What happens?
When the node comes back online, the node's Deviceplane Agent reestablishes its connection
to Darcy Cloud. When Darcy Cloud observes that the node is back online, it will
then initiate the deferred update process. The _Deferred Maintenance Window_ is thirty
(30) days. After that window closes (depending on the nature of that particular node update
process) it may be necessary to re-register the node (effectively becoming a new node),
and re-deploy any microservices. Please contact [Darcy Support](mailto:support@darcy.ai) if you need assistance
with a node outside the deferred maintenance window.



