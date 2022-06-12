---
title: "Set Up Your Build Environment"
linkTitle: "1. Set Up Environment"
weight: 100
---
![Environment setup](/images/guide1-environment-setup-alt.jpg)


## Install Python 3.6.9 or greater

If you do not already have Python version 3.6.9 or greater, you will need to install it now. Darcy
AI requires this version of Python or higher. Note that Python 2.x versions are also not compatible
with Darcy AI. You need Python 3 and the `darcyai` library will not install with versions below
3.6.9.

Download and install the latest or your preferred version of Python3 from Python.org
directly [https://www.python.org/downloads/macos/](https://www.python.org/downloads/macos/).

If you have both Python 2.x versions and Python 3.x versions on your Mac, you may need to
use `python3` and `pip3` for all of the commands instead of just `python` and `pip`. You can change
this if you want by following this
guide [https://osxdaily.com/2022/02/15/make-python-3-default-macos/](https://osxdaily.com/2022/02/15/make-python-3-default-macos/)
.

## Install OpenCV

Install the OpenCV package for Python with the command `pip install opencv-python`

## Install the Pillow library

Install the Pillow package for Python with the command `pip install Pillow`.

## Install the Numpy library

Install the numpy package for Python with the command `pip install numpy`.

## Install the Imutils library

Install the imutils package for Python with the command `pip install imutils`.

## Install the DarcyAI Engine

Install the Darcy AI library for Python with the command `pip install darcyai`.

## Install Docker

If you don't already have Docker on your Computer, install it now by following the official
instructions
- [ Install Docker on Mac ](#)
- [ Install Docker on Windows](#)

After you have installed Docker, you can use `docker` commands in terminal. You will be using these
commands to package your Darcy AI applications for deployment, including deploying to edge devices
that are a different CPU architecture than your Mac! To make sure you can use the latest Docker
build commands like `buildx` you can add an environment variable to your Mac with the following
command `export DOCKER_CLI_EXPERIMENTAL=enabled`. This will tell Docker to allow use of the latest
tools which will save you a lot of time when packaging your apps!

> Note that![img.png](img.png) you may need to use `sudo docker` instead of just `docker` depending on how you install and set up Docker for Mac. If that is the case on your development machine, you can just add `sudo` to the beginning of any `docker` commands shown in these guides.

## Install TensorFlow

Install TensorFlow for Python with the command `pip install tensorflow`

## FIX ME [BUTTON NEXT: BUILD YOUR AI APP](#)
