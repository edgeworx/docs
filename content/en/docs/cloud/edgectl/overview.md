---
title: "Get Started: edgectl"
weight: 100
---

edgectl is Darcy Cloud's command line interface (CLI). It can be used to manage Darcy Cloud
accounts, organizations, projects, nodes, and applications

In this section we will show you how to use edgectl to get started with your first project and
deploy some live microservices to the edge!

## Create a Darcy Cloud Account

Before installing and using edgectl, we must first create an account
through [cloud.darcy.ai](https://cloud.darcy.ai)

Navigate to the portal and click the `Create Account` button on the top right

Enter your unique username and hit `NEXT`

On the "Welcome" page, choose an auth provider or provide your own email and password

## Install edgectl

edgectl supports Mac, Linux, and Windows

### MacOS

On Mac, we can use [brew](https://brew.sh) to install _edgectl_:

```bash
brew install edgeworx/edgectl/edgectl
```

### Linux

On Linux distros, use `get-edgectl.bash`

```
curl https://cloud.darcy.ai/get-edgectl.bash | bash
```

### Windows

Windows support is coming in the near future. Watch this space!

## Enable edgectl tab completion

It is highly recommended that you enable tab completion, so that `edgectl` can help you complete
commands and arguments. The installation process is shell-dependent: `bash`, `zsh`, `fish`,
and `powershell` are supported. Execute `edgectl completion --help` for detailed instructions for
your shell

## Use edgectl

Now we are ready to use edgectl to login and start managing our Darcy Cloud resources!

### Login

_edgectl_ requires an _Access Token_. You can get one via: `edgectl login`, which will open a web
browser on `cloud.darcy.ai`. After authentication, _edgectl_ will receive the account's master _
Personal Access Token,_ and will be logged in

If a web browser is not available (e.g. SSH'd into a box), you can also login by providing either
a _Personal Access Token_ or _Project Access Token_ from `cloud.darcy.ai`. For _Personal Access
Token_, click `Access Tokens` in the upper-right account menu. For _Project Acccess Token_, click
the settings (gear) icon on the project page. Once you have the _Access Token_, you can execute:

```bash
edgectl login --token xyz
```

## Get Familiar

Lets get familiar with edgectl. We can observe the main use cases by running the top-level help
command:

```
edgectl --help
```

This produces help out similar to:

```
Available Commands:
  completion  Generate completion script
  create      Create a resource
  delete      Delete a resource
  deploy      Deploy resources
  describe    Show details of a resource
  get         Display one or many resources
  help        Help about any command
  login       Login to Darcy Cloud API
  logout      Logout from Darcy Cloud API
  logs        Display microservice logs
  patch       Update fields of a resource
  ping        Ping Darcy Cloud API
  rename      Rename a resource
  restart     Restart a resource
  rotate      Rotate a resource
  set         Set values or features on a resource
  ssh         SSH into node from project
  start       Start a resource
  stop        Stop a resource
  version     Print version info
```

For each of the commands, you can execute `edgectl CMD --help` for help on that command or to list
subcommands. For example, if you run `edgectl get --help`:

```
$ edgectl get --help
Display one or many resources.

Usage:
  edgectl get [command]

Available Commands:
  account             Get account
  app                 Get details of an app
  apps                List apps in project
  default             Get an edgectl default value
  defaults            List edgectl defaults
  heartbeat           Get heartbeat details
  heartbeats          List node heartbeats
  microservice        Get details of an app microservice
  microservices       List app microservices
  node                Get node details
  node-install-script Get the node installation script for a project
  nodes               List nodes for project
  org                 Get org details
  project             Get project details
  projects            List projects in org
  registries          List container registries for project
  registry            Get details of container registry
  token               Get access token
  tokens              List access tokens
```

## Configure Defaults

After your first `edgectl login`, an initial org and project likely exist. We can use
the `edgectl set default` command to set a default org and project. This allows us to use many
commands without having to provide the the `--org` and `--project` flags

Let's start by viewing the current defaults:

```
edgectl get defaults
```

On first login, the default org is set to your account's personal org. You typically don't want to
change the default org, but you probably want to change the default project. First, let's list the
available projects in your org:

```
edgectl get projects
```

And then set the default project (note that there is tab-completion available for the project name)

```
edgectl set default project alice/edge-project-1
```

Similarly, you can change other defaults, e.g.

```
edgectl set default format json
```
