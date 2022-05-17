---
title: "Add an Edge Node"
weight: 200
---

In Darcy Cloud, nodes are edge devices that run Edgeworx Agents. Ultimately, we want to deploy
applications to these nodes to put them to work.

If we list nodes in our default organization and project, we will notice that we have no nodes:

```
edgectl get nodes
```

In order to deploy nodes, we must get the node install script. You can use this command to get a
shell snippet that you can execute on the node:

```
$ edgectl get node-install-script -t
curl -s https://ecj_vfsw9wess5kheafxaeaeh2kskkv301e9f0ip@api.darcy.ai/v1/project/b75676cb-ae3f-4808-a992-0811e077d783/node-install-script | sudo bash
```

We can use this shell snippet on our edge devices to install Edgeworx Agent and connect to our Darcy
Cloud Project. This command can be used any number of times on different devices to grow the
respective project's node pool.

If you wish view the raw contents of the node install script:

```
edgectl project node-install-script --show-script --text
```

This is helpful if you wish to review or debug the installation procedure.

#### Example

First, get the node-install-script shell snippet, and copy it to the clipboard:

```
$ edgectl get node-install-script -t
curl -s https://ecj_vfsw9wess5kheafxaeaeh2kskkv301e9f0ip@api.darcy.ai/v1/project/b75676cb-ae3f-4808-a992-0811e077d783/node-install-script | sudo bash
```

Then `SSH` into your node (in this case, a Raspberry Pi):

```
$ ssh pi@raspberrypi.local
pi@raspberrypi.local's password: ********
Linux raspberrypi 5.10.94-v8+ #1518 SMP PREEMPT Thu Jan 27 14:55:19 GMT 2022 aarch64

Last login: Wed Feb 23 19:26:53 2022
pi@raspberrypi:~ $
```

Then paste the node install script shell snippet at the Pi terminal. This installs the necessary
Darcy Cloud components, and connects your node to Darcy Cloud.

```
pi@raspberrypi:~ $ curl -s https://ecj_vfsw9wess5kheafxaeaeh2kskkv301e9f0ip@api.darcy.ai/v1/project/b75676cb-ae3f-4808-a992-0811e077d783/node-install-script | sudo bash
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
      ✔ Darcy Cloud Node created
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
      ✔ You can view this Agent in your Darcy Cloud project here: https://cloud.darcy.ai/alice/edge-project-1/node/raspberrypie1c0fe7939883f228946
      ✔ To uninstall, execute `sudo /opt/edgeworx/uninstall.sh`
```

Note the final two lines: The first line provides a link to view your node in the Darcy Cloud web
portal. The final line provides a command to uninstall the software and detach the node from Darcy
Cloud.

Now that we have our node connected to Darcy Cloud, we can install an application to that node.
