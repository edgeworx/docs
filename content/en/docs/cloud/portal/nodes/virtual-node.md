---
title: "Add a Virtual Node"
weight: 70
---

Don't have a compatible edge device set up not an issue, for `MACOSX` and `WINDOWS` user we can set up a new Ubuntu VM locally, and register that VM as a node
to a Darcy Cloud project via the edgectl CLI. `LINUX` user can directly use the register node command on their terminal.

## Prerequisites

* Edgectl CLI
* [Multipass](https://multipass.run)

## Get the Virtual Node Installation Script

Log into [Darcy Cloud](https://cloud.darcy.ai) and select the project to which you want to add the
node.

![Add Virtual Node](/images/add-node.png)

Click the `+ ADD NODE` button. This will bring up a modal dialog which shows all the type of node you could add in your project.

![Register Virtual Node Script](/images/select-virtual-node.png)

Click on `VIRTUAL NODE` to get the instructions of adding a virtual node.

![Virtual Node Script](/images/add-virtual-node.png)

Click the `COPY` button to copy the command to your clipboard. This command starts an Ubuntu VM which register itself with Darcy
Cloud as a Virtual Node.

## Run the Virtual Node Registration Script

Paste the command line that you copied in the previous step into your terminal.
The entire install process can take up to a few minutes (depending on the spec of your machine, your internet connection
speed, and other dependencies).

![Install Node](/images/virtual-node-added.png)

{{<alert>}}
If you would like to choose a specific name for your node, update the `--name="your-choice-of-name"` in the _edgectl create virtual-node_
command as in the above example.
{{</alert>}}

## View the Node in Your Darcy Cloud Project

Switch back to your browser and if you have not done so yet, click the `DONE` button in the modal dialog. You
should see your new node `ONLINE` in your Nodes list. If you do not see your node online, check our
Troubleshooting page for more information.

![Node Added](/images/virtual-node-portal-view.png)

You now have an edge node, let's start using it!

## Delete Virtual Node

We recommend to use `edgectl delete virtual-node` command to delete the Virtual Node after use for cleaning up all the resources used i.e. Ubuntu VM.
