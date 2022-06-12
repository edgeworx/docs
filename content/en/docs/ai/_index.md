---
title: "Darcy AI Overview"
linkTitle: "Darcy AI"
weight: 400
---

## Page requires updates

## FIXME

* Update AI SDK references (Darcy Engine)
* Discuss moving AI SDK and edgeboard requirements to a new nav section (global Darcy suite
  requirements?)
* Discuss moving "darcy AI ready edgeboards" to a new nav section
* Discuss pointing Setup, build, package, deploy to guides
* Darcy example apps can be removed (now a dedicated "apps" nav section)
* Discuss moving "help" to a new nav section (bottom of tree) to point to support/discuss
* Discuss adding new nav section "developing AI models" with tensor flow and other AI model info

-----

This is the official software development kit (SDK) for building on the Darcy AI platform.

## Introducing the Darcy AI platform

Darcy is an artificial intelligence (AI) that is focused on real-time interactions with the world.
It has a variety of senses, such as vision and hearing, that allow it to perceive the local
environment. You can give Darcy additional senses, such as LiDAR or thermal vision, to expand its
capabilities. Darcy is present in every device where a Darcy AI application is running. It runs
entirely in each device. No data needs to leave the device and no computation is done in the cloud.

Darcy was designed to bring AI technology into the real world while keeping privacy and security as
top priorities. Building real-time AI applications is very challenging. The Darcy AI SDK is a
developer platform for computer vision and other applications which handles all of the most
difficult and repetitive problems for you so you can focus on building amazing solutions.

With the Darcy AI SDK, you get everything you need to build real-time AI applications. If you can
write web applications with Node.js or you have moderate Python experience, then you can develop a
fully functioning AI app with Darcy. The SDK comes with documentation, build instructions, example
applications, and more.

## What you need

To develop and package Darcy AI applications, you only need a Mac, Windows, or Linux computer. To
run Darcy AI applications on devices, you just need one or more devices that meet the minimum
requirements below.

### System requirements for developer environments

* Any modern CPU (both x86 and ARM processors will work)
* 4GB of RAM
* Camera (the integrated webcam on most laptops will work)
* 5GB of available disk space for Docker, Python, required libraries, and your application
  containers
* Optional: Google Coral AI accelerator for testing accelerated processing

### System requirements for running deployed Darcy AI applications

* ARM or x86 CPU (two or more cores recommended)
* Google Coral AI accelerator (more than one Coral increases performance for many applications)
* 512MB of RAM (4GB or more recommended)
* Camera (required for using Darcy with live video)
* Internet connectivity (wired Ethernet or WiFi)
* 200MB available disk space (1GB or more recommended and your application size will vary)

### Darcy AI ready edge boards

