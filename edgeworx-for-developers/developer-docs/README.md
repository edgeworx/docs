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

You will use Docker commands on the Linux command line prompt to build your Darcy AI application containers. The Docker command line tools are already installed in your Darcy cam so you can just follow the instructions here in this documentation. If you want to learn more about Docker and the commands you will be using, you can go here [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/).

### TensorFlow Lite AI models (optional)

Darcy gives you an immense amount of AI functionality and performance automatically, but you can also optionally add your own AI models and Darcy will make them part of her operation. If you want to add your own AI models or change the AI models that Darcy uses, you will need to produce a TensorFlow Lite \(.tflite) file as your final format to include in your Darcy AI application.

You can learn more about TensorFlow and specifically TensorFlow Lite by starting here [https://www.tensorflow.org/lite](https://www.tensorflow.org/lite).

### DevicePlane remote command line access

To execute the container build steps for your Darcy AI application, you will need a build environment that contains the proper software tools and is capable of producing a container with the correct CPU architecture. Your Darcy cam has everything you need already setup.

Use DevicePlane to connect to the command line of your Darcy cam securely from anywhere. You can use the DevicePlane cloud UI to access your Darcy cam immediately using the credentials you were provided. Command line tools for DevicePlane are also available if you prefer.

You can learn more about DevicePlane here [https://deviceplane.com/](https://deviceplane.com/) or simply login to the DevicePlane cloud portal with your credentials at [https://cloud.deviceplane.com/login](https://cloud.deviceplane.com/login).

## What you use to deploy your application

Once you have built your application, you need to deploy it into one or more Darcy cams or compatible hardware. Become familiar with the following technologies so you can run your applications.

### Eclipse ioFog

Your Darcy cam uses an edge computing platform called Eclipse ioFog to operate and to provide remote management. You can use ioFog to view the status of your Darcy cam and your Darcy AI applications from anywhere. You will use ioFog to deploy and manage Darcy AI applications with a tool called **iofogctl**.

You can learn about Eclipse ioFog here [https://iofog.org](https://iofog.org) and install the iofogctl tool here [https://iofog.org/docs/2/iofogctl/download.html](https://iofog.org/docs/2/iofogctl/download.html).

## Preparing your Darcy cam for your own application

If your Darcy cam is currently running a demo application or any other application, you will need to remove that application before you can deploy your own. Although your Darcy cam is capable of running many edge applications simultaneously, only one Darcy AI application can be running on a single Darcy cam at a time.

Follow the steps below to view the list of running applications \(if any\) and undeploy them so your Darcy cam is ready for a new one.

### Get the Eclipse ioFog command line tool called iofogctl

If you have not already installed the **iofogctl** command line tool, install it now. Instructions can be found here [https://iofog.org/docs/2/iofogctl/download.html](https://iofog.org/docs/2/iofogctl/download.html).

This tool is used to manage the edge applications on your Darcy cam. You can use iofogctl to deploy, undeploy, start, stop, configure, and update applications from anywhere. 

### Connect to your Edge Compute Network \(ECN\) using iofogctl

Your Darcy cam shipped with credentials for accessing and managing your edge compute network \(ECN\). Find these credentials so you can use them now. They may have been provided in an email or an insert with your Darcy cam packaging.

Use iofogctl to connect to your ECN. The command looks like the following, except you will need to insert your own values for the placeholders that are in all CAPS.

```
iofogctl connect --ecn-addr YOUR_ECN_HOST_INFO --name controller --email YOUR_ECN_ACCESS_EMAIL --pass YOUR_ECN_ACCESS_PASSWORD
```
After you execute this command, you should see a success message indicating that you are now connected to your ECN. You only need to execute the `iofogctl connect` command once because iofogctl will store your access until you explicitly tell it to disconnect.

### View the status of your Darcy cam on your ECN

sdfdsfsf

### Stop \(undeploy\) any currently running Darcy applications

such as the Darcy AI SDK demo application that shipped with your Darcy cam

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

