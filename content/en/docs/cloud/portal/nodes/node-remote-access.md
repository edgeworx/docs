---
title: "Remotely Access Your Node"
weight: 70
---

Once your node is installed and connected to Darcy Cloud, you'll be able to remotely access it using
the Darcy Cloud portal and/or [edgectl](../../get-started-edgectl/).

## Prerequisites

To access your node, you will need an Darcy Cloud account with at least one node accessible
and `ONLINE` and some knowledge of `SSH` commands.

## SSH into Your Node

In the portal, click on any node to access the node's detail page.

![Node Detail Page](/images/7done.png)

From here, click on the `SSH` button. This will open a new tab in your browser, after a small
loading time, you'll have access to a terminal on your node.

![SSH Terminal Page](</images/Screen Shot 2022-04-08 at 1.36.50 PM.png>)

{{< alert >}} You can also access the SSH shortcut from the project overview page by
clicking the 3 dots to the right of your node and selecting `SSH` from the drop down menu {% endhint
%}

Once your node is deployed, you're ready to deploy
the [Heart Rate Demo Application](../heart-rate-application/#about-the-heart-rate-demo-app).
