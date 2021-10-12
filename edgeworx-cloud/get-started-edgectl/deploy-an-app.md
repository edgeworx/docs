# Deploy an App

Once we have edge nodes in our project, we can deploy applications to run on those nodes.

To see all available commands pertaining to edge applications, we can run the following:

```
edgectl app --help
```

To deploy edge applications, we use the `deploy` subcommand. We can run the following to learn how it works:

```
edgectl app deploy --help
```

The `app deploy` command requires a path to a `YAML` file to be specified. This `YAML` file defines everything about our edge application that is required to deploy it.

The following section will go into detail about application `YAML` files.