* Raspberry Pi with Coral USB
  * [Raspberry Pi 4 single board computer](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/)
  * [Google Coral AI accelerator USB module](https://coral.ai/products/accelerator/)
* Nvidia Jetson Nano with Coral USB
  * [Jetson Nano Developer Kit](https://developer.nvidia.com/embedded/jetson-nano-developer-kit)
  * [Google Coral AI accelerator USB module](https://coral.ai/products/accelerator/)
* [Google Coral Dev Board](https://coral.ai/products/dev-board/)
* [Google Coral Dev Board Mini](https://coral.ai/products/dev-board-mini/)
* [ASUS Tinker T](https://www.asus.com/us/Networking-IoT-Servers/AIoT-Industrial-Solutions/Tinker-Board-Series/Tinker-Edge-T/)

## Getting started

If you haven't already become familiar with the Darcy AI platform terminology, check out
the [Terminology Guide](/docs/more/terminology.md) to get up to speed quickly.

The best way to get started with Darcy is to see it in action. Start by trying out the Darcy AI
Explorer application in the [Darcy Explorer Guide]({{<ref "darcy-explorer.md">}}).

When you are ready to create, you can launch your Darcy AI developer journey with
the [Getting Started Guide]({{<ref "getting-started.md">}}).

## Building

To prepare your Mac OS computer as a development environment for building Darcy AI applications,
follow the [Mac OS X Environment Setup Guide]({{<ref "setup-macos.md">}}).

To prepare your Windows computer as a development environment for building Darcy AI applications,
follow the [Windows Environment Setup Guide]({{<ref "setup-windows.md">}}).

Learn how to build and run a Darcy AI application using your favorite IDE with the [Build Guide](/docs/guides/2-build.md).

## Packaging

Learn how to package your Darcy AI application into a container that includes all of the
dependencies needed to run on many different devices with the [Packaging Guide](/docs/guides/3-package.md).

## Deploying

Learn how to deploy your Darcy AI application to your edge devices using the Darcy Cloud in
the [Deployment Guide]({{<ref "/docs/guides/guide-deploy/4-deploy.md">}}).

## Python Docs

View the [Darcy AI Engine Python Docs](https://darcyai.github.io/darcyai).

## Resources

### Examples

The [examples](https://github.com/darcyai/darcyai/tree/main/src/examples) folder contains a diverse
set of sample applications that you can use as a reference or as a start of your own Darcy AI
application. The code is commented to help you understand what to do and when to do it. Here are
some short descriptions to help you understand what examples are available. Some example
applications are stored in their own code repositories to make learning and building easier.

* [Darcy AI Explorer](https://github.com/darcyai/darcyai-explorer): this demo application is a rich
  showcase of what the Darcy AI system can do. Use the source code as a model for building a
  full-featured production application.
* [Real-time Audio Analysis](https://github.com/darcyai/darcyai/tree/main/src/examples/audio_analysis):
  Build and deploy this Darcy AI demo application to learn how to add audio capabilities to Darcy
  and listen for important sounds.
* Darcy
  AI [Basic Pipeline](https://github.com/darcyai/darcyai/tree/main/src/examples/basic_pipeline): Use
  this demo application to learn the basics of creating a Darcy AI [Pipeline](/docs/more/terminology.md#pipeline).
* [Output Stream](https://github.com/darcyai/darcyai/tree/main/src/examples/output_streams):  Learn
  how to create a Darcy AI [Output Stream]({{<ref "/docs/more/terminology.md#output-stream">}}) by adding this
  example to your application. The example sends your Darcy AI output to an Amazon Web Services S3
  bucket.
* [Perceptors](https://github.com/darcyai/darcyai/tree/main/src/examples/perceptors): Learn how to
  build your own Darcy AI [Perceptors]({{<ref "/docs/more/terminology.md#perceptor">}})
  with the examples in this directory. There is a basic mock perceptor that you can use as a
  template. There is a face detector perceptor that uses an [AI model]({{<ref "/docs/more/terminology.md#ai-model">}}) to find faces. There is also a face mask detector perceptor that
  checks a person's face for a mask.
* [Darcy Heart Rate Demo](https://github.com/darcyai/heart-rate-demo): this demo application is a
  good example of how to build an edge application that is made of multiple microservices that
  communicate with each other.
* Sample Build Files * Get a sample Dockerfile in this folder so you don't have to create one from
  scratch. [Build Files](https://github.com/darcyai/darcyai/tree/main/src/examples/build)
* Sample Deployment Files * Get a sample application YAML file in this folder so you can just
  replace the default values and deploy your edge AI application
  easily. [Deployment Files](https://github.com/darcyai/darcyai/tree/main/src/examples/deploy)

### Getting help

* Get help from the other Darcy AI developers, the Darcy team, and the whole Darcy community on the
  Darcy AI Forum at [Darcy AI Forum](https://discuss.darcy.ai/c/darcy-ai/).
* Report and track bugs in the Darcy AI platform and SDK using GitHub
  issues [https://github.com/darcyai/darcyai/issues](https://github.com/darcyai/darcyai/issues).

### Python packages for Darcy AI

* `darcyai` package: [https://pypi.org/project/darcyai/](https://pypi.org/project/darcyai/).

### Darcy Cloud

Deploy and manage edge applications including Darcy AI applications with the Darcy Cloud. Create an
account for free at [cloud.darcy.ai](https://cloud.darcy.ai).

### Other helpful links

* Company website for Edgeworx, the providers of the Darcy AI
  platform: [www.darcy.ai](https://www.darcy.ai)
* Official website for the Tensorflow AI project: [www.tensorflow.org](https://www.tensorflow.org)
