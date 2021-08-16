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

If your Darcy cam is currently running a demo application or any other application, you will need to remove that application before you can deploy your own. Although your Darcy cam is capable of running many different types of edge applications simultaneously, only one **Darcy AI** edge application can be running on a single Darcy cam at a time.

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

Once you have used iofogctl to connect to your ECN, you can use other iofogctl commands to view information or take actions. The command that displays all of the status information for your ECN is below.

```
iofogctl get all
```

Execute this command and you should see output similar to the following.

```
NAMESPACE
default

CONTROLLER STATUS		AGE		UPTIME		VERSION		ADDR  		PORT		
controller online  -  8d16h		2.0.3  customer.caas.edgeworx.io    51121		

AGENT			STATUS		AGE		UPTIME		VERSION		ADDR			
customer-darcy-1	RUNNING		82d1h		7d10h		2.0.6		customer-darcy-1	

APPLICATION	RUNNING		MICROSERVICES		
ai-sdk-1	1/1		darcy-sdk-example-1	

MICROSERVICE		STATUS		AGENT			VOLUMES		PORTS		
darcy-sdk-example-1	RUNNING		customer-darcy-1	/dev:/dev	3456:3456	

VOLUME		SOURCE		DESTINATION	PERMISSIONS	AGENTS		

ROUTE		SOURCE MSVC	DEST MSVC
```

Under the section labeled `AGENT` you should see your Darcy cam listed. If you have more than one Darcy cam, they should all be listed here.

You can find the list of all deployed edge applications listed under the `APPLICATION` section. If there are no listed applications, you do not need to perform the next step. There are currently no deployed applications on your Darcy cam and you can go ahead and proceed to building and deploying your own Darcy AI application below.

If there are applications listed, find the name of the application for your Darcy cam. In the example above, it is `ai-sdk-1`. You will use this name to tell iofogctl to undeploy the application in the next step.

### Stop \(undeploy\) any currently running Darcy applications

Use the name of the application that is currently running on your Darcy cam to tell iofogctl to remove it. Using the example name from above, the command is as follows.

```
 iofogctl delete application ai-sdk-1
```

The command should complete with a success message. If your Darcy cam is currently running, it should stop running the application you just removed within a minute or two if not much sooner. If your Darcy cam is not currently running, it will receive the instructions to remove the application the next time it is running.

Your Darcy cam should now have no applications running and should be in the proper condition for deploying a new Darcy AI application. You can verify the absence of any applications by using the `iofogctl get all` command that you used previously.

## Sequence of build steps

For your first experience building a Darcy AI application, it will be helpful to follow these steps. After you have some experience, you will probably find many ways to optimize your build process and make it your own. The steps here are key to completing and deploying an application and will outline all of the important parts for you. Any alternative approaches to accomplishing these steps should also work. 

### Add the Darcy AI SDK to your Python code

Create a new Python script if you do not already have one open. At the top of the file, add the `import` line for the Darcy AI SDK.

```
from darcyai import DarcyAI
```

This will make the Darcy AI SDK functionality available in your code under an object called `DarcyAI`.

### Add any other libraries or modules you need such as OpenCV or Numpy

Add `import` statements for any other libraries you intend to use. Here are some recommended imports.

```
import cv2
import numpy
```

### Complete your Python code

Use the Darcy AI SDK documentation here [Darcy AI SDK documentation](ai-sdk.md) and the code examples here [https://github.com/Edgeworx/darcyai/blob/main/src/examples/people_perception.py](https://github.com/Edgeworx/darcyai/blob/main/src/examples/people_perception.py) to complete your Python code. For your first Darcy AI application, it is recommended that you complete all of the build steps with a simple amount of custom code in order to become familiar with the process. You may find it easiest to simply copy the example code at the link above and build your first application with only some modifications.

Save your Python code file but keep it open. You may find it easiest to copy and paste the code in the next steps.

### SSH into your Darcy cam

You will need to open a command line session on your Darcy cam for the remaining steps. This is because you are going to use your Darcy cam as your container build environment. You can also set up your own build environments, but for your first experience it is easiest to use your Darcy cam because it has everything you need already installed and configured.

To open an command line session, you will connec to your Darcy cam via SSH. The easiest method is to use the SSH web UI offered in the DevicePlane cloud portal. You have received your DevicePlane credentials in either an email or an insert in your Darcy cam packaging. You should be able to find it in the same place as your ECN credentials.

Visit the DevicePlane cloud portal here [https://cloud.deviceplane.com/login](https://cloud.deviceplane.com/login) and log in.

Make sure your Darcy cam is powered on and connected to the internet. Your Darcy cam should be listed in the DevicePlane portal and should show the status `ONLINE`. Click on the name of your Darcy cam. On the next screen, you should see a button toward the upper-right labeled `SSH`. Click on that button to open a new browser tab with an active SSH session.

You should see a command line interface with the prompt `root@customer-darcy-1:/#` where the name of your Darcy cam is displayed instead of `customer-darcy-1`.

### Add your Python code to a folder on your Darcy cam

You will need to create a build folder for your application. Your SSH session is a standard Linux command line session. Use the following command to make a new directory at the root of the file system that you will use to house your code and other files.

```
mkdir /myapp
```

Now change to that directory in order to add files using the following command.

```
cd /myapp
```

Your prompt should now display `root@customer-darcy-1:/myapp#` indicating that you are currently working in the proper directory.

Add your Python code to a new file that we will call `my_application.py` using the following command.

```
nano my_application.py
```

This will open a text editor window using the `nano` editor application. You can use any text editor you would like if you prefer something other than `nano`.

Highlight and copy your Python code and then paste it into the text editor window. Exit the text editor session and save your code by pressing `ctrl-x` and then pressing `y` and then pressing `enter` when you are prompted with the file name, which should be `my_application.py`.

Once you have exited the code editor, you can verify the existence of your Python file using the `ls -lh` command which should display output similar to below.

```
total 4.0K
-rw-r--r-- 1 root root 15 Aug 16 19:47 my_application.py
```

### Add a Dockerfile to your folder

Now that your Python code is in place, you will add a `Dockerfile` text file to the folder. You can follow the guide here [Dockerfile for Darcy AI applications walkthrough](dockerfile.md) if you have not yet created your `Dockerfile` or just copy and paste your own content if you have prepared it already.

Similar to pasting your Python code above, create a new file and open a text editor with the following command.

```
nano Dockerfile
```

And once you have completed the file, you should now see your Python file and your Dockerfile using the `ls -lh` command.

```
total 8.0K
-rw-r--r-- 1 root root 324 Aug 16 20:01 Dockerfile
-rw-r--r-- 1 root root  15 Aug 16 19:47 my_application.py
```

### Add any additional files you need in your application, such as AI models or images or video files



* Build your Docker container
* Create your application deployment YAML file
* Use iofogctl to deploy your application

## Where To Go Next

* [Dockerfile for Darcy AI applications walkthrough](dockerfile.md)
* [Darcy AI SDK documentation](ai-sdk.md)
* [Darcy developer API documentation](apis.md)
* [Links to helpful developer resources](../helpful-resources.md)
* [Darcy terms of use for developers](darcy-terms-of-use.md)

