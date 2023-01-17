---
title: "Heart Rate demo app"
weight: 160
aliases:
  - /darcy/darcy-cloud/get-started-ec/heart-rate-application
---

![Heart Rate Demo App](/images/15done.png)

The Heart Rate app provided on the [Darcy Cloud](docs/cloud/start-portal) platform simulates a wearable device
transmitting a person's heartbeat at the edge. The Wearable sends heart rate data over bluetooth to
a data collector [microservice](/docs/apps/microservices) located on the primary [node](../../cloud/adding-nodes/_index.md). The Data collector microservice then
communicates with another microservice running a web server on the secondary node to display the
heart rate data on a graph.

#### Requirements

- A Darcy Cloud Account
- Any edge node (or a virtual node)

{{<info>}} Although this [application](/docs/more/terminology#application) works best with two nodes, you can deploy it with only one
node and run all [microservices](/docs/apps/microservices) on the same device. The YAML will automatically detect if you have
one or two nodes. {{</info>}}

---

## Deploy using Darcy Cloud Portal

Deploying the Heart Rate Application from the Darcy Cloud platform is extremely simple. Make sure
you have [added at least 1 node]({{<ref "/docs/cloud/adding-nodes/add-node.md">}}) to your Darcy Cloud [project](../../more/terminology#project), then
follow the steps below:

1. Go to your Darcy Cloud project page
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Click on `DARCY HEART RATE DEMO`
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
  name: demo-app
spec:
  microservices:
    # Custom micro service that will connect to Scosche heart rate monitor via Bluetooth
    - name: "monitor"
      agent:
        name: "{% raw %}
{% assign agent = \"\" | findAgent | first %}{{ agent.name }}"
      images:
        arm: "edgeworx/healthcare-heart-rate:arm-v1"
        x86: "edgeworx/healthcare-heart-rate:x86-v1"
      container:
        rootHostAccess: false
        ports: []
      config:
        # data will be mocked
        test_mode: true
        data_label: "Anonymous Person"
    # Simple JSON viewer for the heart rate output
    - name: "viewer"
      agent:
        name: "{% assign agent = \"\" | findAgent | last %}
{% endraw %}{{ agent.name }}"
      images:
        arm: "edgeworx/healthcare-heart-rate-ui:arm"
        x86: "edgeworx/healthcare-heart-rate-ui:x86"
      container:
        rootHostAccess: false
        ports:
          # The ui will be listening on port 80 (internal).
          - external: 5000 # You will be able to access the ui on <AGENT_IP>:5000
            internal: 80 # The ui is listening on port 80. Do not edit this.
            public:
              schemes:
              - https
              protocol: http
        volumes: []
        env:
          - key: "BASE_URL"
            value: "http://localhost:8080/data"
  routes:
    # Use this section to configure route between microservices
    # Use microservice name
    - from: "{{self.microservices[0].name}}"
      to: "{{self.microservices[1].name}}"
      name: "monitor-to-viewer"
```
