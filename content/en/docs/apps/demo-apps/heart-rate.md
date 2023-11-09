---
title: "Heart Rate demo app"
weight: 160
aliases:
  - /edgeworx/edgeworx-cloud/get-started-ec/heart-rate-application
---

![Heart Rate Demo App](/images/15done.png)

The Heart Rate app provided on the [Edgeworx Cloud](docs/guides/start-portal) platform simulates a wearable device
transmitting a person's heartbeat at the edge. The Wearable sends heart rate data over bluetooth to
a data collector [microservice](/docs/apps/microservices) located on the primary [node](../../cloud/adding-nodes/_index.md). The Data collector microservice then
communicates with another microservice running a web server on the secondary node to display the
heart rate data on a graph.

#### Requirements

- An Edgeworx Cloud Account
- One or more nodes

{{<info>}} Although this [application](/docs/more/terminology#application) works best with two nodes, you can deploy it with only one
node and run all [microservices](/docs/apps/microservices) on the same device. The YAML will automatically detect if you have
one or two nodes. {{</info>}}

---

## Deploy using Edgeworx Cloud Portal

Deploying the Heart Rate Application from the Edgeworx Cloud platform is extremely simple. Make sure
you have [added at least 1 node]({{<ref "/docs/cloud/adding-nodes/add-node.md">}}) to your Edgeworx Cloud [project](../../more/terminology#project), then
follow the steps below:

1. Go to your Edgeworx Cloud project page
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Click on `Edgeworx HEART RATE DEMO`
5. Select the node(s) where you want it to run
6. Click `DEPLOY`

![Application Deployment Page](/images/12done.png)

## See Application Results

When your app is deployed successfully you will see an `Application Deployed` message in the top
right of your screen.

If you are not already seeing the app listed, click the `APPS` tab to see all of the apps in your
current project. Click the app to access the app detail view.

![Project Details View](/images/13done.png)

From the app detail view, click the linked text under the `ports` column to navigate to the app
output.

![Application Detail View](/images/14done.png)

You should be brought to the Heart Rate Demo App.

![Application Example Output](/images/15done.png)

## App YAML

```yaml
kind: Application
apiVersion: iofog.org/v3
metadata:
  name: edgeworx-heart-rate-demo
spec:
  microservices:
    - name: data-generator
      agent:
        name: '{% raw %}{% assign agent = "" | findAgent | first %}{{ agent.name }}'
      images:
        arm: 'edgeworx/heart-rate-demo-generator:1.0.0'
        x86: 'edgeworx/heart-rate-demo-generator:1.0.0'
      container:
        rootHostAccess: false
        ports: []
      config:
        test_mode: true
        data_label: Anonymous Person
    - name: viewer
      agent:
        name: nodename
      images:
        arm: 'edgeworx/heart-rate-demo-viewer:1.0.0'
        x86: 'edgeworx/heart-rate-demo-viewer:1.0.0'
      container:
        rootHostAccess: false
        ports:
          - external: 5005
            internal: 80
            proxy: true
        volumes: []
        env:
          - key: BASE_URL
            value: 'http://localhost:8080/data'
  routes:
    - from: '{{self.microservices[0].name}}'
      to: '{{self.microservices[1].name}}'
      name: monitor-to-viewer

```
