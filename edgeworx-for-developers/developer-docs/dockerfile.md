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
