# Add an Edge Node

In order to start deploying applications via Edgeworx Cloud, you must add nodes to your edge project. Nodes can be an edge device such as a [Raspberry Pi ](https://www.raspberrypi.com)or an [NVIDIA Jetson](https://www.nvidia.com/en-us/autonomous-machines/jetson-store/). They can also be VMs in the Cloud or a [Vagrant](https://www.vagrantup.com) image running on your laptop. Basically any type of computer that you want to connect to your Edge project.&#x20;

## Prerequisites <a href="#prereqs" id="prereqs"></a>

To add a node to your project, you will be running a command line script. For this we assume you have `ssh` or console access to your node and are using a common shell, such as `zsh` or `bash`. Additionally, the installation script by default will need to run as `sudo` to register the necessary services to be automatically started after the node is rebooted.

### Supported Hardware

* Raspberry Pi 3 & 4 (running Raspbian)
* Intel NUC (running Ubuntu OS)
* Google Coral Dev Boards (running Mendel Linux)

### Supported Operating Systems

* Raspbian Buster
* Ubuntu 16.04+
* Debian 10+

{% hint style="info" %}
If you do not have any of the above hardware, you can create a VM and run the node installation script.
{% endhint %}

## Get the Node Installation Script

Log into [Edgeworx Cloud](http://cloud.edgeworx.io) and select the project to which you want to add the node.&#x20;

![Edgeworx Cloud: "Project" page](../../.gitbook/assets/screen-shot-2021-10-08-at-5.59.22-pm.png)

Click the `+ ADD NODE` button located in the panel on the left of the view. This will bring up a modal dialog which shows the one line command that must be run on your host for it to become a node in your edge project.

![Edgeworx Cloud: "Add Node" modal](../../.gitbook/assets/screen-shot-2021-10-08-at-9.07.24-pm.png)

Click the `COPY` button to copy the install command to your clipboard.

## Run the Node Installation Script

SSH onto your host (or log in via the console) with a user that is in the sudo group.

![Example console install](../../.gitbook/assets/screen-shot-2021-10-08-at-9.10.48-pm.png)

Paste the command line that you copied in step 2 into your terminal. Hit enter. The entire install process can take up to a few minutes (depending on the spec of your node, your internet connection speed and other dependencies).&#x20;

![Example install output](../../.gitbook/assets/screen-shot-2021-10-08-at-9.30.52-pm.png)

If everything works you should see output similar to that above.

{% hint style="warning" %}
If you get errors, check the output or you can view the install log in `/tmp/ewc_logs.txt` for more clues as to the error. You could also try running `sudo apt update`.
{% endhint %}

## View the node in your Edge project

Switch back to your browser and if you have not, click the `DONE` button in the modal dialog. ULtimately you should see your new node `ONLINE` in your Nodes list.&#x20;

![](../../.gitbook/assets/screen-shot-2021-10-08-at-9.37.11-pm.png)

{% hint style="info" %}
A node can be in one of these states:

* `INITIALIZING`: The node is briefly in this state when first created.
* `INSTALLING`: Software is being installed or updated on the node.
* `ONLINE`: The happy state: Edgeworx Cloud is receiving heartbeats from the node and services are reachable.
* `DEGRADED`: At least one of the node's services is not behaving as expected.
* `UNREACHABLE`: This means that Edgeworx Cloud has not received a heartbeat from the node in some time, and all services seem inaccessible. This could happen due to network outages, or if the node has been shut down, frozen, or otherwise disabled.
{% endhint %}

You now have an edge node, let's start using it!
