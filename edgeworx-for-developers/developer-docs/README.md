# Developer Documentation

To build your own computer vision and edge AI applications with Darcy, you need to make a Docker container that includes the Darcy AI SDK. The details of how to create your Docker container and how to use the SDK are available using the information and the links below. There is also a link for helpful resources that you can use to get familiar with the technologies that power Darcy and technologies that are important for computer vision and AI development.

## What you use to build your application

Because the Darcy AI platform handles many of the complexities of computer vision applications on your behalf, there are only a few technologies that you need to use in order to make your own application. Get familiar with the following technologies and then follow the guided steps for building your first Darcy AI app.

### Python 3

Python is the programming language that you use to build Darcy AI applications. Specifically, Darcy uses Python3. The language homepage is [https://www.python.org/](https://www.python.org/) and you can find a large number of resources for getting started and understanding the different pieces of the Python ecosystem.

As you build your Darcy AI applications, you will move your Python3 code files into your Darcy cam to build your application containers. You can, therefore, use any development tools or software you like for writing your Python code.

### Darcy AI SDK

To program a Darcy AI application, you will use the Darcy AI SDK, which is a Python library available on the PyPI package hosting system. PyPI allows Python developers to install packages very easily using simple commands. You will use these commands to install the Darcy AI SDK when building your application containers. You can also install and use any other Python packages you want.

You can find the Darcy AI SDK library at [https://pypi.org/project/darcyai/](https://pypi.org/project/darcyai/). The detailed documentation for using the library is here on this site at [Darcy AI SDK documentation](ai-sdk.md).

### Docker command line tools

* Docker command line tools \(built into your Darcy cam\)

### TensorFlow Lite AI models

* TensorFlow Lite AI models \(optional if you want to add your own AI processing or change Darcy's base AI models\)

## What you use to deploy your application

Once you have built your application, you need to deploy it into one or more Darcy cams or compatible hardware. Become familiar with the following technologies so you can run your applications.

### Eclipse ioFog

## Preparing your Darcy cam for your own application

* Get the Eclipse ioFog command line tool called **iofogctl**
* Connect to your Edge Compute Network \(ECN\) using iofogctl
* Stop \(undeploy\) any currently running Darcy applications, such as the Darcy AI SDK demo application that shipped with your Darcy cam

## Sequence of build steps

* Add the Darcy AI SDK to your Python code
* Add any other libraries or modules you need such as OpenCV or Numpy
* Complete your Python code
* SSH into your Darcy cam
* Add your Python code to a folder on your Darcy cam
* Add a Dockerfile to your folder
* Add any additional files you need in your application, such as AI models or images or video files
* Build your Docker container
* Run your Docker container to test
* Create your application deployment YAML file
* Add your Docker container to Docker Hub \(optional\)
* Use iofogctl to deploy your application
* Deploy your application to any number of additional Darcy cams you own

## Where To Go Next

* [Dockerfile for Darcy AI applications walkthrough](dockerfile.md)
* [Darcy AI SDK documentation](ai-sdk.md)
* [Darcy developer API documentation](apis.md)
* [Links to helpful developer resources](../helpful-resources.md)
* [Darcy terms of use for developers](darcy-terms-of-use.md)

