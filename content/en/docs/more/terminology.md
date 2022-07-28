---
title: "Terminology"
linkTitle: "Terminology"
weight: 200
---

## Darcy AI terminology

### Engine

The Darcy AI engine is the part that runs the AI computations and manages the system resources such as memory and CPU threads. It can be considered the core “backend code” of Darcy AI. As a developer, you do not need to interact with the engine directly. You only need to use the provided interfaces in the API as described in the documentation.

### Pipeline

Every Darcy AI application is allowed one pipeline. A Darcy AI pipeline is the sequenced set of AI processes that does the real work in the application. The Darcy AI pipeline code object is one of the main objects that you will interact with as a developer. It contains many important methods and the AI processing starts when the “run()” method is called.

### Perceptor

A Darcy AI perceptor is a code module that integrates raw AI processing with CPU code to make an easy-to-use semantic interface for the underlying AI output. Perceptors are built by developers who understand AI programming but are used by AI application developers who want to leverage the perceptor abilities. This frees AI application developers from needing to become AI experts and opens a perceptor library ecosystem.

### Perception Object Model (POM)

Similar to the Document Object Model (DOM) that is found in web browsers, the Perception Object Model (POM) is a data tree structure found in Darcy AI applications. The POM is the place where the outputs of each pipeline step are stored. The POM is available to Darcy AI application developers at each pipeline step, when a whole pipeline cycle has been completed, and at any point when the developer desires to interact with it. The POM also contains a history of all AI raw inputs and processing results.

### Input Stream

A Darcy AI input stream is the source data that is used for AI processing. Because Darcy’s “senses” can be expanded to include any source of data, an input stream code object is used to encapsulate the processing that is done to prepare incoming data for AI workloads. An example of an input stream code library is one that captures the frames of video from a camera and also merges the thermal camera data with each frame, even though the two cameras provide data at different rates. An input stream is attached to a pipeline by you, the Darcy AI application developer.

### Output Stream

A Darcy AI output stream is a code library that receives the data from the pipeline processing and produces a useful output, such as a video display or a CSV file. Many output streams can be attached to a single pipeline by you, the Darcy AI application developer.

### Callback

For every step in the Darcy AI application processing, work is needed to format and produce business value from incoming data and outgoing data. The way that Darcy allows developers to do this work is to have their code processed by Darcy when the time is right. This is called a “callback” and it is a well-known pattern of software development in JavaScript and other languages. By using callbacks, developers can focus on just the pieces of code that relate to their actual application and know that Darcy will run their code for them.

### Frame, Cycle, or Pulse

Every complete trip through a Darcy AI pipeline is called a frame. It can also be called a cycle or a pulse.

### Initialization

In order to allow Darcy to start doing AI processing, some foundational settings must be chosen and some basic requirements must be met, such as providing an input stream. Then the Darcy AI pipeline needs to be started so the application can run. These steps are called the Darcy AI initialization and they must be performed by the developer in every application.

### Docker Base Image

There are many software packages and libraries that Darcy AI applications need in order to build and run properly. Asking you, the developer, to know and understand these dependencies would slow you down and cause you unecessary complexity. To circumvent this problem, the required software is bundled ahead of time in easy-to-use base images that are Docker containers. Because they are already Docker containers, you can make your application Docker containers easily by starting from one of the provided base container images.

### Performance Metrics

Darcy tracks system performance when doing AI processing. Each trip through the pipeline steps is measured, along with the individual pipeline steps. Darcy AI application developers can request this performance data in their application, which allows for benchmarking, profiling, and innovative displays that show how fast each part of Darcy’s work is being done.

### AI Model

The actual AI neural network processing is done using AI models. An AI model is a stored image of a neural net that was built during an AI training or retraining process. Most developers use AI models that already exist and were created by someone else. Darcy AI perceptors contain AI models and make them easier to use. Most Darcy AI application developers do not need to use AI models directly because of the perceptor architecture.

## Darcy Cloud terminology

### Darcy Cloud

