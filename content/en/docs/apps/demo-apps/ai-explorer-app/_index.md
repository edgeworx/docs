---
title : "Darcy AI Explorer App"
weight: 70
aliases:
  - /darcy/darcy-cloud/get-started-ec/darcy-ai-explorer-application
---

Apps are groups of microservices bundled to work together. They are defined using YAML files and can
be deployed and updated by uploading those YAML files through Darcy Cloud or through
[edgectl]({{<ref "/docs/cloud/edgectl/add-an-edge-node.md">}}). An app can consist of an arbitrary
number of interacting or standalone microservices that are deployed on one or may nodes.

## About the Darcy AI Explorer Application

The Darcy AI Explorer is a showcase app for the Darcy AI SDK. Bootstrap your AI project using
powerful face detection, pose detection, QR code scanning and more.

## Prerequisites

To deploy the Darcy AI Explorer app, you will need:

* A Darcy Cloud Account
* Compatible ARM edge node with a Coral Accelerator
  * Raspberry Pi + Coral AI accelerator
  * Coral Dev Board
  * Coral Mini
  * Tinker T

{{<alert>}} If you have previously deployed an application to your node, you can either
start a new project and add a node there or delete the existing application from the node. We just
need to be sure that we have a free node inside our project to deploy to {{</alert>}}

## Sample App YAML
```yaml
kind: Application
apiVersion: iofog.org/v3
metadata:
  name: darcy-ai-explorer
spec:
  microservices:
    - name: darcy-ai-explorer
      agent:
        name: ''
      images:
        arm: 'darcyai/darcy-ai-explorer:1.0.0'
        x86: 'darcyai/darcy-ai-explorer:1.0.0'
      container:
        rootHostAccess: true
        env:
          - key: PORT
            value: '5555'
        ports:
          - external: '{{self.microservices[0].env[0].value | toNumber}}'
            internal: '{{self.microservices[0].env[0].value | toNumber}}'
        volumes:
          - containerDestination: /dev
            hostDestination: /dev
            type: bind
            accessMode: rw
```

