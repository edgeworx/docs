# Developer Docs

To build your own computer vision and edge AI applications with Darcy, you need to make a Docker container that includes the Darcy AI SDK. The details of how to use the SDK are available using the link below. There is also a link for helpful resources that you can use to get familiar with the technologies that power Darcy and technologies that are important for computer vision and AI development.

## What you use to build

* Python 3 (any IDE is suitable)
* Darcy AI SDK (easily imported Python library)
* Docker command line tools (built into your Darcy cam)
* TensorFlow Lite AI models (optional if you want to add your own AI processing or change Darcy's base AI models)

## Preparing your Darcy cam for your own application

* Get the Eclipse ioFog command line tool called **iofogctl**
* Connect to your Edge Compute Network (ECN) using iofogctl
* Stop (undeploy) any currently running Darcy applications, such as the Darcy AI SDK demo application that shipped with your Darcy cam

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
* Add your Docker container to Docker Hub (optional)
* Use iofogctl to deploy your application
* Deploy your application to any number of additional Darcy cams you own

## Where To Go Next

* [Darcy AI SDK documentation](ai-sdk.md)
* [Darcy developer API documentation](apis.md)
* [Links to helpful developer resources](../helpful-resources.md)
* [Darcy terms of use for developers](darcy-terms-of-use.md)
