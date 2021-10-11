# Microservice

## What are microservices?

From [microservices.io](https://microservices.io):

Microservices - also known as the microservice architecture - is an architectural style that structures an application as a collection of services that are

* Highly maintainable and testable
* Loosely coupled
* Independently deployable
* Organized around business capabilities
* Owned by a small team

The microservice architecture enables the rapid, frequent and reliable delivery of large, complex applications. It also enables an organization to evolve its technology stack.

This definition encapsulate the logic we encourage you to use when deploying Edge Applications on your nodes. But we would add a couple of points to really nail the Edgeworx Cloud Application Microservice:

* It is a [docker container](https://www.docker.com/resources/what-container) that runs on your node
* Its life cycle is managed by your Edgeworx Agent
* It is always part of an Edge Application

