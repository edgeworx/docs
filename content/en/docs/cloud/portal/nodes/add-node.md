---
title: Add Node
date: 2020-10-06T08:49:31+00:00
draft: false
weight: 200
---


Once we have a compatible edge device set up, we can connect that device as a node to a Darcy Cloud project via the platform

## Get the Node Installation Script

Log into [Darcy Cloud](https://cloud.darcy.ai/welcome) **** and select the project to which you want to add the node

![](../../../assets/add-node.png)

![](../../../assets/2done.png)

Click the `+ ADD NODE` button. This will bring up a modal dialog which shows the one line command that must be run on your host for it to become a node in your edge project

![](../../../assets/darcy-install-script.png)

![](../../../assets/add-node-install-script.png)

Click the `COPY` button to copy the install command to your clipboard

## Run the Node Installation Script

SSH onto your host (or log in via the console) with a user that is in the sudo group

![](../../../assets/node1-installscript.png)

![Console Install Example](<../../../assets/Screen Shot 2022-04-08 at 1.30.56 PM.png>)

![](../../../assets/node1-installed.png)

{% hint style="info" %}
If you would like to use `a specific` name for your node, use the variable `NODE_NAME="your-choice-of-name"` in the node install script like in the example below
{% endhint %}

![Console Install with Custom Name Example](<../../../assets/Screen Shot 2022-04-08 at 1.31.39 PM.png>)

Paste the command line that you copied in step 2 into your terminal. Hit enter. The entire install process can take up to a few minutes (depending on the spec of your node, your internet connection speed, and other dependencies).&#x20;

![](../../../assets/1st-node-added.png)

![Console Install Example Output](../../../assets/1-node-installed.png)

If you would like to use your own name for the node use the variable `NODE_NAME="your-choice-of-name"` in the node install script. SSH onto your host (or log in via the console) with a user that is in the sudo group.

If everything works you should see output similar to that above

![](../../../assets/node2-installscript.png)

Paste the command line that you copied in step 2 into your terminal. Hit enter. The entire install process can take up to a few minutes (depending on the spec of your node, your internet connection speed and other dependencies)

## View the Node in Your Edge Project

Switch back to your browser and if you have not, click the `DONE` button in the modal dialog. You should see your new node `ONLINE` in your Nodes list. If you do not see your node online, check our Troubleshooting page for more information

![](../../../assets/node2-installed.png)

![Active Node](<../../../assets/1-node-added (1).png>)

If everything works you should see output similar to that above

![](../../../assets/2-node-added.png)

{% hint style="info" %}
If you run into any errors, you can either check the output or view the install log in `/tmp/ewc_logs.txt`. You could also try running `sudo apt update`
{% endhint %}

You now have an edge node, let's start using it!
