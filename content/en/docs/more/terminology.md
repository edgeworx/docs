---
title: "Terminology"
linkTitle: "Terminology"
weight: 200
aliases:
  - /terminology
---

## Edgeworx Cloud terminology

### Edgeworx Cloud

_Edgeworx Cloud_ is the platform for managing and monitoring edge devices. Edgeworx Cloud includes a
web-based portal at [cloud.edgeworx.io](https://cloud.edgeworx.io).

### Cloud API

_Cloud API_ is the REST API for _Edgeworx Cloud_. _Cloud Portal_ and _edgectl_ both communicate with
Cloud API. You may also build your own applications that interact directly with cloud API. See the
Cloud API [REST documentation](https://edgeworx.io).

### edgectl

edgectl is the CLI for _Edgeworx Cloud_. See [Get Started: edgectl](/docs/cloud/edgectl) for more.

### Account & Org

To sign-up for a Edgeworx _Cloud_ _account_, visit [cloud.edgeworx.io](https://cloud.edgeworx.io). The user
must provide an email and select a unique _username_.

### Orgs (organizations)

An _Org_ (i.e. _Organization)_ is typically created for a corporate entity. For
example, `Acme, Inc.` may create an org `acme`. An _org_ is the container for projects. The personal org may only contain the Sandbox environment.

On creating a new account, a new _Personal Org_ is automatically created for that account. Thus if
the account username is `alice`, a new org `alice` is also created, and so Alice's projects will
live under her `alice` _org_.

### Sandbox

Edgeworx Cloud comes with a free, single node environment we call a Sandbox to test your various edge resources without needing to purchase an Org. Each account can only have one Sandbox environment at a time.

### Access Token

_Cloud API_ access is secured by the use of an _Access Token_, which comes in two flavors, _Personal
Access Token_ and _Project Access Token_. A _Personal Access Token_ (effectively an _Account Access
Token_) works at the _account_ level: it typically grants all access that the account has. As one
might expect, a _Project Access Token_ works at the project level: this token only works for the
project it was issued for.

For both _Personal_ and _Project Access Token_, a _master_ token is automatically issued, which can
be rotated, but or deleted. And for both token types, additional tokens can be generated, for
circumstances when it's unwise to share the _master_ token (e.g. for CI pipelines, scripts, etc.).

In Edgeworx _Cloud Portal_, you can view the list of _Personal Access Tokens_ from the _Access Tokens_
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
almost any device running compatible Linux operating systems and supports containerization.

To add a _node_ to a _project_, execute the project's _node register script_ directly on that node.

### Node Register Script

You add a _node_ to a _project_ by executing the project's _node register script_ directly on the
_node_.

```bash
$ edgectl get node-register-script
# Copy and paste the output
$ curl -s https://ecj_hv98d4adwdhgk435ebzuwakfg995016kh3ys@api.edgeworx.io/v1/project/6077569f-4351-4245-a3e2-41d2452857d5/node-register-script | sudo bash
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

You can access the _node register script_ via the `Add Node` button in _Cloud Portal_, or by
executing `edgectl get node-register-script`.

### Application

An _app_ or _application_ means
an [ioFog](https://iofog.org/docs/2/developing-microservices/overview.html) application. That is to
say, it is a set of _microservices_ running on a set of _nodes_ in a _project_. You can add an _app_
to a _project_ via _Cloud Portal_, or via `edgectl deploy app`.

### Microservice

A _microservice_ (often shortened to _msvc_) is an individual container running as part of an
ioFog _app_ on a set of _nodes_ in a _project_.
