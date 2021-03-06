# What is Edgeworx Cloud?

**Edgeworx Cloud is a tool built on the principle of Infrastructure as Code (IaC) that allows you to manage edge infrastructure and applications. Developers can deploy, orchestrate and operate containerized microservice applications from the cloud to remote heterogenous on-premise servers and edge devices.**&#x20;

Your edge can be comprised of anything from a cloud VM, to a mini datacenter to a Raspberry Pi Zero and everything in between. Edgeworx Cloud makes it easy to deploy and manage across multiple tiers, in different geographies, across diverse networks and behind multiple firewalls.&#x20;

Your application can be just a single microservice or can be a sophisticated multi-tier application, consisting of distributed microservices that are securely communicating across a fluid, logical overlay [**virtual application network**](https://netprototalk.com/2019/11/12/virtual-application-networks-for-hybrid-cloud-interconnect/) **** (VAN).

### Core Goals

1. **Simple to setup** - connect any compute platform, server or device with a 1-line command&#x20;
2. **Secure by design** - provision nodes, deploy applications and route messages via encrypted communications without exposing any ports to the internet
3. **Support any topology** - create multi-cloud, hybrid cloud, multi-tier, edge-to-edge topologies without any VPNs or opening any firewall ports
4. **Developer familiarity** - feels like the frameworks and tools you already know and love (Docker, Kubernetes, Terraform, GitOps, etc).

Built by developers for developers, we focus on beautifully crafted interfaces (web and cli), thoughtful REST APIs and opinionated (and extensible) YAML specs for software deployment and integration with today’s most popular developer tools and workflows. If you know how to use Terraform or Kubernetes then you'll be immediately at home with Edgeworx Cloud.&#x20;

![Edgeworx Cloud UI](<../.gitbook/assets/image (3) (1).png>)

### Features

* **Edge Native Abstractions** -  Edge Native implementations for agents, agent runtime, volumes, message routes and applications `Kinds`. All driven by Kubernetes inspired `kind` [**specifications**](applications-doc/app-doc-yaml.md).
* **Edge Control Plane** - manage all aspects of your edge deployment from the Cloud (provisioning, deployment, orchestration, resources, monitoring, updates, etc.)
* **Edge Projects** - logically group, secure and manage edge nodes and applications&#x20;
* **Simplified provisioning** - a single, sharable, per project 1-line install command that handles all the downloading, provisioning, validation and registering for each of your edge projects
* **Virtual Application Networks** - create multi-cloud, hybrid cloud, multi-tier, edge-to-edge topologies without any VPNs or opening any firewall ports
* **Heterogenous hardware** - provision to any x86 or ARM based edge node that has a relatively modern Linux kernel that supports containerization.&#x20;
* **REST API driven** - manage your account, organization, projects, nodes and applications via a REST client. Check out the OpenAPI [**specification here**](https://api.edgeworx.io/v1/docs).
* **CLI access** - Full API access via`edgectl` for the power of the command line in your terminal, or scripted into your other tools. Supports autocompletion in most shells, text or JSON output
* **Keyless ssh access** - securely access your remote servers and devices without the headache of VPNs and SSH keys via the web UI or via `edgectl`
* **Access Tokens** - create account wide or project based access tokens to allow fine grained access via edgectl or other tooling to your projects and applications
* **Templating language** - use liquid.js syntax in your [**Application**](applications-doc/) definitions to support powerful [**application templating**](applications-doc/app-doc-advanced-templating.md) at deployment time
* **Application orchestration** - deploy applications to one or many nodes via the UI, cli or API using directed deployment or deployment time scripting
* **Public Services** - expose any container that offers a tcp or http service to the rest of your VAN, without requiring any ports or firewalls to be open&#x20;
* **Resource monitoring** - get visibility into the resource usage and performance of your edge nodes (e.g. CPU, Mem usage, etc)
* **Container lifecycle management** - fine grained visibility into the progress and state of microservice images that are deployed to edge nodes. Automatic clean up and pruning of redundant or old containers&#x20;
* **Application lifecycle management** - manage the entire app lifecycle from development to deployment, updating, deleting, scaling&#x20;
* **Drag and drop deployment** - drag application YAML specifications into the rich user interface for easy application deployment
* **Tool integration** - create specific project access tokens (PATs) for your existing tools to enable secure automation and access from your CI/CD system, or your Ops Dashboard, for example
* **Public and private image registries** - use public registries such as DockerHub or configure your own private repos on a per project basis&#x20;
* **Messaging Routing** - define message data flow routes between your microservices in your YAML application spec
* **Life deployment updates** - edit and update application deployment specs in the web UI to reconfigure, scale or change your applications without having to redeploy
