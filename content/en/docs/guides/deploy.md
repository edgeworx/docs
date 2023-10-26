---
title: "Deploy an app to the edge in under 10 minutes"
linkTitle: "Deploy to the edge"
weight: 250
---

![Edgeworx CLoud Project Page](/images/guide4-deploy-cloud.jpg)

## What you will accomplish
<!-- TODO: This content needs an extensive rewrite -->
By the end of this guide, you will be able to make deployable edge application packages that
will run on any hardware. The list of compatible hardware
is extensive, allowing you to deploy your applications to the devices that fit your
solution needs.

{{<info>}}
This guide was created using an Raspberry Pi 4, however you can use any device with Linux and the required packages installed.
{{</info>}}

### Software Requirements

- Docker Desktop and a Docker account
- Edgeworx Cloud account (Free or paid)

### Hardware Requirements

- [An edge device](docs/cloud/adding-nodes) with Linux (Debian is preffered)
- [Power supply](docs/cloud/adding-nodes): 5.1V \* 3.5A
- Micro SD card with at least 16GB capacity (32GB+ recommended)
- Internet connectivity

---

## Package your app

If you plan to package your own application, you can refer to the official guide on [packaging applications](https://docs.docker.com/get-started/02_our_app/). That guide will give you step by step instructions on how to build, package, and release an application to docker. You'll be able to pull your custom image
from docker after following those steps.

## Deploy your app

### Add your devices to the Edgeworx Cloud

The [Edgeworx Cloud](/docs/cloud/start-portal) gives you management of all your [edge devices]({{<ref "/docs/cloud/adding-nodes">}}) and edge applications in one place.
You can open an SSH shell session on demand, deploy applications, and see the health and status for
every device. All of this functionality works no matter where your edge devices are physically
located, even when they are behind NAT layers and firewalls. Use the Edgeworx Cloud to make building,
deploying, and debugging easier, and then use it to operate your edge applications in production
systems.

If you don't already have an account, you can create one now for free. Create an account or log in
at [https://cloud.edgeworx.io](https://cloud.edgeworx.io).

Once you are in your Edgeworx Cloud account, [add your device as a node]({{<ref "/docs/cloud/adding-nodes/add-node.md">}}) in
your current [project](/docs/more/terminology#project). Use
the "plus button" in the bottom left to add a node. Follow the instructions in the pop-up window to
add your device as a node.

![Cloud Portal Plus Button](/images/guides/deploy-node-ui.gif)

### Create your application YAML

Here is a sample YAML file to work with. Since we will be deploying the "hello-world" docker container,
we just need to create the yaml file, and upload that as the configuration.

```yaml
kind: Application
apiVersion: iofog.org/v3
metadata:
  name: your-application-name
spec:
  microservices:
    - name: your-microservice-name
      agent:
        name: your-edgeworx-cloud-node-name
      images:
        arm: "library/hello-world"
        x86: "library/hello-world"
      container:
        rootHostAccess: true
        ports:
          - external: 5005
            internal: 80
            proxy: true
            scheme: http
        volumes:
          - containerDestination: /dev
            hostDestination: /dev
            type: bind
            accessMode: rw
```

You can find this sample YAMl file in the `examples/deploy/` directory
called [app_deployment.yml](https://github.com/Edgeworxai/Edgeworxai/tree/main/src/examples/deploy/app_deployment.yml).

Your application deployment YAML file contains the information that the Edgeworx Cloud uses to load and
run your Edgeworx application on any device. Replace the placeholder fields with your own
information and save the file with whatever file name you like, such as `my-app-deploy.yml`.

For the agent name, which is shown above as `your-edgeworx-cloud-node-name` you should use the actual
node name from your Edgeworx Cloud account. This is the name that shows for your device which you added
in the steps above.

### Deploy your Edgeworx application

Now that you have all of the pieces, it's easy to deploy your application to your device or any
other device. In the Edgeworx Cloud, click on the "plus button" in the bottom left and choose "app".

![Deploy app animation](/images/guides/deploy-app-ui.gif)

In the pop-up window, choose the "upload your app" option and you will see a drag-and-drop window on
the right-hand side. You can drag and drop your YAML file into that window or you can click the "
browse and upload" option and then select your YAML file.

![Deploy App](/images/edgeworx-cloud-custom-app-deployment.png)

The Edgeworx Cloud will tell you if you have any issues with your YAML file or your app deployment. It
will also tell you if your Edgeworx application was deployed successfully. You can then check the
status of your application using the Edgeworx Cloud.

## Use your Edgeworx application

When your Edgeworx application has successfully been deployed to your devices, you will see the
status `running` in your Edgeworx Cloud UI.

You have accomplished a great amount at this point. Congratulations! You have developed a Edgeworx AI
application and tested it with your IDE and local development environment. You have packaged your
application for a variety of target devices. And you have made a deployment YAML file and used the
Edgeworx Cloud to deploy and manage your Edgeworx application.

## Next steps
<!-- TODO reword this below and add valid link-->
Now that you have all of these foundation Edgeworx developer skills, you are ready to build full
solutions. Follow the guide to [Extend Edgeworx](https://edgeworx.io) to build an app for your use case.
