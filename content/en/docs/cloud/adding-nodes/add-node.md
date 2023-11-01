---
title: "Add an edge node"
weight: 400
aliases:
  - /edgeworx/edgeworx-cloud/get-started-ec/nodes/get-started-add-node
---
<!-- TODO: Replace screenshots -->
To add a [node](../adding-nodes/_index.md) to your [project](/docs/more/terminology#project), you will be running a command line script. For this we assume you
have SSH or console access to your node and are using a common shell, such as zsh or bash.
Additionally, the installation script by default will need to run as sudo to register the necessary
services to be automatically started after the node is rebooted.

Add nodes using the Edgeworx Portal UI or terminal commands via [edgectl](../edgectl)

## Add a node using Edgeworx Cloud Portal

### Get the node Install script

Log into [Edgeworx Cloud](https://cloud.edgeworx.io) and select the project you want to [add the node](../../more/terminology#node-install-script).

![Add Node](/images/add-node.png)

Click the `+ ADD NODE` button. This will bring up a modal dialog which shows all the types of nodes you could add in your project.

![Register Node Script](/images/select-node-type.png)

Click on `EDGE NODE`. This will bring up a modal dialog which shows the one line command that must be run on your
host for it to become a node in your edge project.

![Register Node Script](/images/add-edge-node.png)

Click the `COPY` button to copy the install command to your clipboard.

### Run the node Install script

SSH into the device using a user with sudo privileges or SSH via Cloud Portal.

Paste the install script that you copied in the previous step into your terminal.
The entire install
process can take up to a few minutes (depending on the spec of your node, your internet connection
speed, and other dependencies).

![Install Node](/images/edge-node-added.png)

{{<info>}}
If you would like to choose a specific name for your node, use the
variable `Edgeworx_NODE_NAME="your-choice-of-name"` in the node install script
as in the example below.
{{</info>}}

### View the node in Your Edgeworx Cloud Project

Switch back to your project and if you have not done so yet, click the `DONE` button in the modal dialog. You
should see your new node `ONLINE` in your nodes list.

![Node Added](/images/1st-node-added.png)

## Add a node using edgectl

If you do not have edgectl, open the hamburger menu in the top right of the portal and click the `Get the CLI` link. A modal will appear with a script Linux, MacOS, and Windows.

Once you log into your account via the CLI, set your default Org and Project and run the below command to view any nodes in the project.

```bash
edgectl login 
edgectl set default org xxxxxx 
edgectl set default project xxxxxx
## Replace x's with your appropriate Org and Project name
```

Get the node install script using the below command:

```bash
edgectl get node-register-script
```

We can use the output of that command on our edge devices to install Edgeworx Agent and connect to your Edgeworx
Cloud Project. This command can be used any number of times on different devices to grow the
respective project's node pool.

If you wish view the raw contents of the node install script:

```bash
edgectl project node-install-script --show-script --text
```

This is helpful if you wish to review or debug the installation procedure.

As the install script runs, you will see it's progress as it install dependencies.

```bash
pi@raspberrypi:~ $ curl -s https://ecj_vfsdasdasdxaeaeh2kskkv301e9f0ip@api.edgeworx.io/v1/project/b7asdasdas-e3f-4808-a992-0811e077d783/node-install-script | sudo bash
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

If the script fails during install of dependencies, the script will return that it encountered an error and present the path of a generated log file for debugging.
