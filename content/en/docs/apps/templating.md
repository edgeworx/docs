---
title: "App templating"
weight: 700
aliases:
  - /darcy/darcy-cloud/applications-doc/app-doc-advanced-templating
---

Variables, filter and template "queries" can be used as values for any field in your deployment
YAMLs. These variables allow you to reference values in your YAML document or any resource
preexisting in your edge [project](../more/terminology#project). This functionality adds flexibility and runtime binding in your
deployments files.

## Variables and Filters

Variables are interpolated (replaced) when the requests are made between [applications](../more/terminology#application) and [nodes](../cloud/adding-nodes/_index.md). The
variable value is a `snapshot` of the referenced value when the request is made. Any subsequent
modification of the underlying value will NOT be persisted.

Darcy's filtering logic sits on top of the LiquidJS engine. Full documentation for LiquidJS can be
found [here](https://liquidjs.com/index.html).

### Variables

#### Defining Variables

Variables are defined in YAML by wrapping the variable with double brackets.

- Defining a variable: `{{variable-name}}`

```yaml
env:
  - key: selfname
    value: "{{ self.name }}"
```

#### Assigning Values

Values can be assigned to a new text string.

- Assigning a value: `{% assign agent = "agent-name" | findAgent %}`

```yaml
env:
  - key: rulesengineHOST
    value: '{% raw %}
{%  assign curmsvc= self.microservices | where: "name", "msvc-1" | first %}
{% endraw %}{{ curmsvc | findAgent: agents | map: "host" }}' # get the host where a microservice is running via agent
```

### Filters

Filtering is used to display conditionals or alter the display of the text. Filters can be set as
conditionals (where a filter may have an "If" statement).

- Using a filter: `{{"agent-name" | findAgent}}`
- Example: Getting the host value of the agent
  named `zebra-1`: `{% assign agent = "zebra-1" | findAgent %}{{ agent.host }}`

A list of filters accepted can be found in the LiquidJS
documentation [here](https://liquidjs.com/filters/overview.html).

### Constant filters and keywords

This section details filters and values that are pre-defined.

#### Filters

| Name              | Description                                                                                   | Usage                           | Returns                                                 |
| ----------------- | --------------------------------------------------------------------------------------------- | ------------------------------- | ------------------------------------------------------- |
| `findAgent`       | Lookup an existing ioFog Agent, by name. If name is an empty string, all agents are returned. | "`agent-name`" \| findAgent     | An ioFog Agent, as defined by Controller API            |
| `findApplication` | Lookup an existing ioFog Application, by name                                                 | "`app-name`" \| findApplication | An ioFog Applicaiton, as defined by Controller REST API |

#### Values

**Self**: `self` is a reserved keyword. It references the current request body.

```yaml
env:
  - key: selfname
    value: "{{ self.name | upcase }}"
```

## Application YAML Example

```yaml
---
apiVersion: iofog.org/v2
kind: Application # What are we deploying
metadata:
  name: edai-smartbuilding-rules-engine # Application name

# Specifications of the application
spec:
  # List of microservices composing your application
  microservices:
    - name: rulesengine
      agent:
        name: agent-aismall01
      images:
        x86: nodered/node-red:latest
        arm: nodered/node-red:latest
        registry: remote
      config: { }
      container:
        rootHostAccess: false
        volumes: [ ]
        ports:
          - internal: 1881
            external: 1882
        env:
          - key: selfname
            value: '{{ self.name | upcase }}' # setting the application name to the microservice in uppercase
          - key: sharedToken
            value: 'sekrittoken' # setting secret token once
          - key: http_proxy
            value: 'http://myproxy.fr:8080/' # setting corporate proxy once
          - key: https_proxy
            value: '{{ self.microservices | where: "name", "rulesengine" | first | map: "env" | first | where: "key" , "http_proxy" | first | map: "value" | first }}' # get the https proxy from rulesengine ms and env http_proxy
    - name: ms2
      agent:
        name: agent-aismall01
      images:
        x86: XXX/img1
        arm: XXX/img2
        registry: remote
      config: { }
      container:
        rootHostAccess: false
        volumes: [ ]
        ports:
          - internal: 1883
            external: 1884
        env:
          - key: selfname
            value: '{{ self.name | upcase }}' # setting the application name to the microservice in uppercase
          - key: sharedToken
            value: '{{ self.microservices | where: "name", "rulesengine" | first | map: "env" | first | where: "key", "sharedToken" | first | map: "value" | first }}' # get the sharedToken from rulesengine ms and env sharedToken
          - key: http_proxy
            value: '{{ self.microservices | where: "name", "rulesengine" | first | map: "env" | first | where: "key" , "http_proxy" | first | map: "value" | first }}' # get the http proxy from rulesengine ms and env http_proxy
          - key: https_proxy
            value: '{{ self.microservices | where: "name", "rulesengine" | first | map: "env" | first | where: "key" , "http_proxy" | first | map: "value" | first }}' # get the https proxy from rulesengine ms and env http_proxy
          - key: rulesengineHOST
            value: '{% raw %}
{%  assign curmsvc= self.microservices | where: "name", "msvc-1" | first %}{{ curmsvc | findAgent: agents | map: "host" }}' # get the host where a microservice is running via agent
          - key: rulesenginePORT
            value: '{{ self.microservices | where: "name", "rulesengine" | first | map: "ports" | first | map: "external" | first }}'
          - key: redisHost # get host and port of a mciroservice
            value: '{% assign redisApp = "redis-app" | findApplication %}{% assign redismsvc = redisApp.microservices | where: "name", "redistest" | first %}
{% endraw %}{{ redismsvc | findAgent: agents | map: "host"}}:{{ redismsvc | map: "ports" | first | first |map: "external" | first }}'
          - key: edgeResLiveness # Get edge resource endpoint for a specific version
            value: '{{ "com.orange.smart-door" | findEdgeResource: "0.0.1" | map: "interface" | map: "endpoints" | first  | where: "name", "liveness" | first | map: "url" }}'
          - key: edgeResVersion # Get edge resource endpoint
            value: '{{ "com.orange.smart-door" | findEdgeResource            | map: "interface" | map: "endpoints" | first  | where: "name", "version" | first | map: "url" }}'
```

With controller API the same configuration looks like:

```json
{
  "name": "edai-smartbuilding-rules-engine",
  "isSystem": false,
  "description": "Description",
  "isActivated": true,
  "microservices": [
    {
      "name": "rulesengine",
      "config": "string",
      "images": [
        {
          "containerImage": "nodered/node-red:latest",
          "fogTypeId": 1
        },
        {
          "containerImage": "nodered/node-red:latest",
          "fogTypeId": 2
        }
      ],
      "registryId": 1,
      "application": "edai-smartbuilding-rules-engine",
      "iofogUuid": "node-id",
      "rootHostAccess": true,
      "logSize": 0,
      "volumeMappings": [],
      "ports": [
        {
          "internal": 1881,
          "external": 1882
        }
      ],
      "routes": [],
      "env": [
        {
          "key": "selfname",
          "value": "{{ self.name | upcase }}"
        },
        {
          "key": "sharedToken",
          "value": "sekrittoken"
        },
        {
          "key": "http_proxy",
          "value": "http://myproxy:8080/"
        },
        {
          "key": "https_proxy",
          "value": "{{ self.microservices | where: \"name\", \"rulesengine\" | first | map: \"env\" | first | where: \"key\" , \"http_proxy\" | first | map: \"value\" | first }}"
        }
      ],
      "cmd": []
    },
    {
      "name": "ms2",
      "config": "string",
      "images": [
        {
          "containerImage": " XXX/img1",
          "fogTypeId": 1
        },
        {
          "containerImage": " XXX/img2",
          "fogTypeId": 2
        }
      ],
      "registryId": 1,
      "application": "edai-smartbuilding-rules-engine",
      "iofogUuid": "node-id",
      "rootHostAccess": true,
      "logSize": 0,
      "volumeMappings": [],
      "ports": [
        {
          "internal": 1883,
          "external": 1884
        }
      ],
      "routes": [],
      "env": [
        {
          "key": "selfname",
          "value": "{{ self.name | upcase }}"
        },
        {
          "key": "sharedToken",
          "value": "{{ self.microservices | where: \"name\", \"rulesengine\" | first | map: \"env\" | first | where: \"key\", \"sharedToken\" | first | map: \"value\" | first }}"
        },
        {
          "key": "http_proxy",
          "value": "{{ self.microservices | where: \"name\", \"rulesengine\" | first | map: \"env\" | first | where: \"key\" , \"http_proxy\" | first | map: \"value\" | first }}"
        },
        {
          "key": "https_proxy",
          "value": "{{ self.microservices | where: \"name\", \"rulesengine\" | first | map: \"env\" | first | where: \"key\" , \"http_proxy\" | first | map: \"value\" | first }}"
        },
        {
          "key": "rulesengineHOST",
          "value": "{% raw %}
        {
          %
        assign
        curmsvc=
        self.microservices
        |
        where
        :
        \
        "name\", \"msvc-1\" | first %}{{ curmsvc | findAgent: agents | map: \"host\" }}"
        },
        {
          "key": "rulesenginePORT",
          "value": "{{ self.microservices | where: \"name\", \"rulesengine\" | first | map: \"ports\" | first | map: \"external\" | first }}"
        },
        {
          "key": "redisHost",
          "value": "{% assign redisApp = \"redis-app\" | findApplication %}{% assign redismsvc = redisApp.microservices | where: \"name\", \"redistest\" | first %}
        {
          %
        endraw
        %
      }
        {
        {
          redismsvc
          |
          findAgent: agents
          |
          map:
          \
          "host\"}}:{{ redismsvc | map: \"ports\" | first | first |map: \"external\" | first }}"
        },
        {
          "key": "edgeResLiveness",
          "value": "{{ \"com.orange.smart-door\" | findEdgeResource: \"0.0.1\" | map: \"interface\" | map: \"endpoints\" | first  | where: \"name\", \"liveness\" | first | map: \"url\" }}"
        },
        {
          "key": "edgeResVersion",
          "value": "{{ \"com.orange.smart-door\" | findEdgeResource            | map: \"interface\" | map: \"endpoints\" | first  | where: \"name\", \"version\" | first | map: \"url\" }}"
        }
      ],
      "cmd": []
    }
  ]
}
```

### Troubleshooting and Caveats

- The algorithmic operator of `liquidjs` or variable assignment have the scope on the processing
  string.

```json
---
....
- key: testaffect
value: "{% raw %}
{% assign ms =self.microservices | where: \"name\", \"rulesengine\" | first %}
{% endraw %}{{
ms.env | where: \"key\" , \"http_proxy\" | first }}"
....
```

- Make sure to define the template parametric expressions as `string`, otherwise the YAML parser
  will interpret them as Object, and you will encounter multiple type of errors

Incorrect:

```yaml
---
name: {{my-variable}} # This will error, as name are expected to be strings, and the YAML parser will interpret this as an object
```

Correct:

```yaml
---
name: '{{my-variable}}' # This will behave as expected
```
