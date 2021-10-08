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

#### Account and Organization

To sign-up for an account, visit [cloud.edgeworx.io](https://cloud.edgeworx.io). The user must provide an email address, and must also select a unique username.

An _Organization_ \(or simply, _Org_\) is typically created for a corporate entity. For example, `Acme, Inc.` may create an org `acme`. An org is the container for projects.

On creating a new account, a new _Personal Org_ is automatically created for that account. Thus if the account username is `alice`, a new org `alice` is also created, and so Alice's projects will live under her `alice` org.

#### Project

A project contains nodes and applications.



