---
title: Changelog
weight: 70
aliases:
  - /darcy-cloud/release-notes
  - /docs/release-notes
  - /release-notes
  - /changelog
---

## Upcoming

No upcoming events currently scheduled. 

## Previously

### 2023.04.03: Zero-Impact Maintenance

On Mon Apr 3rd 2023, we will be performing minor maintenance
on Darcy Cloud. This maintenance event **will not affect
service availability**. If you have concerns
about the maintenance event impacting your operations, please contact [Darcy Support](mailto:support@darcy.ai)
as early as possible.

| Affected Systems                                          | Impact                                                         | Schedule                           |
|-----------------------------------------------------------|----------------------------------------------------------------|------------------------------------|
| ✅ [Darcy Cloud](/docs/more/maintenance/#darcy-cloud)<br/> | [Zero Impact](/docs/more/maintenance/#zero-impact-maintenance) | Mon 03 Apr 2023 <br/> 7AM - 8AM PT |

Learn more about our [maintenance process](/docs/more/maintenance/).

### 2023.03.28: Service-Impact Maintenance

On Tue Mar 28th 2023, we will be performing maintenance
on Darcy Cloud, and all attached edge nodes. This maintenance event **will affect
service availability**. If you have concerns
about the maintenance event impacting your operations, please contact [Darcy Support](mailto:support@darcy.ai)
as early as possible.

| Affected Systems                                                                                            | Impact                                                                  | Schedule                           |
| ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ---------------------------------- |
| ✅ [Darcy Cloud](/docs/more/maintenance/#darcy-cloud)<br/>✅ [Edge Nodes](/docs/more/maintenance/#edge-nodes) | ⚠️ [Service Impact](/docs/more/maintenance/#service-impact-maintenance) | Tue 28 Mar 2023 <br/> 7AM - 9AM PT |

Learn more about our [maintenance process](/docs/more/maintenance/).

### 2022.06.17: Darcy Cloud v2.2.0

The highlights of this release are Virtual Node, and support for running Darcy AI Engine on CPU.

| Component          | Version  |
| ------------------ | -------- |
| Darcy Cloud API    | `v2.2.0` |
| Darcy Cloud Portal | `v2.2.0` |
| Edgectl            | `v2.2.0` |

#### Changes

- If you don't have an edge node (Raspberry Pi, Jetson Nano, etc.) available, you can now create
  a [Virtual Node](/docs/cloud/adding-nodes/virtual-node/) for development purposes. A Virtual Node is effectively a local VM that appears
  to Darcy Cloud as an edge node.
- [Darcy AI Engine](/docs/ai/) works best when an AI accelerator (such as a Google Coral) is available, but now
  AI Engine can run directly on CPU. This is useful for local development.

______________________________________________________________________

### 2022.03.30: Darcy Cloud v2.1.0

This release incorporates the first version of Darcy AI Explorer.

| Component          | Version  |
|--------------------|----------|
| Darcy Cloud API    | `v2.1.0` |
| Darcy Cloud Portal | `v2.1.0` |
| Edgectl            | `v2.1.0` |

#### Changes

- Darcy AI explorer app is available which showcases Darcy AI featuring customisable
  people-centric AI.

______________________________________________________________________

### 2022.02.25: Darcy Cloud v2.0.1

This is the first release of Darcy Cloud, which is the successor to Edgeworx Cloud.

| Component          | Version  |
|--------------------|----------|
| Darcy Cloud API    | `v2.0.1` |
| Darcy Cloud Portal | `v2.0.1` |
| Edgectl            | `v2.0.1` |

#### Changes

- Edgeworx Cloud is now Darcy Cloud.
- `edgectl` has switched its entire command structure, from `noun-verb` to `verb-noun`. We are doing
  this based on user feedback from customers who are more familiar with the
  Kubernetes `kubectcl get X` style of CLI. For example, instead of `edgectl account get`,
  use `edgectl get account`. For more detail, see edgectl [docs](/docs/cloud/edgectl).
  - Note that if you are using `edgectl` in scripts or such, and you pull the latest version, you
    must update your scripts to use the new syntax.

______________________________________________________________________

### 2022.01.26: Darcy Cloud v1.3.1

This release of Darcy Cloud introduces application microservice container logging, and
incorporates internal security enhancements.

| Component       | Version  |
|-----------------|----------|
| Darcy Cloud API | `v1.3.1` |
| Edgectl         | `v1.3.2` |

#### Changes

- `edgectl` can retrieve the container logs for application microservices running on edge nodes. For
  example: `edgectl logs myapp/myservice` . See `edgectl logs --help` for usage.
- Internal security enhancements.

______________________________________________________________________

### 2022.01.20: Darcy Cloud v1.2.0

Security enhancements.

| Component         | Version  |
|-------------------|----------|
| Edgeworx CloudAPI | `v1.2.0` |
| Edgectl           | `v1.2.0` |

#### Changes

- Improvements to Edgeworx Cloud internal security mechanisms.

______________________________________________________________________

### 2021.12.16: Darcy Cloud v1.1.7

This release of Edgeworx Cloud consists largely of behind-the-scenes fixes and improvements to
several Edgeworx Cloud components.

| Component          | Version  |
|--------------------|----------|
| Darcy Cloud API    | `v1.1.7` |
| Darcy Cloud Portal | `v1.1.4` |
| Edgectl            | `v1.1.7` |

#### Changes

- Better support for 32-bit Raspbian (Raspberry Pi) systems.
- Minor UX fixes for Edgeworx Cloud Portal.
- Several internal backend improvements.
- CloudPortal: shows correct version of ARM architecture for device.

______________________________________________________________________

### 2021.12.05: Darcy Cloud v1.1.6

This release of Edgeworx Cloud consists largely of behind-the-scenes fixes and improvements to
several Edgeworx Cloud components.

| Component          | Version  |
|--------------------|----------|
| Darcy Cloud API    | `v1.1.6` |
| Darcy Cloud Portal | `v1.1.3` |
| Edgeworx Agent     | `v1.1.3` |
| Edgectl            | `v1.1.6` |

#### Action Required

For users that already have nodes registered with Edgeworx Cloud, it is necesary to re-run your
project's _Node Install Script_ directly (via SSH) on each of your existing nodes. In effect, the
_Node Install Script_ is performing an upgrade of Edgeworx components on your node. You should have
received email communication with detailed steps on how to upgrade the node.

For users of `edgectl`, please upgrade to the latest version, for example: `$ brew upgrade edgectl`
for macOS.
