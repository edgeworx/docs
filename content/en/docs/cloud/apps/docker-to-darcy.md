---
title : "Docker to Darcy"
---

There are several possible [docker run](https://docs.docker.com/engine/reference/commandline/run/) **** command line options that can be used when spinning up a Docker container. The following docker run commands can be directly mapped from a `docker run` command to a Darcy Cloud YAML configuration file:

1. Volumes
2. Environment Variables
3. Ports
4. Arguments / Commands
5. Privilege

## Volumes

Volumes are primarily used to share data between containers or nodes, or to persist data upon the destruction of containers or nodes

#### **Docker Run Command**

```
docker run <image> -v /path/to/mount/directory:/path/to/destination/in/container
```

#### **Darcy Cloud YAML Configuration**

```
container:
  # Microservice container volume mapping list on the agent
  volumes:
    # This will create a volume mapping between the agent '/tmp/msvc' volume
    # and the microservice container '/data' volume
    - hostDestination: /tmp/msvc
      containerDestination: /data
      # ReadWrite access to the mounted volume
      accessMode: 'rw'
      # Accepts 'bind' or 'volume'. Default is 'bind'
      type: 'bind'
```

## Environment Variables

Environment variables for a Docker container can be set through the command line. We can list these same key-value pairs in the YAML configuration as shown below

#### **Docker Run Command**

```
docker run <image> ---env BASE_URL=http://localhost:8080/data
```

#### **Darcy Cloud YAML Configuration**

```
container:
  # Microservice container environment variable list on the agent
  env:
    # This will create an environment variable inside the microservice container
    # with the key 'BASE_URL' and the value 'http://localhost:8080/data'
    - key: BASE_URL
      value: http://localhost:8080/data
```

## Ports

We use the -p flag to map the port number of a container to the port number of the Docker host via the Docker command line. It is equally simple to expose ports in an Darcy Cloud YAML configuration file

#### **Docker Run Command**

```
docker run <image> -p 5000:80
```

#### **Darcy Cloud YAML Configuration**

```
container:
  # Microservice container port mapping list on the agent
  ports:
    # This will create a mapping between the port 80 of the microservice
    # container and the port 5000 of the agent that runs over TCP
    - internal: 80
      external: 5000
      protocal: tcp
```

## Arguments / Commands

Similar to Docker, we can run the same commands via Darcy Cloud YAML as we can via the command line with the exception of `entrypoint` arguments

#### **Docker Run Command**

```
docker run <image> dbhost localhost:27017
```

#### **Darcy Cloud YAML Configuration**

```
container:
  commands:
    - 'dbhost'
    - 'localhost:27017'
```

## Privileged

The `privileged` command line argument tells the container whether or not it has access to the root of the node or machine it is being run on

#### **Docker Run Command**

```
docker run <image> --privileged
```

#### **Darcy Cloud YAML Configuration**

```
container:
  rootHostAccess: true
```
