---
title: "Docker base image"
linkTitle: "Docker base image"
weight: 410
---

When you package your Darcy AI [applications](../more/terminology.md#application) into Docker containers, you need to include each of the
software libraries that your application relies upon. Fortunately, we provide a Docker container
[base image](../more/terminology.md#docker-base-image) that you can use when packaging your applications which contains each of the foundation
components you need.

To add items to your Darcy AI application, you should include them in your own Dockerfile that
builds on top of the base image. In some cases, however, you may need to alter the components found
within the base image. The details of the Darcy AI Docker container base image are provided here so
you can understand how it is built and alter it as needed.

Making your own base image should only be necessary in uncommon situations, such as when you need to
specify a particular version of OpenCV because of compatibility issues with another library that you
cannot substitute. If you must build your own base image, take note of the differences between ARM
and x86 CPU platforms and revise the Dockerfile accordingly.

## Structure of the base images

The Darcy AI container base image is built as a hierarchy. The image on the bottom is the foundation
for all Darcy AI base images. The content of that image is described in the next section below.

A universal Darcy AI base image is made using the bottom image. It is universal because it includes
the software components needed to run your Darcy AI application using either CPU processing or
Google Coral processing.

Additionally, two other base images are made from the bottom image. One is for CPU processing only
and the other is for Google Coral processing only. These base images are useful if you want to build
your Darcy AI application from a smaller base image. This will result in a smaller total application
image.

If you are not sure which base image is the best for your application, use the universal image which
is published as `darcyai/darcyai`.

You can see the actual base image Dockerfiles at the link below.

[Darcy AI Docker base image files](https://github.com/darcyai/darcyai/tree/main/docker)

## Foundation base image

The Darcy AI container image on the bottom layer provides the largest amount of components. It is
designed to install the correct version of many software libraries depending on the target CPU
architecture for the build. You can see the actual Dockerfile at the following link.

[Bottom base image Dockerfile](https://github.com/darcyai/darcyai/blob/main/docker/base/Dockerfile)

There are a large number of software components being installed. To make the list easier to
understand, here is a short list of the types of components found in this Dockerfile.

- SSL certificate libraries
- Network tools used to perform build operations
- Image and video codecs and libraries
- Compiler software used to build other components
- OpenCV, Pillow, and imutils Python libraries

When the target build architecture is ARM/v7, a large number of additional components must be
installed. These are required for the Python libraries to work properly.

## Universal base image

The universal base image is built on top of the bottom foundation base image. You can see the actual
Dockerfile using the link below.

[Universal base image Dockerfile](https://github.com/darcyai/darcyai/blob/main/docker/universal/Dockerfile)

This base image is able to be used as the starting container image for your Darcy AI application
packaging. It installs the Google Coral TPU software components which also includes the TensorFlow
runtime that can be used by CPU processors.

This Dockerfile will continue to grow as support for additional types of AI processors is added to
Darcy AI.

## Google Coral base image

The Google Coral base image is also built on top of the bottom foundation base image, but it only
contains the software components needed to run your Darcy AI application on devices that have a
Coral TPU. You can see the actual Dockerfile using the link below.

[Google Coral base image Dockerfile](https://github.com/darcyai/darcyai/blob/main/docker/coral/Dockerfile)

## CPU base image

The CPU base image is built on top of the bottom foundation base image, as well, and only contains
the software components needed to run your Darcy AI application on devices with CPU processing. You
can see the actual Dockerfile using the link below.

[CPU base image Dockerfile](https://github.com/darcyai/darcyai/blob/main/docker/cpu/Dockerfile)
