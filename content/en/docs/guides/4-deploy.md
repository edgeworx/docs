---
title: "Deploy Your App to the Edge"
linkTitle: "4. Deploy it to the Edge"
weight: 400
---
![FIXME](/images/guide4-deploy-cloud.jpeg)

## What you will accomplish

Once you have built and packaged a Darcy AI application, you can deploy it to as many devices as you
want. Use this guide to get devices set up on the [Darcy Cloud](https://cloud.darcy.ai) and create
your own deployment YAML files and deploy your applications.

## Requirements

* Darcy Cloud Account
* Edge Development Board
  * Raspberry Pi 4 + Google Coral Accelerator

-----

## 1. Make sure your Darcy AI application container is available

You should have completed the steps in the [Packaging Guide]({{<ref "3-package.md">}}) by now. If have not,
follow that guide now to package your Darcy AI application.

In the packaging process you specified a full application container identifier for your Darcy AI
application. This identifier consists of an organization name followed by a `/` and then a container
name followed by a `:` and then a tag. As an example, the
identifier `darcyai/darcy-ai-explorer:1.0.0` represents an application called `darcy-ai-explorer`
with a tag `1.0.0` that is hosted under the Docker Hub organization `darcyai`.

You will use your container identifier in your application deployment YAML file below. Make sure
your container images were successfully pushed to Docker Hub at the conclusion of your packaging
process.

## 2. Add your devices to the Darcy Cloud

### About Darcy Cloud

The Darcy Cloud gives you management of all your edge devices and edge applications in one place.
You can open an SSH shell session on demand, deploy applications, and see the health and status for
every device. All of this functionality works no matter where your edge devices are physically
located, even when they are behind NAT layers and firewalls. Use the Darcy Cloud to make building,
deploying, and debugging easier, and then use it to operate your edge AI applications in production
systems.

If you don't already have an account, you can create one now for free. Create an account or log in
at [https://cloud.darcy.ai](https://cloud.darcy.ai).

Once you are in your Darcy Cloud account, add your device as a node in your current project. Use
the "plus button" in the bottom left to add a node. Follow the instructions in the pop-up window to
add your device as a node.

![Cloud Portal Plus Button](/images/darcy-cloud-plus-item-button.png)

## 3. Create your application YAML

Here is a sample YAML file to work with.

```yaml
kind: Application
apiVersion: iofog.org/v3
metadata:
  name: your-application-name
spec:
  microservices:
    - name: your-microservice-name
      agent:
        name: your-darcy-cloud-node-name
      images:
        arm: 'YOUR_ORGANIZATION/YOUR_APP:tag.goes.here'
        x86: 'YOUR_ORGANIZATION/YOUR_APP:tag.goes.here'
      container:
        rootHostAccess: true
        ports: []
        volumes:
          - containerDestination: /dev
            hostDestination: /dev
            type: bind
            accessMode: rw
```

You can find this sample YAMl file in the `examples/deploy/` directory
called [app_deployment.yml](https://github.com/darcyai/darcyai/tree/main/src/examples/deploy/app_deployment.yml).

Your application deployment YAML file contains the information that the Darcy Cloud uses to load and
run your Darcy AI application on any device. Replace the placeholder fields with your own
information and save the file with whatever file name you like, such as `my-app-deploy.yml`.

For the agent name, which is shown above as `your-darcy-cloud-node-name` you should use the actual
node name from your Darcy Cloud account. This is the name that shows for your device which you added
in the steps above.

## 4. Deploy your Darcy AI application

Now that you have all of the pieces, it's easy to deploy your application to your device or any
other device. In the Darcy Cloud, click on the "plus button" in the bottom left and choose "app".

![Cloud Portal Plus Button](/images/darcy-cloud-plus-item-button.png)

In the pop-up window, choose the "upload your app" option and you will see a drag-and-drop window on
the right-hand side. You can drag and drop your YAML file into that window or you can click the "
browse and upload" option and then select your YAML file.

![FIXME](/images/darcy-cloud-custom-app-deployment.png)

The Darcy Cloud will tell you if you have any issues with your YAML file or your app deployment. It
will also tell you if your Darcy AI application was deployed successfully. You can then check the
status of your application using the Darcy Cloud.

## 5. Use your Darcy AI application

When your Darcy AI application has successfully been deployed to your devices, you will see the
status `running` in your Darcy Cloud UI. At this time, your Darcy AI application is fully running on
those devices. If your application has a live video feed, such as the demo application you built in
the [Build Guide]({{<ref "2-build.md">}}) at port 3456 then you should be able to view the live feed using the
IP address of the device followed by `:3456`, e.g. `http://192.168.1.20:3456`.

You have accomplished a great amount at this point. Congratulations! You have developed a Darcy AI
application and tested it with your IDE and local development environment. You have packaged your
application for a variety of target devices. And you have made a deployment YAML file and used the
Darcy Cloud to deploy and manage your Darcy AI application.

## Next steps

Now that you have all of these foundation Darcy AI developer skills, you are ready to build full
solutions. Use the [Technical Documentation](https://darcyai.github.io/darcyai) to learn more
about what Darcy AI can do and take your skills to the next level.