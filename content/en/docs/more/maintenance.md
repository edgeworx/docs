---
title: "Maintenance & Updates"
weight: 80
aliases:
  - /maintenance
---

From time to time, we need to perform maintenance on Darcy Cloud to
support the growth of the platform.
This document provides background information on our process.

There are two categories of maintenance we perform:

- Darcy Cloud updates, which includes:
  - Darcy Cloud [Portal](https://cloud.darcy.ai)
  - Darcy Cloud [API](https://api.darcy.ai)
  - [edgectl](/docs/cloud/edgectl/) CLI
- Node (edge device) updates:
  - Updates to the agent software/configuration installed on nodes connected
    to Darcy Cloud.

Typically Darcy Cloud maintenance is invisible to the end user. That is to say,
there is no interruption to service, and you will not have noticed that the update
has occurred. We refer to this as _Zero-Impact Maintenance_. However, on occasion
we may need to temporarily interrupt service to perform significant infrastructure
or backend upgrades. We call this _Service-Impact Maintenance_.


## Impact

### Zero-Impact Maintenance

Zero-Impact Maintenance, as you might expect, has zero impact on service availability.
Most often, this type of maintenance is to improve backend services or infrastructure.
If there are user-facing changes, you will be able to find information
on those changes on the [changelog](/changelog).


### Service-Impact Maintenance

When we perform _Service-Impact Maintenance_, there is interruption to service.
There are two modes of Service-Impact Maintenance.

### Read-Only Mode

In this mode:

- Darcy Cloud Portal will be unavailable. [cloud.darcy.ai](https://cloud.darcy.ai) will
  return an "Undergoing Maintenance" page. This page links to [status.darcy.ai](https://status.darcy.ai),
  which
- Darcy Cloud API routes that only read data will continue to work. Routes that make changes
  to data will return a `503/Service Unavailable` HTTP status code. In effect, `POST`, `PUT`,
  `PATCH`, and `DELETE` routes will return `503`.
  will return `503/Service Unavailable`.
- Similar to Darcy Cloud API, `edgectl` commands that only read data will continue to work,
  and commands that write data will return an error.




