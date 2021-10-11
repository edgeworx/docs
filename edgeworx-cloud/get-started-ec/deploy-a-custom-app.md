# Deploy a custom app



## 1. Prerequisites

To deploy your custom app, you will need an Edgeworx Cloud account with at least one node accessible and `ONLINE`. You will need a basic understanding of how to structure app YAML for Edgeworx Cloud. 

## 2. Deploy a custom app using the portal

1. Go to the portal project page
2. Select `Apps`
3. Click on `+ DEPLOY APP`
4. Drag n Drop a YAML file into the box
5. Et Voila!

![Edgeworx Cloud Portal: "Add App" modal](<../../.gitbook/assets/image (4).png>)

## 3. View your app details

Click on your app in the list of application to see its details.

![Edgeworx CLoud Portal: "App Detail" page](<../../.gitbook/assets/image (6).png>)

The application details page contains informations about its microservices, routes, the nodes involved in running the microservices and its YAML definition.

Edgeworx Cloud Portal allows you to edit your app YAML right in the browser.\
\
More informations about the Application YAML files can be found [here](../applications-doc/app-doc-yaml.md)

{% hint style="info" %}
Everything shown above using Edgeworx Cloud Portal can also be achieved using our CLI, edgectl. See [Getting Started: edgectl](../get-started-edgectl.md)
{% endhint %}
