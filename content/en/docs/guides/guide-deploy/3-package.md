---
title: "Package Your App for Deployment"
linkTitle: "1. Package Your App"
weight: 300
---
![FIXME](/images/guide3-package-docker-hero.png)

## 1. Add a Dockerfile to the same directory as your Python file

To build your Darcy AI application container, you only need your Python file and a Dockerfile. A
Dockerfile is just a text file with the specific name `Dockerfile` that tells the Docker command
tools how to make your containers. You can include as many files as you want in your container. The
commands for adding those files are discussed below. Make sure you create the Dockerfile in the same
directory as your Python file and change the name below from YOURFILE.py to the actual name of your
file.

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

## 2. Create a builder namespace for your build process

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

## 3. Build your Docker container

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

## FIX ME [BUTTON NEXT: DEPLOY YOUR AI APP](#)