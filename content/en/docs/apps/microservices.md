---
title : "Microservices"
weight: 400
aliases:
  - /darcy/darcy-cloud/applications-doc/microservice
---

## What are microservices?

Microservices are a specialization of a service-oriented architecture (SOA), flexible, independently
deployable software.

Microservices are an architectural style that structures an [application](../more/terminology.md#application) as a collection of loosely
coupled services, which implement business capabilities. The microservice architecture enables the
continuous delivery and deployment of large, complex applications by naturally dividing it into
smaller pieces. Key characteristics of microservices:

* Highly maintainable and testable
* Loosely coupled
* Independently deployable
* Organized around business capabilities
* Owned by a small team

This definition encapsulate the logic we encourage you to use when deploying Edge Applications on
your [nodes](../more/terminology.md#node). But we would add a couple of points to really nail the [Darcy Cloud](../more/terminology.md#darcy-cloud) Application
Microservice:

* It is a [docker container](https://www.docker.com/resources/what-container) that runs on your node
* Its life-cycle is managed by your Edgeworx Agent
* Microservices are leveraged within your Edge Application

## Writing Microservices

Your microservices can do anything a Docker container can do, from interacting with the physical
hardware to hosting a web server. That means most off-the-shelf frameworks and libraries in your
favorite language work too.

But because most Edge Compute Networks contain multiple, sometimes even hundreds or thousands, of
nodes running in a distributed fashion, ioFog provides an SDK library you can use to ease the burden
of communicating between them. The SDK also provides the ability to receive dynamic configuration in
your microservice so you don't have to bake them into your containers.

## Packaging Microservices

The high-level process of creating a new microservice is:

* Create a project directory
* Create a `Dockerfile` with your desired configuration
* Write the microservice app code itself
* Build the image
  with [`docker build`](https://docs.docker.com/engine/reference/commandline/build/)
* Deploy your image to a Docker registry (e.g. Docker Hub)
* (Optional) Add the registered image to your Controller's catalog
* Deploy the microservice using [edgectl](../../docs/cloud/edgectl/))

{{<alert>}} If you're new to containers and Docker, you'll want to check out their
official [Getting Started guide](https://docs.docker.com/get-started/) which walks you through the
different pieces of putting together a Docker container image. {{</alert>}}

## Connecting Microservices to Edge Application

Once your microservice is deployed on your node, you're ready to connect it to your Application!

[//]: # (Check out the [Public Services]&#40;{{<ref "public-services.md">}}&#41; section for configuration steps.)
