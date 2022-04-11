# Deploy Applications via EdgeCTL

If we prefer to deploy the Demo App via the command line as opposed to the Darcy Cloud platform, we can utilize EdgeCTL

{% hint style="info" %}
Before you begin, if you have previously deployed a Demo app via Darcy Cloud, you can either start a new project and add a node there, or delete the current application from the Darcy Cloud platform. We just need to be sure that we have a free node inside our project to deploy the demo app to from the command line
{% endhint %}

### View available commands

To see all available commands pertaining to edge applications, we can run the following:

```
edgectl app --help
```

### Deploy Application

To deploy edge applications, we use the deploy subcommand. We can run the following to learn how it works:

```
edgectl app deploy --help
```

The app deploy command requires a path to a YAML file to be specified. This YAML file defines everything about our edge application that is required to deploy it

The YAML files for demo applications can be retrieved from Darcy Cloud or from the [glossary](../glossary/) of this documentation

Once the demo app YAML file has been downloaded, you can run:

```
edgectl app deploy path_to_demo_app_file.yaml 
```

This will deploy the app to the default project that will be viewable from the Darcy Cloud platform
