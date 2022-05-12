---
title: "Key Concepts"
description: "Overview of Darcy Cloud concepts."
date: 2020-10-06T08:49:31+00:00
draft: false
weight: 300
toc: true
menu:
  docs:
    parent: "cloud"
---

#### Darcy Cloud

_Darcy Cloud_ is the platform for managing and monitoring edge devices. Darcy Cloud includes a web-based portal at [**cloud.darcy.ai**](https://cloud.darcy.ai)

#### Cloud API

_Cloud API_ is the REST API for _Darcy Cloud_. _Cloud Portal_ and _edgectl_ both communicate with Cloud API. You may also build your own applications that interact directly with Cloud API. See the Cloud API [**REST documentation**](https://api.dev.edgeworx.io/v1/docs)

#### edgectl

edgectl is the CLI for _Darcy Cloud_. See [**Get Started: edgectl**](get-started-edgectl/) for more

#### Account & Org

To sign-up for a Darcy _Cloud_ _account_, visit [**cloud.darcy.ai**](https://cloud.darcy.ai). The user must provide an email and  select a unique _username_

An _Org_ (i.e. _Organization)_ is typically created for a corporate entity. For example, `Acme, Inc.` may create an org `acme`. An _org_ is the container for projects

> BETA: The Darcy Cloud BETA release does not currently support managing corporate orgs.

On creating a new account, a new _Personal Org_ is automatically created for that account. Thus if the account username is `alice`, a new org `alice` is also created, and so Alice's projects will live under her `alice` _org_

#### Access Token

_Cloud API_ access is secured by the use of an _Access Token_, which comes in two flavors, _Personal Access Token_ and _Project Access Token_. A _Personal Access Token_ (effectively an _Account Access Token_) works at the _account_ level: it typically grants all access that the account has. As one might expect, a _Project Access Token_ works at the project level: this token only works for the project it was issued for

For both _Personal_ and _Project Access Token_, a _master_ token is automatically issued, which can be rotated, but or deleted. And for both token types, additional tokens can be generated, for circumstances when it's unwise to share the _master_ token (e.g. for CI pipelines, scripts, etc.)

In Darcy _Cloud Portal_, you can view the list of _Personal Access Tokens_ from the _Access Tokens_ link in the top-right drop-down. The list of _Project Access Tokens_ can be accessed via the gear icon on the project page.

You can use an _Access Token_ to make REST calls to _Cloud API_, or to login to _edgectl_ via `edgectl login --token xyz`.

#### Project

A _project_ is a container for a set of nodes (edge devices), which you can SSH into, or deploy iofog applications to. You can create multiple projects inside an org (limited by your plan)

As described in the _Access Token_ section, a project is automatically issued a project _master token_, which can be rotated, but not deleted. You can also generate additional _Project Access Tokens_ if desired

#### Node

A _node_ is a physical (or virtual) edge device, such as a Raspberry Pi, Intel NUC, Google Coral, or any supported edge device (including Linux VMs)

To add a _node_ to a _project_, execute the project's _node install script_ directly on that node

#### Node Install Script

You add a _node_ to a _project_ by executing the project's _node install script_ directly on the _node_

```
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

You can access the _node install script_ via the `Add Node` button in _Cloud Portal_, or by executing `edgectl get node-install-script`

#### Application

An _app_ or _application_ means an [**ioFog**](https://iofog.org/docs/2/developing-microservices/overview.html) application. That is to say, it is a set of _microservices_ running on a set of _nodes_ in a _project_. You can add an _app_ to a _project_ via _Cloud Portal_, or via `edgectl deploy app`

#### Microservice

A _microservice_ (often shortened to _msvc_) is an individual container running as part of an ioFog _app_ on a set of _nodes_ in a _project_
