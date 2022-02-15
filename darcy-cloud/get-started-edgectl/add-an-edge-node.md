# Add an Edge Node

In Edgeworx Cloud, nodes are edge devices that run Edgeworx Agents. Ultimately, we want to deploy applications to these nodes to put them to work!

To see all available commands pertaining to edge nodes, we can run the following:

```
edgectl node --help
```

If we list nodes in our default organization and project, we will notice that we have no nodes:

```
edgectl node list
```

In order to deploy nodes, we must get the node installation script:

```
edgectl project node-install-script
```

This will output `json` containing a command within a `data` field. We can use this command on our edge devices to install Edgeworx Agent and connect to our Edgeworx Cloud Project. This command can be used any number of times on different devices to grow the respective project's node pool.

We can also get a human-readable version of the installation script by running the following:

```
edgectl project node-install-script --show-script --text
```

This is helpful if we wish to review or debug the installation procedure.
