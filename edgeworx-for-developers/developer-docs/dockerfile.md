# Example Dockerfile for building a Darcy AI application

In order to run your Darcy AI application on your Darcy cam, you will need to package your code in a Docker container. To package your code, you will run some Docker commands from the command prompt on your Darcy cam. Those commands require a text file called a "Dockerfile" which tells the Docker software how to do the packaging and build your container. A sample Dockerfile is shown below. The discussion that follows will walk you through each of the lines in the Dockerfile and explain the operations so you can make your own.

```
FROM edgeworx/darcy-ai-sdk-base:1.0.0

RUN python3 -m pip install darcyai

COPY custom_ai_model.tflite /src/
COPY custom_ai_labels.txt /src/
COPY static/ /src/static/
COPY my_application.py /src/

ENTRYPOINT ["/bin/bash", "-c", "cd /src/ && python3 ./my_application.py"]
```

## How a Dockerfile works

When Docker uses a Dockerfile to build a container, it works through each line and executes the instructions. It goes from top to bottom. For each line, it creates a new "layer" of the container. This means that every container is really a collection of layers. The stored version of a fully packaged container is called an "image", and every image is made of saved layers. Layers get reused whenever possible, which makes it much faster to build containers when not much has changed. This also means that downloading an updated container image is **much** faster if a minimal number of layers have changed.

>PRO TIP: Put your most frequently changing lines of your Dockerfile as close to the end as possible, so all of the layers above can stay the same. Your build times and download times will be greatly improved.

Docker needs Dockerfiles to be plain text and needs them to just be called "Dockerfile" with no extension. It's helpful to keep every instruction in a Dockerfile on its own line for clarity, which you can see illustrated in the example above.

## The FROM instruction

Every new container must start from some a base container. The first line in your Dockerfile will be a `FROM` instruction which tells Docker which base container you want to use as your starting point. The instruction format is pretty straightforward. Use the keyword `FROM` followed by the string that uniquely identifies the container image. In the example above, the identifier string is `edgeworx/darcy-ai-sdk-base:1.0.0`. The first part of the string `edgeworx` is the organization, which of course refers to the company called Edgeworx. By default, Darcy will look for container images in the Docker Hub cloud system. Starting the identifier string with `edgeworx` tells Docker to look for the next part of the container image name under the Edgeworx organization. When you save container images in Docker Hub, you will use your own organization name as the start of the identifier string.

The first and second part of the identifier string are separated by a `/`. The second part of the identifier is the name of the container image. In the example above it is `darcy-ai-sdk-base`. As you can see from the name, this container image is a reusable base for building new Darcy AI applications from the SDK.

The second and third part of the string is separated by a `:`. The third part is called the "tag" and you can think of it as a version specifier. For any container image name, you can have as many tags as you want. In the example above, the tag is `1.0.0` which denotes version 1.0.0 of this container image.

Using the instruction `FROM edgeworx/darcy-ai-sdk-base:1.0.0` tells Docker to load the base container image and then start building the new container on top of that. This means that the operating system and every file and piece of sofware found in the base container will be present in the new container. Using the base container image shown here in the example will provide you with all of the pre-installed software and configuration you need to make your Darcy AI application run properly.

## The RUN instruction

Every time Docker sees the `RUN` instruction, it will attempt to run the commands that follow and will make a new container layer if the commands are successful. In the example above, we have `RUN python3 -m pip install darcyai`. This instruction tells Docker to run the command `python3 -m pip install darcyai` which is a standard Python package installation command. The package we want to install is called "darcyai". It is the Python3 SDK for building Darcy AI applications. You must include this `RUN` instruction in your own Dockerfile otherwise you will be missing the Darcy AI SDK package for Python3.

> PRO TIP: We put the `RUN` instruction for installing the "darcyai" package in the example Dockerfile on purpose, instead of including that package in the base container image. This is so you can include the instruction in your own Dockerfile and get updated versions of the Darcy AI SDK when you build new containers. If it were included in the base container image, the Python3 package would never get updated.

You can have as many `RUN` commands as you want. If you want to install additonal Python3 packages, just add another instruction, such as `RUN python3 -m pip install pendulum`. If you want to install Linux packages to use inside your container, use standard commands such as `RUN apt-get install -y unzip` and don't forget the `-y` flag for automatically saying "yes" during the install because you will not be able to manually interact with the installer program when Docker is running it inside the container.

## The COPY instruction


