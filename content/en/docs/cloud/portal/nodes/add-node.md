---
title: "Add Node"
weight: 60
aliases:
  - /darcy/darcy-cloud/get-started-ec/nodes/get-started-add-node
---

Once we have a compatible edge device set up, we can connect that device as a node to a Darcy Cloud
project via the platform.

## Get the Node Installation Script

Log into [Darcy Cloud](https://cloud.darcy.ai) and select the project to which you want to add the
node.

![Add Node](/images/add-node.png)

Click the `+ ADD NODE` button. This will bring up a modal dialog which shows the one line command
that must be run on your host for it to become a node in your edge project.

![Register Node Script](/images/darcy-install-script.png)

Click the `COPY` button to copy the install command to your clipboard.

## Run the Node Installation Script

SSH onto your host (or log in via the Cloud Portal) with a user that is in the `sudo` group.

Paste the command line that you copied in the previous step into your terminal.
The entire install
process can take up to a few minutes (depending on the spec of your node, your internet connection
speed, and other dependencies).

![Install Node](/images/node1-installed.png)

{{<alert>}}
  If you would like to choose a specific name for your node, use the
  variable `DARCY_NODE_NAME="your-choice-of-name"` in the _node install script_
  as in the example below.
{{</alert>}}

## View the Node in Your Darcy Cloud Project

Switch back to your browser and if you have not done so yet, click the `DONE` button in the modal dialog. You
should see your new node `ONLINE` in your Nodes list. If you do not see your node online, check our
Troubleshooting page for more information.

![Node Added](/images/1st-node-added.png)

You now have an edge node, let's start using it!
