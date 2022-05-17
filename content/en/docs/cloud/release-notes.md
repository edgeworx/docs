---
title: "Release Notes"
draft: false
weight: 700
toc: true
---


### Darcy Cloud: Release 2022.03.30 (BETA)

This release incorporates the first version of Darcy AI Explorer.

| Component          | Version  |
| ------------------ | -------- |
| Darcy Cloud API    | `v2.1.0` |
| Darcy Cloud Portal | `v2.1.0` |
| Edgectl            | `v2.1.0` |

#### Changes

* Darcy AI explorer app is available which showcases Darcy AI SDK featuring customisable people-centric AI.

### Darcy Cloud: Release 2022.02.25 (BETA)

This is the first release of Darcy Cloud, which is the successor to Edgeworx Cloud.&#x20;

| Component          | Version  |
| ------------------ | -------- |
| Darcy Cloud API    | `v2.0.1` |
| Darcy Cloud Portal | `v2.0.1` |
| Edgectl            | `v2.0.1` |

#### Changes

* Edgeworx Cloud is is now Darcy Cloud.
* `edgectl` has switched its entire command structure, from `noun-verb` to `verb-noun`. We are doing this based on user feedback from customers who are more familiar with the Kubernetes `kubectcl get X` style of CLI. For example, instead of `edgectl account get`, use `edgectl get account`. For more detail, see edgectl **** /images/docs](get-started-edgectl/deploy-an-app.md)**.**
  * Note that if you are using `edgectl` in scripts or such, and you pull the latest version, you must update your scripts to use the new syntax.

### Edgeworx Cloud: Release 2022.01.26 (BETA)

This release of Edgeworx Cloud introduces application microservice container logging, and incorporates internal security enhancements.

| Component         | Version  |
| ----------------- | -------- |
| Edgeworx CloudAPI | `v1.3.1` |
| Edgectl           | `v1.3.2` |

#### Changes

* `edgectl` can retrieve the the container logs for application microservices running on edge nodes. For example: `edgectl logs myapp/myservice` . See `edgectl logs --help` for usage, or the edgectl **** /images/docs](get-started-edgectl/deploy-an-app.md)**.**
* Internal security enhancements.

### Edgeworx Cloud: Release 2022.01.20 (BETA)

Security enhancements.

| Component         | Version  |
| ----------------- | -------- |
| Edgeworx CloudAPI | `v1.2.0` |
| Edgectl           | `v1.2.0` |

#### Changes

* Improvements to Edgeworx Cloud internal security mechanisms.

### Edgeworx Cloud: Release 2021.12.16 (BETA)

This release of Edgeworx Cloud consists largely of behind-the-scenes fixes and improvements to several Edgeworx Cloud components.

| Component             | Version  |
| --------------------- | -------- |
| Edgeworx CloudAPI     | `v1.1.7` |
| Edgectl               | `v1.1.7` |
| Edgeworx Cloud Portal | `v1.1.4` |

#### Changes

* Better support for 32-bit Raspbian (Raspberry Pi) systems.
* Minor UX fixes for Edgeworx Cloud Portal.
* Several internal backend improvements.
* CloudPortal: shows correct version of ARM architecture for device.

### Edgeworx Cloud: Release 2021.12.05 (BETA)

This release of Edgeworx Cloud consists largely of behind-the-scenes fixes and improvements to several Edgeworx Cloud components.

| Component             | Version  |
| --------------------- | -------- |
| Edgeworx CloudAPI     | `v1.1.6` |
| Edgeworx Agent        | `v1.1.3` |
| Edgectl               | `v1.1.6` |
| Edgeworx Cloud Portal | `v1.1.3` |

#### Action Required

For users that already have nodes registered with Edgeworx Cloud, it is necesary to re-run your project's _Node Install Script_ directly (via SSH) on each of your existing nodes. In effect, the _Node Install Script_ is performing an upgrade of Edgeworx components on your node. You should have received email communication with detailed steps on how to upgrade the node.&#x20;

For users of `edgectl`, please upgrade to the latest version, for example: `$ brew upgrade edgectl` for macOS.

###
