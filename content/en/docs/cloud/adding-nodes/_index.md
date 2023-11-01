---
title: "Edge nodes"
weight: 300
linkTitle: "Edge nodes"
aliases:
  - /edgeworx/edgeworx-cloud/what-is-edgeworx-cloud
  - /cloud/portal/nodes
  - /docs/cloud/portal/nodes/
---

Edge devices are the final point of contact for data from the
cloud to the end user. An edge node is a physical device with a Linux or equivalent operating system
that can serve data to an end user from the edge.

In [Edgeworx Cloud](/docs/cloud/start-portal), nodes are edge devices that run Edgeworx Agents. Ultimately, we want to deploy
apps to these nodes to put them to work.

## AI performance

We recommend the following components for processing real-time video using AI at the edge:

| Dev Board                                                                  | Video                                                      | Power                                                                                                                                                                                                               | AI Acceleration                                      |
| -------------------------------------------------------------------------- | ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| ![face-detection-app](/images/boards/pi4-silo.jpg)                         | ![face-detection-app](/images/boards/picam-silo.jpg)       | ![face-detection-app](/images/boards/power-silo.jpg)                                                                                                                                                                | ![face-detection-app](/images/boards/coral-silo.jpg) |
| Raspberry Pi4                                                              | Any Pi4 camera                                             | 5.1V \* 3.5A power                                                                                                                                                                                                  | Coral Accelerator                                    |
| [Learn More](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/) | [Learn More](https://www.amazon.com/gp/product/B07SN8GYGD) | [Learn More](https://www.amazon.com/CanaKit-Raspberry-Power-Supply-USB-C/dp/B07TYQRXTK/ref=sr_1_3?crid=2BGU12U80RGNV&keywords=canakit+power+supply&qid=1655761341&sprefix=cana+kit+power+supply%2Caps%2C125&sr=8-3) | [Learn More](https://coral.ai/products/accelerator/) |

## More compatible edge boards

Edgeworx Cloud is compatible with many edge boards, such as:

- Raspberry Pi 3 or 4
- Asus Tinker
- Nvidia Jetson Nano
- And more!

## Supported Operating Systems

- Raspbian Buster
- Ubuntu 16.04+
- Debian 10+

{{<warning>}}
Due to various differences across Linux distros and their respective updates, you may need to use older versions or install dependencies before using the node register script. If you experience issues with an OS please contact [support](https://edgeworx.io/support).
{{</warning>}}

{{<info>}}
If you don't have any edge hardware yet, you can create a [virtual node](/docs/cloud/adding-nodes/virtual-node.md) using Edgeworx Cloud, create a VM in the Cloud, a [Vagrant](https://www.vagrantup.com) image running on your device, or whatever virtualization software, and run
the node register script.
{{</info>}}
