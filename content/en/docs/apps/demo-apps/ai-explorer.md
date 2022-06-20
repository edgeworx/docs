---
title : "AI Explorer Demo App"
weight: 70
aliases:
  - /darcy/darcy-cloud/get-started-ec/darcy-ai-explorer-application
---

![Heart Rate Demo App](/images/ai-exp-hero.jpg)

The Darcy AI Explorer is a showcase app for Darcy AI. Bootstrap your AI project using
powerful face detection, pose detection, QR code scanning and more.

#### Requirements

* A Darcy Cloud account
* Compatible ARM edge node with a Coral Accelerator
  * Raspberry Pi + Coral AI accelerator
  * Coral Dev Board
  * Coral Mini
  * Tinker T

{{<alert>}} If you have previously deployed an application to your node, you can either
start a new project and add a node there or delete the existing application from the node. We just
need to be sure that we have a free node inside our project to deploy to {{</alert>}}

---

## Deploy the app using Darcy Cloud Portal

Deploying the AI Explorer Demo app from the Darcy Cloud platform is simple. Make sure
you have [added at least 1 node]({{<ref "/docs/cloud/adding-nodes/add-node.md">}}) to your Darcy Cloud project, then
follow the steps below:

1. Go to your Darcy Cloud project page
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Click on `DARCY AI Explorer DEMO`
5. Select the node(s) where you want it to run
6. Click `DEPLOY`

## See App Results

When your app is deployed successfully you will see an `Application Deployed` message in the top
right of your screen.

If you are not already seeing the app listed, click the `APPS` tab to see all of the apps in your
current project. Click the app to access the app detail view.

From the app detail view, click the linked text under the `ports` column to navigate to the app
output.

You should be brought to the AI Explorer Demo app.

## App YAML

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
