---
description: Architectural overview of Edgeworx Cloud concepts
---

# Key Concepts

#### Edgeworx Cloud

Edgeworx Cloud is the platform for managing and monitoring edge devices.

#### Cloud Portal

Cloud Portal is the web-based portal for Edgeworx Cloud, at [cloud.edgeworx.io](https://cloud.edgeworx.io).

#### Cloud API

Cloud API is the REST API for Edgeworx Cloud. Cloud Portal and edgectl both communicate with Cloud API. You may also build your own applications that interact directly with Cloud API. See the Cloud API [REST documentation](https://api.dev.edgeworx.io/v1/docs).

#### edgectl

edgectl is the CLI for Edgeworx Cloud. See [Get Started: edgectl](get-started-edgectl.md) for more.

#### Account & Org

To sign-up for an _account_, visit [cloud.edgeworx.io](https://cloud.edgeworx.io). The user must provide an email address, and must also select a unique _username_.

An _Org_ \(i.e. _Organization\)_ is typically created for a corporate entity. For example, `Acme, Inc.` may create an org `acme`. An _org_ is the container for projects.

On creating a new account, a new _Personal Org_ is automatically created for that account. Thus if the account username is `alice`, a new org `alice` is also created, and so Alice's projects will live under her `alice` org.

#### Access Token

Cloud API access is secured by the use of an _Access Token_, which comes in two flavors, _Personal Access Token_ and _Project Access Token_. A _Personal Access Token_ \(effectively an _Account Access Token_\) works at the _account_ level: it typically grants all access that the account has. As one might expect, a _Project Access Token_ works at the project level: this token only works for the project it was issued for.

For both _Personal_ and _Project Access Token_, a _master_ token is automatically issued, which can be rotated, but not revoked or deleted. And for both token types, additional tokens can be generated, for circumstances when it's unwise to share the _master_ token \(e.g. for CI pipelines, scripts, etc.\).

#### Project

A project contains nodes and applications.



