---
title: "Add a Virtual Node"
weight: 450
---

With Virtual Node you can test pushing to an edge device even if you don't have one availabe. Adding a Virtual Node sets up a new Ubuntu VM locally and registers it as a node to a [Darcy Cloud](../../../more/terminology.md#darcy-cloud) [project](../../../more/terminology.md#project) via the [edgectl](../../edgectl/) CLI. Mac OSX and Windows users can create Virtual Nodes using Darcy Cloud Portal and edgectl. Linux users can directly use the register node command on their terminal.

### Prerequisites

* [Darcy Cloud Account (Free)](https://cloud.darcy.ai)
* [egectl CLI]({{<ref "/docs/cloud/start-edgectl.md">}})
* [Multipass](https://multipass.run)

{{< alert style="warning" >}}
Virtual Node is not currently compatible with attached video devices. You can still build locally using attached video and deploy to edge devices with attached video.
{{</alert>}}

## Get the Virtual Node Installation Script

Log into [Darcy Cloud](https://cloud.darcy.ai) and select the project to which you want to add the
node.

![Add Virtual Node](/images/add-node.png)

Click the `+ ADD NODE` button. This will bring up a modal dialog which shows the different types of nodes you can add to your project.

![Register Virtual Node Script](/images/select-virtual-node.png)

Choose `VIRTUAL NODE` to get the instructions for adding a virtual node.

![Virtual Node Script](/images/add-virtual-node.png)

Make sure you have the latest versions of [egectl]({{<ref "/docs/cloud/start-edgectl.md">}}) and [Multipass](https://multipass.run) installed. Click the `COPY` button to copy the command to your clipboard. This command starts an Ubuntu VM which register itself with Darcy
Cloud as a Virtual Node.

## Run the Virtual Node Registration Script

Paste the command line that you copied in the previous step into your terminal.
The entire install process can take up to a few minutes (depending on the spec of your machine, your internet connection speed, and other dependencies).

![Install Node](/images/virtual-node-added.png)

{{<alert>}}
If you would like to choose a specific name for your node, update the `--name="your-choice-of-name"` in the _edgectl create virtual-node_ command as seen in the above example.
{{</alert>}}

## View the Node in Your Darcy Cloud Project

Switch back to Darcy Cloud in your browser and if you have not done so yet, click the `DONE` button in the modal dialog. You should see your new node `ONLINE` in your Nodes list. If you do not see your node online, see troubleshooting (below) for more information.

![Node Added](/images/virtual-node-portal-view.png)

You now have an edge node, let's start using it!

## Delete a virtual node

We recommend using `edgectl delete virtual-node` command to delete the Virtual Node after use, so that all the resources used are cleaned up properly i.e. Ubuntu VM.

## Troubleshooting

<details>
  <summary>Unable to create virtual node with default values on Windows machine</summary>
    We can modify the default values based on our Windows machine spec. Below are the default values used to
spin up a multipass VM.
`edgectl create virtual-node name=darcy-node -c 1`
{{< highlight html>}}
-d, --disk    string   Disk space to allocate. Positive integers, in bytes, or with K, M, G suffix. Minimum: 512M, default: 15G.
-c, --cpus    string   Number of CPUs to allocate. Minimum: 1, default: 2.
-m, --mem     string   Amount of memory to allocate. Positive integers, in  bytes, or with K, M, G suffix. Minimum: 128M, default: 1G.
    --network string   Add a network interface to the instance, where <spec> is in the "key=value,key=value" format, with the following keys available:
                       name: the network to connect to (required), use the networks command for a list of possible values,
                       or use 'bridged' to use the interface configured via "multipass set local.bridged-network".
                       mode: auto|manual (default: auto) mac: hardware address (default: random).
                       You can also use a shortcut of "<name>" to mean "name=<name>"{{< /highlight >}}
</details>
<details>
  <summary>Used edgectl delete node command to delete virtual-node</summary>
Not an issue, we just have to manually delete the multipass VM using multipass delete command <i>multipass delete node-name --purge</i>.
</details>
<details>
  <summary>Unable to view the output from a Virtual Node (incorrect IP)</summary>
At the moment Virtual Node IP displayed on the portal is not correct. Therefore, we have to manually retrieve it using multipass command <i>multipass ls</i>.
</details>
<details>
  <summary>Unable to SSH into the Virtual Node after the machine went into idle state</summary>
There is an ongoing issue with internet sharing of virtual network when using multipass with Virtual Box driver.
https://www.virtualbox.org/ticket/14374?cversion=2&cnum_hist=66
</details>
<details>
  <summary>Unable to view attached video device in output</summary>
At the moment Virtual Node doesn't support mounting external cameras.
</details>
