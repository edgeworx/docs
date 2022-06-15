---
title: "Deploy an app to the Edge in about 30 minutes"
linkTitle: "Deploy to the Edge"
weight: 250
---

![Darcy CLoud Project Page](/images/guide4-deploy-cloud.jpg)

## What you will accomplish

By the end of this guide, you will be able to make deployable Darcy AI application packages that
will run on any hardware that meets the requirements for Darcy AI. The list of compatible hardware
is extensive, allowing you to deploy your Darcy AI applications to the devices that fit your
solution needs.

{{< alert icon="" style="info"  >}}
We recommend using a Raspberry Pi 4 with an attached Google Coral accelerator for the best performance.
{{< /alert>}}

#### Software Requirements
- Docker Desktop and a Docker account
- Darcy Cloud account (Free)

#### Hardware Requirements
- An Edge device
    - Raspberry Pi 4 with 2GB+ of RAM (recommended)
    - [More Edge device options](/docs/cloud/portal/nodes/)
- Video camera attached to the camera port
- AI Processor: Google Coral edge TPU (USB version attached to USB 3.0 port)
- Micro SD card with at least 16GB capacity (32GB+ recommended)
- Power supply
- Internet connectivity

---
## Package your app

### Install Docker and create an account

- Install Docker [Mac](https://docs.docker.com/desktop/mac/install/) or [Windows](https://docs.docker.com/desktop/windows/install/)

- [Create a Docker Hub Account](https://hub.docker.com/signup)

{{< alert icon="" style="info"  >}}
After you have installed Docker, you can use `docker` commands in terminal. You will be using these
commands to package your Darcy AI applications for deployment, including deploying to edge devices
that are a different CPU architecture than your computer! To make sure you can use the latest Docker
build commands like `buildx` you can add an environment variable to your computer with the following
command `export DOCKER_CLI_EXPERIMENTAL=enabled`. This will tell Docker to allow use of the latest
tools which will save you a lot of time when packaging your apps!
{{< /alert>}}

{{< alert style="warning" >}}
You may need to use `sudo docker` instead of just `docker` depending on how you install and set up Docker for Mac. If that is the case on your development machine, you can just add `sudo` to the beginning of any `docker` commands shown in these guides.
{{< /alert>}}

### Add a Dockerfile

To build your Darcy AI application container, you only need your Python file and a Dockerfile. A
Dockerfile is just a text file with the specific name `Dockerfile` that tells the Docker command
tools how to make your containers. You can include as many files as you want in your container. The
commands for adding those files are discussed below.

{{< alert style="warning" >}}
Make sure you create the Dockerfile in the same
directory as your Python file and change the name below from YOURFILE.py to the actual name of your
file.
{{< /alert >}}

```text
FROM darcyai/darcy-ai-coral:dev

RUN python3 -m pip install darcyai

COPY ./YOURFILE.py /src/app.py

CMD python3 -u /src/app.py
```

The `FROM` command tells Docker which base image to use. It will build your application container
starting from the base image.

Every `RUN` command tells Docker to execute a step. In the example above, the step is to install
the `darcyai` Python library. We don't include that library in the base image because that would
make it more difficult to use the latest Darcy AI library. Using this single command in your
Dockerfile, you will always get the latest Darcy AI library when building your container images.

Similarly, every `COPY` command tells Docker to take something from your local environment and make
a copy of it in your container. Use this command to copy in files that are part of your application,
such as .mp4 videos, .tflite AI models, and additional Python code files. The first part of the
command is the source and the second part is the destination. In the example above,
the `YOURFILE.py` file is copied into the `/src/` directory in the container and renamed to `app.py`
.

The `CMD` command tells Docker to execute this command when the container is started. This is
different than the `RUN` command which tells Docker to execute the command while building the
container. The `CMD` statement is found at the end because the container must be fully built before
this statement. When the container starts, the instructions found after the `CMD` will be executed.
In the example above, the instructions are to run the `/src/app.py` Python file using `python3` and
we have added the `-u` parameter which tells the Python3 engine to use unbuffered output because we
want to see the output in the container logs unhindered.

### Create a builder namespace for your build process

The `docker buildx` command line tool that was installed with your Docker Desktop will allow you to
build and package container images for several target device platforms (CPU architectures) at the
same time. If you do not have the `docker buildx` tool installed, you can learn about it and install
it from the [Docker BuildX Guide](https://docs.docker.com/buildx/working-with-buildx/).

The first step is to create a named builder that BuildX can use. You can do that with the following
command. Replace YOURNAME with the name you would like to use.

NOTE: If your installation of Docker Desktop requires you to use `sudo` when using `docker`
commands, simply add the `sudo` to the beginning of everything shown in this guide.

```shell
docker buildx create --name YOURNAME
```

And now that you have created a builder namespace, let's set BuildX to use that namespace with this
command.

```shell
docker buildx use YOURNAME
```

### Build your Docker container

Now that you have a working BuildX builder namespace and a Dockerfile in your current working
directory where your Python file is located, you can do the actual build.

NOTE: If you don't already have an account, create one now at
[https://hub.docker.com](https://hub.docker.com). You will be given an organization which is
your username. Ensure that you are logged into your Docker Hub account using the following
command by replacing the organization with your Docker Hub organization name.

```shell
docker login --username=organization
```

Run the following command in the directory of your Dockerfile to perform the build. You will
need to replace `organization` with your actual Docker Hub organization name. Also replace
`application-name` with the name you want to use for this container. The part after the `:`
is the tag. You can put anything you want here. It is a common practice to put a version number,
such as `1.0.0` in the example below.

```shell
docker buildx build -t organization/application-name:1.0.0 --platform linux/amd64,linux/arm64,linux/arm/v7 --push .
```

The `--platform` part of this build command specifies the platforms for which you want containers
built. It is recommended to build for the list of platforms shown in the example here. This will
allow you to run your Darcy AI application container on 64-bit x86 devices and both 64-bit and
32-bit ARM devices.

The `--push` part of the command tells Docker to upload your container images to Docker Hub when it
is finished building.

Don't forget the `.` on the end of the command. That tells the BuildX tool to look for
your `Dockerfile` in the current directory.

Your build process may take 10 or 15 minutes if you are building for the first time and you do not
have a very fast internet connection. This is because the underlying container
[base images]({{<ref "/docs/more/terminology.md#docker-base-image">}}) will need to be downloaded.
After the first
build, this process should only take a few minutes. You can watch the output of the command to see
the build progress. A separate container image will be built for each of the platforms specified in
the command. Additionally a container manifest file will be created and added to the container
registry (Docker Hub) so different platforms will know which image to download and start.

### Make sure your Darcy AI application container is available

In the packaging process above, you specified a full application container identifier for your Darcy AI
application. This identifier consists of an organization name followed by a `/` and then a container
name followed by a `:` and then a tag. As an example, the identifier `darcyai/darcy-ai-explorer:1.0.0` represents an application called `darcy-ai-explorer`
with a tag `1.0.0` that is hosted under the Docker Hub organization `darcyai`.

You will use your container identifier in your application deployment YAML file below. Make sure
your container images were successfully pushed to Docker Hub at the conclusion of your packaging
process.

## Deploy your app

### Add your devices to the Darcy Cloud

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

![Cloud Portal Plus Button](/images/guides/deploy-node-ui.gif)

### Create your application YAML

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

### Deploy your Darcy AI application

Now that you have all of the pieces, it's easy to deploy your application to your device or any
other device. In the Darcy Cloud, click on the "plus button" in the bottom left and choose "app".

![Cloud Portal Plus Button](/images/guides/deploy-app-ui.gif)

In the pop-up window, choose the "upload your app" option and you will see a drag-and-drop window on
the right-hand side. You can drag and drop your YAML file into that window or you can click the "
browse and upload" option and then select your YAML file.

![FIXME](/images/darcy-cloud-custom-app-deployment.png)

The Darcy Cloud will tell you if you have any issues with your YAML file or your app deployment. It
will also tell you if your Darcy AI application was deployed successfully. You can then check the
status of your application using the Darcy Cloud.

## Use your Darcy AI application

When your Darcy AI application has successfully been deployed to your devices, you will see the
status `running` in your Darcy Cloud UI. At this time, your Darcy AI application is fully running on
those devices. If your application has a live video feed, such as the demo application you built in
the [Build Guide]({{<ref "build.md">}}) at port 3456 then you should be able to view the live feed using the
IP address of the device followed by `:3456`, e.g. `http://192.168.1.20:3456`.

You have accomplished a great amount at this point. Congratulations! You have developed a Darcy AI
application and tested it with your IDE and local development environment. You have packaged your
application for a variety of target devices. And you have made a deployment YAML file and used the
Darcy Cloud to deploy and manage your Darcy AI application.

## Next steps

Now that you have all of these foundation Darcy AI developer skills, you are ready to build full
solutions. Follow the guide to [Extend Darcy](/docs/guides/extend.md) to build an app for your use case.
