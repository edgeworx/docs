# Deploy an App

Once we have an edge node in our project, we can deploy applications to run on those nodes.

To deploy an app, use `edgectl deploy app`. We can run the following to learn how it works:

```
edgectl deploy app --help
```

The `deploy app` command requires a path to a `YAML` file to be specified. The YAML files for demo applications can be retrieved from Darcy Cloud or from the [**Glossary**](../glossary/) **** section**** of this documentation

The`YAML` file defines everything about our edge application that is required to deploy it. For example:

```
edgectl deploy app ./edgeworx-heart-rate.yaml
```

You can use `edgectl` commands to view details of the app.

```bash
$ edgectl get apps
NAME                 DESCRIPTION  STATUS
edgeworx-heart-rate               running

$ edgectl get app edgeworx-heart-rate
NAME                 DESCRIPTION  STATUS
edgeworx-heart-rate               running
```

If you need more detail on an app, use the `--json` flag, e.g. `edgectl get app edgeworx-heart-rate --json`: (output abbreviated for clarity):

```json
{
  "description": "",
  "id": 1,
  "isActivated": true,
  "name": "edgeworx-heart-rate",
  "projectUUID": "b75676cb-ae3f-4808-a992-0811e077d783",
  "routes": [
    {
      "from": "monitor",
      "name": "monitor-to-viewer",
      "to": "viewer"
    }
  ],
  "status": "running"
}

```

Note that an app consists of one or more microservices (containers). Use `edgectl get microservices`:

```
$ edgectl get microservices --app edgeworx-heart-rate
NAME     STATUS   IMAGE                                        NODE
monitor  RUNNING  edgeworx/healthcare-heart-rate:arm-v1        raspberrypie1c0fe7939883f228946
viewer   RUNNING  edgeworx/healthcare-heart-rate-ui-arm:1.0.0  raspberrypie1c0fe7939883f228946
```

To view the details of the `monitor` microservice in the `edgeworx-heart-rate` app:

```
edgectl get microservice --app edgeworx-heart-rate monitor
```

#### Container Logs

You can use the `edgectl logs` command to view the container logs for a microservice. This is effectively equivalent to executing `docker logs CONTAINER_ID`. The `logs` command takes one argument, `APP_NAME/MICROSERVICE_NAME`. For example:

```
$ $ edgectl logs edgeworx-heart-rate/monitor --tail 5
[Thu Feb 24 2022 20:52:49] [LOG]   test-mode = true, generating mock sensor data..
[Thu Feb 24 2022 20:52:54] [LOG]   Retrieving heart rate sensor reading
[Thu Feb 24 2022 20:52:54] [LOG]   test-mode = true, generating mock sensor data..
[Thu Feb 24 2022 20:52:59] [LOG]   Retrieving heart rate sensor reading
[Thu Feb 24 2022 20:52:59] [LOG]   test-mode = true, generating mock sensor data..
```

> Note that you can use the typical logs arguments, such as `--tail 100` or `--follow`.

The following section will go into detail about application `YAML` files
