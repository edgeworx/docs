---
title: "Node states"
linkTitle: "Node states"
description: "Explanation of node states."
weight: 550
aliases:
  - /edgeworx/edgeworx-cloud/what-is-edgeworx-cloud
---

A node can be in one of these states after setup:

| State          | Description                                                                                                                                                                                                                         |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `INITIALIZING` | The node is briefly in this state when first created                                                                                                                                                                                |
| `INSTALLING`   | Software is being installed or updated on the node                                                                                                                                                                                  |
| `ONLINE`       | The happy state; Edgeworx Cloud is receiving heartbeats from the node and services are reachable                                                                                                                                       |
| `DEGRADED`     | At least one of the node's services is not behaving as expected                                                                                                                                                                     |
| `UNREACHABLE`  | This means that Edgeworx Cloud has not received a heartbeat from the node in some time, and all services seem inaccessible. This could happen due to network outages, or if the node has been shut down, frozen, or otherwise disabled |
