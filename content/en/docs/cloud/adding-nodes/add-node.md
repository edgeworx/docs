---
title: "Add an edge node"
weight: 400
aliases:
  - /darcy/darcy-cloud/get-started-ec/nodes/get-started-add-node
---
<!-- TODO: Replace screenshots -->
To add a [node](../adding-nodes/_index.md) to your [project](/docs/more/terminology#project), you will be running a command line script. For this we assume you
have ssh or console access to your node and are using a common shell, such as zsh or bash.
Additionally, the installation script by default will need to run as sudo to register the necessary
services to be automatically started after the node is rebooted.

Add nodes using the Edgeworx Portal UI or terminal commands via [edgectl](../edgectl)

## Add a node using Edgeworx Cloud Portal

### Get the node Install script

Log into [Edgeworx Cloud](https://cloud.edgeworx.io) and select the project to which you want to [add the node](../../more/terminology#node-install-script).

![Add Node](/images/add-node.png)

Click the `+ ADD NODE` button. This will bring up a modal dialog which shows all the type of node you could add in your project.

![Register Node Script](/images/select-node-type.png)

Click on `EDGE DEV BOARD (LINUX)` This will bring up a modal dialog which shows the one line command that must be run on your
host for it to become a node in your edge project.

![Register Node Script](/images/add-edge-node.png)

Click the `COPY` button to copy the install command to your clipboard.

### Run the node Install script

SSH onto your host (or log in via the Cloud Portal) with a user that is in the `sudo` group.

Paste the command line that you copied in the previous step into your terminal.
The entire install
process can take up to a few minutes (depending on the spec of your node, your internet connection
speed, and other dependencies).

![Install Node](/images/edge-node-added.png)

{{<info>}}
If you would like to choose a specific name for your node, use the
variable `Edgeworx_NODE_NAME="your-choice-of-name"` in the _node install script_
as in the example below.
{{</info>}}

### View the node in Your Edgeworx Cloud Project

Switch back to your browser and if you have not done so yet, click the `DONE` button in the modal dialog. You
should see your new node `ONLINE` in your Nodes list. If you do not see your node online, check our
Troubleshooting page for more information.

![Node Added](/images/1st-node-added.png)

You now have an edge node, let's start using it!

## Add a node using edgectl

In [Edgeworx Cloud](/docs/cloud/start-portal), nodes are edge devices that run Edgeworx Agents. Ultimately, we want to deploy
[applications](/docs/more/terminology#application) to these nodes to put them to work.

If we list nodes in our default [organization](/docs/more/terminology#account--org) and project, we will notice that we have no nodes:

```bash
edgectl get nodes
```

In order to deploy nodes, we must get the node install script. You can use this command to get a
shell snippet that you can execute on the node:

```bash
$ edgectl get node-register-script -t
curl -s https://ecj_vfsw9wess5kheafxaeaeh2kskkv301e9f0ip@api.edgeworx.io/v1/project/b75676cb-ae3f-4808-a992-0811e077d783/node-install-script | sudo bash
```

We can use this shell snippet on our edge devices to install Edgeworx Agent and connect to our Edgeworx
Cloud Project. This command can be used any number of times on different devices to grow the
respective project's node pool.

If you wish view the raw contents of the node install script:

```bash
edgectl project node-install-script --show-script --text
```

This is helpful if you wish to review or debug the installation procedure.

### Example

First, get the node-install-script shell snippet, and copy it to the clipboard:

```bash
$ edgectl get node-install-script -t
curl -s https://ecj_vfsw9wess5kheafxaeaeh2kskkv301e9f0ip@api.edgeworx.io/v1/project/b75676cb-ae3f-4808-a992-0811e077d783/node-install-script | sudo bash
```

Then `SSH` into your node (in this case, a Raspberry Pi):

```bash
$ ssh pi@raspberrypi.local
pi@raspberrypi.local's password: ********
Linux raspberrypi 5.10.94-v8+ #1518 SMP PREEMPT Thu Jan 27 14:55:19 GMT 2022 aarch64

Last login: Wed Feb 23 19:26:53 2022
pi@raspberrypi:~ $
```

Then paste the node install script shell snippet at the Pi terminal. This installs the necessary
Edgeworx Cloud components, and connects your node to Edgeworx Cloud.

```bash
pi@raspberrypi:~ $ curl -s https://ecj_vfsw9wess5kheafxaeaeh2kskkv301e9f0ip@api.edgeworx.io/v1/project/b75676cb-ae3f-4808-a992-0811e077d783/node-install-script | sudo bash
Installing Edgeworx Agent
１ Initializing
      ✔ Package manager updated
２ Performing preflight checks
    ▶ Checking for dependencies
      ✔ curl found
      ✔ jq found
      ✔ java found
      ✔ docker found
３ Verifying node state
      ✔ Detected Linux distribution: debian
      ! Adding this node to a new project will leave a dangling node in the old project: neil/proj1/raspberrypi14511447b32329f25b77.
      ! Make sure to migrate any microservices that were running on it, then delete it. E.g. `edgectl node remove neil/proj1/raspberrypi14511447b32329f25b77`
      ✔ Node name raspberrypie1c0fe7939883f228946 is valid
      ✔ Node name raspberrypie1c0fe7939883f228946 is available
      ✔ Node is ready for installation
４ System finger print
    ▶ Shell
      ∙ Exec:       /bin/bash
      ∙ User:       root
    ▶ Host
      ∙ Hostname:   raspberrypi
      ∙ OS Release: Debian GNU/Linux 11 (bullseye)
      ∙ Kernel:     Linux raspberrypi 5.10.94-v8+ #1518 SMP PREEMPT Thu Jan 27 14:55:19 GMT 2022 aarch64 GNU/Linux
    ▶ System
      ∙ CPUs:       4
      ∙ Memory:     5.5Gi
      ∙ Storage:    9.5G/118G (9%)
５ Installing services
    ▶ Edgeworx agent
      ✔ Edgeworx Cloud Node created
      ✔ GPG found
      ✔ Edgeworx Agent installed
    ▶ Deviceplane
      ✔ Deviceplane Agent registered
      ✔ Deviceplane Agent configured
    ▶ ioFog Agent
      ✔ Scripts downloaded
      ✔ Ready to install
      ✔ Docker installed
      ✔ Java installed
      ✔ ioFog Agent installed
      ✔ ioFog Agent registered
      ✔ ioFog Agent provisioned
６ SUCCESS
      ✔ You can view this Agent in your Edgeworx Cloud project here: https://cloud.edgeworx.io/alice/edge-project-1/node/raspberrypie1c0fe7939883f228946
      ✔ To uninstall, execute `sudo /opt/edgeworx/uninstall.sh`
```

Note the final two lines: The first line provides a link to view your node in the Edgeworx Cloud web
portal. The final line provides a command to uninstall the software and detach the node from Edgeworx
Cloud.

Now that we have our node connected to Edgeworx Cloud, we can install an application to that node.
