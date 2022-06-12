---
title: "Deploy an app to the edge in about 30 minutes"
weight: 400
linkTitle: "Deploy to the Edge"
Toc: true
---
![FIXME](/images/guide4-deploy-cloud.jpeg)

## Requirements
- Darcy Cloud account (Free)
- Edge development board
    - Raspberry Pi board (Pi 4 with 2GB+ of RAM recommended)
    - 
- Video camera attached to the camera port
- Google Coral edge TPU (USB version attached to USB 3.0 port)
- Micro SD card with at least 16GB capacity (32GB+ recommended)
- Power supply

## What you will accomplish

By the end of this guide, you will be able to make deployable Darcy AI application packages that
will run on any hardware that meets the requirements for Darcy AI. The list of compatible hardware
is extensive, allowing you to deploy your Darcy AI applications to the devices that fit your
solution needs.

To perform the packaging process, you will simply need to follow a few steps.

1. Create a Dockerfile so Docker knows how to build your container images
2. Open a builder namespace
3. Build the container images for multiple platforms (different CPU architectures)
4. Upload your container images to your Docker Hub account or similar container registry

## FIX ME [BUTTON NEXT: PACKAGE YOUR AI APP](#)