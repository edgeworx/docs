# Application YAML Definition

Darcy Cloud uses **** [**Eclipse ioFog**](https://www.iofog.org) under the covers to deploy and manage applications. We directly use the ioFog YAML specifications for defining different resource `Kinds`. Applications are defined using YAML files. In this section you'll find an example application yaml file and description of all fields supported by Darcy Cloud.

## Fields

| Field         | Description                                                                                                                                                                                                                                                                                                    |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| apiVersion    | Specifies the API styling and versioning used by the Application and Microservices                                                                                                                                                                                                                             |
| kind          | Defines what is being deployed, i.e. Application                                                                                                                                                                                                                                                               |
| metadata      | Object including pertinent Application information including Name                                                                                                                                                                                                                                              |
| name          | The name of your application. This has to be unique within the namespace of your Edge Project. Must start and end with lowercase alphanumeric character. Can include '-' character.                                                                                                                            |
| spec          | Object containing microservices that compose the application                                                                                                                                                                                                                                                   |
| microservices | Object containing the microservices that make up your application. See the [**microservices**](app-doc-yaml.md#microservices) section below for more information.                                                                                                                                              |
| routes        | A list of Application Routes. Application routes define message passing between microservices. `From` and `To` use microservice names as identifiers, and must match a microservice defined in the `microservices` section. When deploying an application, prefer this method to the microservice route field. |

## Microservices

Microservices configuration and set up are defined inside the application YAML files.

| Field                    | Description                                                                                                                                                                                     |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name                     | User-defined unique identifier of an Microservice within an Darcy Cloud Project. Must start and end with lowercase alphanumeric character. Can include '-' character.                           |
| agent                    | Object describing the node the microservice is to be deployed on.                                                                                                                               |
| agent.name               | Darcy Cloud node name                                                                                                                                                                           |
| images                   | Description of the images to be used by the container running the microservice.                                                                                                                 |
| images.x86               | Image to be used on x86 nodes.                                                                                                                                                                  |
| images.arm               | Image to be used on ARM nodes.                                                                                                                                                                  |
| images.registry          | Either `local`, `remote`, or `registryID`. Remote will pull the image from Dockerhub, local will use the local cache of the node. RegistryID will use the specified registry.                   |
| images.catalogId         | Catalog item ID to be used in lieu and place of the images and the registry. (see [**catalog items**](http://iofog.staging.edgeworx.io/docs/3/applications/microservice-registry-catalog.html)) |
| config                   | User-defined arbitrary object to be passed to the microservice runtime as its configuration                                                                                                     |
| container.rootHostAccess | Set to true if the container needs to be able to access the host. This will also set the network of the container to `host`                                                                     |
| container.ports          | List of port mapping to be provided to the container running the microservice (See [**public services**](public-services.md) for a more details explanation of the public section)              |
| container.volumes        | List of volume mapping to be provided to the container running the microservice                                                                                                                 |
| container.env            | List of environment variables to be provided to the container running the microservice                                                                                                          |
| container.commands       | List of arguments passed as CMD to the container runtime                                                                                                                                        |

```yaml
# Agent on which to deploy the microservice
agent:
  # Agent name
  name: zebra-1

# Information about the container images to be used
images:
  x86: edgeworx/healthcare-heart-rate:x86-v1 # Image to be used on x86 type agents
  arm: edgeworx/healthcare-heart-rate:arm-v1 # Image to be used on arm type agents
  registry: remote # Either 'remote' or 'local' or the registry ID - Remote will pull the image from Dockerhub, local will use the local cache of the agent
  # Optional catalog item id (See Catalog items in the advanced section)
  catalogId: 0 # 0 is equivalent to not providing the field

# Microservice container configuration
container:
  # Requires root host access on the agent ?
  rootHostAccess: false
  # Microservice container volume mapping list on the agent
  volumes:
    # This will create a volume mapping between the agent '/tmp/msvc' volume and the microservice container volume '/data'
    - hostDestination: /tmp/msvc
      containerDestination: /data
      accessMode: 'rw' # ReadWrite access to the mounted volume
      type: 'bind' # Accepts 'bind' or 'volume'. Default is 'bind'

  # Microservice container environment variable list on the agent
  env:
    # This will create an environment variable inside the microservice container with the key 'BASE_URL' and the value 'http://localhost:8080/data'
    - key: BASE_URL
      value: http://localhost:8080/data
  # Microservice container port mapping list on the agent
  ports:
    # This will create a mapping between the port 80 of the microservice container and the port 5000 of the agent
    - internal: 80
      external: 5000
      public: # This will create a public endpoint proxying requests to microservice
        schemes:
        - https
        protocol: http   # Protocol for the proxy tunnel (Either tcp or http, defaults to http)
  commands:
    # This will result in the container being started as `docker run <image> <options> dbhost localhost:27017`
    - 'dbhost'
    - 'localhost:27017'

# Microservice configuration
config:
  # Arbitrary key, value YAML object
  data_label: test_mode=false_cross_agent_microservice_routing_aug_27
  test_mode: trueYaml
```

## Example Demo Application

```yaml
apiVersion: iofog.org/v3
kind: Application # What kind are we deploying
metadata:
  # Application name
  name: health-care-wearable 
# Specifications of the application
spec:
  # List of microservices composing your application
  microservices:
    # First micro service is the heart rate monitor
    - name: heart-rate-monitor
      agent:
        # This is the node to which the micro service will be deployed
        # See the Application Templating page for more details
        # You can also replace the value below with a specific node name  
        name: "{% raw %}
{% assign agent = \"\" | findAgent | first %}{{ agent.name }}"
      images:
        arm: edgeworx/healthcare-heart-rate:arm-v1
        x86: edgeworx/healthcare-heart-rate:x86-v1
        # You are able to specify custom image repositories if needed
        registry: remote 
      container:
        rootHostAccess: false
        ports: []
      # Config is passed to your microservice at run time
      config:
        # For the example, we will generate heart rate information
        test_mode: true
        data_label: Anonymous Person
        # Nest as many levels deep as needed
        # nested_object:
          # key: 42
          # deep_nested:
            # foo: bar
    # Second micro service is an HTML app that graphs the heart rate data
    - name: heart-rate-viewer
      agent:
        # You can also replace the value below with a specific node name  
        name: "{% assign agent = \"\" | findAgent | first %}
{% endraw %}{{ agent.name }}"
      images:
        arm: edgeworx/healthcare-heart-rate-ui:arm
        x86: edgeworx/healthcare-heart-rate-ui:x86
        registry: remote
      container:
        rootHostAccess: false
        ports:
          - internal: 80
            external: 5000
            public:
              schemes:
              - https
              protocol: http  
        env:
          - key: BASE_URL
            value: http://localhost:8080/data
  # Application routes define message passing between microservices
  routes:
    # Use microservice name
    - name: monitor-to-viewer
      from: heart-rate-monitor
      to: heart-rate-viewerya
```
