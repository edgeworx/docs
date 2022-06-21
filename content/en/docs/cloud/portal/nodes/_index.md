---
title : "Nodes"
weight: 40
aliases:
  - /darcy/darcy-cloud/get-started-ec/nodes
---

We have previously defined the device edge as being the final point of contact for data from the
cloud to the end user. An edge [node](../../../more/terminology.md#node) is a physical device with a Linux or equivalent operating system
that can serve data to an end user from the edge.

In order to start deploying applications via [Darcy Cloud](../../../more/terminology.md#darcy-cloud), you must add nodes to your edge [project](../../../more/terminology.md#project).
Nodes can be an edge device such as a [Raspberry Pi](https://www.raspberrypi.com)or
an [NVIDIA Jetson](https://www.nvidia.com/en-us/autonomous-machines/jetson-store/). They can also be
VMs in the Cloud or a [Vagrant](https://www.vagrantup.com) image running on your laptop. Nodes can
essentially be any type of computer that you want to connect to your edge project.

In Darcy Cloud, nodes are edge devices that run Darcy Agents. Ultimately, we want to deploy
applications to these nodes to put them to work.

## Prerequisites

To add a node to your project, you will be running a command line script. For this we assume you
have ssh or console access to your node and are using a common shell, such as zsh or bash.
Additionally, the installation script by default will need to run as sudo to register the necessary
services to be automatically started after the node is rebooted.

### Supported Hardware

* Raspberry Pi 3 & 4 (running Raspbian)
* Intel NUC (running Ubuntu OS)
* Google Coral Dev Boards (running Mendel Linux)

### Supported Operating Systems

* Raspbian Buster
* Ubuntu 16.04+
* Debian 10+

{{<alert style="warning">}}
  If you do not have any of the above hardware, you can create a VM and run
  the node installation script.
{{</alert>}}

## Node States

A node can be in one of these states after setup:

| State | Description |
| --- | --- |
| `INITIALIZING` | The node is briefly in this state when first created                                                    |
| `INSTALLING` | Software is being installed or updated on the node                                                     |
| `ONLINE` | The happy state; Darcy Cloud is receiving heartbeats from the node and services are reachable                                               |
| `DEGRADED` | At least one of the node's services is not behaving as expected                                                                    |
| `UNREACHABLE` | This means that Darcy Cloud has not received a heartbeat from the node in some time, and all services seem inaccessible. This could happen due to network outages, or if the node has been shut down, frozen, or otherwise disabled |
