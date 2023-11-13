---
title: "Remotely access your node"
weight: 700
---

Once your [node](../cloud/adding-nodes/_index.md) is installed and connected to [Edgeworx Cloud](/docs/guides/start-portal), you'll be able to remotely access it using
the Edgeworx Cloud portal and/or [edgectl]({{<ref "/docs/cloud/edgectl">}}).

## Prerequisites

To access your node, you will need an Edgeworx Cloud account with at least one node accessible
and `ONLINE` and some knowledge of `SSH` commands.

## SSH into Your Node

In the portal, click on any node to access the node's detail page.

![Node Detail Page](/images/app_details_empty.png)

From here, click on the `SSH` button. This will open a new tab in your browser, after a small
loading time, you'll have access to a terminal on your node.

![SSH Terminal Page](</images/ssh_terminal_cropped.png>)

{{<info>}}You can also access the SSH shortcut from the [project](/docs/more/terminology#project) overview page by
clicking the 3 dots to the right of your node and selecting `SSH` from the drop down menu.
{{</info>}}
