# Add Node via EdgeCTL

Some developers prefer to work through the command line, and it is possible to deploy a node to the Darcy Cloud from the command line utilizing EdgeCTL

### View Available Commands

To see all available commands pertaining to edge nodes, we can run the following:

```
edgectl node --help
```

### List Nodes

If we haven’t created a node via Darcy Cloud yet, then the first time we list nodes in our default organization and project we will notice that we have no nodes:

```
edgectl node list
```

### Deploying a Node

In order to deploy nodes, we must start by getting the node installation script:

```
edgectl project node-install-script
```

This command will output a json specific to the default project. If you need to install a node to a different project, you can utilize the same command with the --project flag. The flag can be a UUID or the directory, like in the example below:

```
# List nodes in "proj1" in the "acme" org. 
edgectl node ls --project acme/proj1

# List nodes in project having uuid
edgectl node ls --project 6d154556-9e58-4330-a7f3-41c869f01142
```

The json output will contain a command within a data field. We can run this command directly on our edge devices to install the Darcy Agent on the device, and to connect the device to our Darcy Cloud project. This command can be used any number of times on different devices to grow the respective project's node pool.

We can also get a human-readable version of the installation script by running the following:

```
edgectl project node-install-script --show-script --text
```

This is helpful if we wish to review or debug the installation procedure
