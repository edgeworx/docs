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

The `app deploy` command requires a path to a `YAML` file to be specified. This `YAML` file defines everything about our edge application that is required to deploy it. For example:

```
edgectl app deploy ./my-app.yaml
```

You can use `edgectl` commands to view details of the app.

```
# List running apps
$ edgectl app list

# Get details of an app
$ edgectl app get my-app 
```

Note that an app consists of one or more microservices (containers). Again, use `edgectl`:

```
# List microservices in app
$ edgectl app msvc list

# Get details of a msvc
$ egectl app msvc get my-app/my-svc
```

You can use the `edgectl logs` command to view the container logs for a microservice. This is effectively equivalent to executing `docker logs CONTAINER_ID`.

```
edgetl logs my-app/my-svc
```

> Note that you can use the typical logs arguments, such as `--tail 100` or `--follow`.

The following section will go into detail about application `YAML` files.