_Darcy Cloud_ is the platform for managing and monitoring edge devices. Darcy Cloud includes a
web-based portal at [cloud.darcy.ai](https://cloud.darcy.ai).

### Cloud API

_Cloud API_ is the REST API for _Darcy Cloud_. _Cloud Portal_ and _edgectl_ both communicate with
Cloud API. You may also build your own applications that interact directly with cloud API. See the
Cloud API [REST documentation](https://api.darcy.ai/v1/docs).

### edgectl

edgectl is the CLI for _Darcy Cloud_. See [Get Started: edgectl](/docs/cloud/start-edgectl) for more.

### Account & Org

To sign-up for a Darcy _Cloud_ _account_, visit [cloud.darcy.ai](https://cloud.darcy.ai). The user
must provide an email and select a unique _username_.

An _Org_ (i.e. _Organization)_ is typically created for a corporate entity. For
example, `Acme, Inc.` may create an org `acme`. An _org_ is the container for projects.

> BETA: The Darcy Cloud BETA release does not currently support managing corporate orgs.

On creating a new account, a new _Personal Org_ is automatically created for that account. Thus if
the account username is `alice`, a new org `alice` is also created, and so Alice's projects will
live under her `alice` _org_.

### Access Token

_Cloud API_ access is secured by the use of an _Access Token_, which comes in two flavors, _Personal
Access Token_ and _Project Access Token_. A _Personal Access Token_ (effectively an _Account Access
Token_) works at the _account_ level: it typically grants all access that the account has. As one
might expect, a _Project Access Token_ works at the project level: this token only works for the
project it was issued for.

For both _Personal_ and _Project Access Token_, a _master_ token is automatically issued, which can
be rotated, but or deleted. And for both token types, additional tokens can be generated, for
circumstances when it's unwise to share the _master_ token (e.g. for CI pipelines, scripts, etc.).

In Darcy _Cloud Portal_, you can view the list of _Personal Access Tokens_ from the _Access Tokens_
link in the top-right drop-down. The list of _Project Access Tokens_ can be accessed via the gear
icon on the project page.

You can use an _Access Token_ to make REST calls to _Cloud API_, or to login to _edgectl_
via `edgectl login --token xyz`.

### Project

A _project_ is a container for a set of nodes (edge devices), which you can SSH into, or deploy
iofog applications to. You can create multiple projects inside an org (limited by your plan).

As described in the _Access Token_ section, a project is automatically issued a project _master
token_, which can be rotated, but not deleted. You can also generate additional _Project Access
Tokens_ if desired.

### Node

A _node_ is a physical (or virtual) edge device, such as a Raspberry Pi, Intel NUC, Google Coral, or
any supported edge device (including Linux VMs).

To add a _node_ to a _project_, execute the project's _node install script_ directly on that node.

### Node Install Script

You add a _node_ to a _project_ by executing the project's _node install script_ directly on the
_node_.

```bash
$ ssh alice@mypi
# You are logged into mypi

# Fetch and and execute the node install script
$ curl -s https://ecj_hv98d4adwdhgk435ebzuwakfg995016kh3ys@api.edgeworx.io/v1/project/6077569f-4351-4245-a3e2-41d2452857d5/node-install-script | sudo bash
Installing Edgeworx Agent
１ Initializing
２ Finger printing system
    ▶ Shell
      ∙ Exec:       /usr/bin/zsh
      ∙ User:       root
    ▶ Host
      ∙ Hostname:   ubuntu
[...]
```

You can access the _node install script_ via the `Add Node` button in _Cloud Portal_, or by
executing `edgectl get node-install-script`.

### Application

An _app_ or _application_ means
an [ioFog](https://iofog.org/docs/2/developing-microservices/overview.html) application. That is to
say, it is a set of _microservices_ running on a set of _nodes_ in a _project_. You can add an _app_
to a _project_ via _Cloud Portal_, or via `edgectl deploy app`.

### Microservice

A _microservice_ (often shortened to _msvc_) is an individual container running as part of an
ioFog _app_ on a set of _nodes_ in a _project_.
