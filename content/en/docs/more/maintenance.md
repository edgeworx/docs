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

- **Darcy Cloud maintenance**: Darcy Cloud [Portal](https://cloud.darcy.ai)
  and [API](https://api.darcy.ai).
- **Node maintenance**: updates to the agent software and/or
  configuration installed on your edge devices.

Typical Darcy Cloud maintenance is invisible to the end user. That is to say,
there is no interruption to service, and you will not have noticed that the update
has occurred. We refer to this as a [Zero-Impact Maintenance](#zero-impact-maintenance) event.
However, on occasion
we may need to temporarily interrupt service to perform significant infrastructure
or backend upgrades. We call this a [Service-Impact Maintenance](#service-impact-maintenance) event.

During a maintenance window, you can learn about service availability
at [status.darcy.ai](https://status.darcy.ai).

## Impact

### Zero-Impact Maintenance

Zero-Impact Maintenance, as you might expect, has zero impact on service availability.
Most often, this type of maintenance is to improve backend services or infrastructure.
If there are user-facing changes, you will be able to find information
on those changes in the [changelog](/docs/more/release-notes).

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

Any user-facing changes from the update will be noted in the [changelog](/docs/more/release-notes).

## Node Maintenance

When you [add an edge node](/docs/cloud/adding-nodes/add-node/) to your Darcy Cloud
project, three software components are installed:

- _Edgeworx Agent_ interacts with Darcy Cloud to monitor the node's status.
- _ioFog Agent_ communicates with the Darcy Cloud ioFog backend to
  deploy, update and remove microservices on your node.
- _Deviceplane Agent_ implements the [keyless SSH](/docs/cloud/node-remote-access/)
  access mechanism. It is also used by Darcy Cloud to perform updates to the agents themselves.

Node maintenance can affect one or more of these agents.

### Node update process

This is a broad outline of the steps that can occur during node maintenance. Note
that only some of these steps may occur for any particular maintenance event.

- Darcy Cloud initiates the update process by opening a connection with Deviceplane Agent,
  and then executing an update script on the node.
  - Note that a login session may appear in your node's log files. This is the update
    process at work.
- Edgeworx Agent:
  - Edgeworx Agent's software components may be updated.
  - Edgeworx Agent's configuration files may be modified.
  - The Edgeworx Agent service may be restarted.
- ioFog Agent:
  - ioFog Agent's software components may be updated.
  - ioFog Agent's configuration files may be modified.
  - The ioFog Agent service may be restarted.
    {{<info>}}
    Note that this restart of ioFog Agent **will not affect** the microservices running on
    your node. They will continue to run without interruption.
    {{</info>}}
- Deviceplane Agent:
  - Deviceplane Agent's software components may be updated.
  - Deviceplane Agent's configuration files may be modified.
  - The Deviceplane Agent service may be restarted.
- What does not happen:
  - Your applications and microservices running on your nodes will not be stopped or restarted.
  - Your node (edge device) will not be restarted.
  - Other than the items listed above, no other changes are made to your node.

### Offline nodes

Sometimes a node will be offline during the maintenance period. What happens?
When the node comes back online, the node's Deviceplane Agent reestablishes its connection
to Darcy Cloud. When Darcy Cloud observes that the node is back online, it will
then initiate the deferred update process. The _Deferred Maintenance Window_ is thirty
days.

After that window closes - depending on the nature of that particular node update
process - it may be necessary to re-register the node. From Darcy Cloud's perspective,
this effectively creates a new node. You would also need to re-deploy any microservices.
Please contact [Darcy Support](mailto:support@darcy.ai) if you need assistance with a node
outside the deferred maintenance window.

## Notification

We understand the importance of keeping our customers in the loop about maintenance.
For zero-impact
Our notification policy is as follows:

- For a _standard maintenance event_, you will be emailed at your account's registered email
  address at least five business days before the maintenance window. If you have concerns
  about the maintenance event impacting your operations, please contact [Darcy Support](mailto:support@darcy.ai)
  as early as possible.

  {{<info>}}
  Again, please note that during any type of maintenance, applications and microservices
  running on your nodes **will not be affected**. They will continue to operate as normal.
  But you will not be able to push any changes to those applications via Darcy Cloud
  during the maintenance period.
  {{</info>}}
- For an _expedited maintenance event_, we aim to email you at least two days in advance. We realize
  that this is not a lot of time to prepare, so we make every effort to avoid expedited maintenance.
- You will be emailed a reminder the day before the maintenance window.
- You will be emailed again when the maintenance window opens.
- And, finally, you will be emailed one more time when the maintenance event concludes.
- Note that at any time, you can learn more about service availability at [status.darcy.ai](https://status.darcy.ai).
- After a maintenance event concludes, you can check on what changes occurred or any new
  features in the [changelog](/docs/more/release-notes).
- At any time, you can check on the availability of new `edgectl` versions by executing `edgectl version`.

## Feedback

If you have any feedback about our process, feel free to start a discussion over
at [discuss.darcy.ai](https://discuss.darcy.ai). If you have a concern about an upcoming
maintenance event impacting your operations, please reach out as soon as possible
to [Darcy Support](mailto:support@darcy.ai).
