# Get Started: edgectl

Edgectl is Edgeworx Cloud's command line interface (CLI). It can be used to manage Edgeworx Cloud accounts, organizations, projects, nodes, and applications.

In this section we will show you how to use edgectl to get started with your first project and deploy some live microservices to the edge!

## Create an Edgeworx Cloud Account

Before installing and using edgectl, we must first create an account through [**cloud.edgeworx.io**](https://cloud.edgeworx.io).

Navigate to the portal and click the `Create Account` button on the top right.

Enter your unique username and hit `NEXT`.

On the "Welcome" page, choose an auth provider or provide your own email and password.

## Install edgectl

Edgectl supports Mac, Linux, and Windows.

### MacOS

On Mac, we can use [**brew**](https://brew.sh) to install _edgectl_:

```bash
brew install edgeworx/edgectl/edgectl
```

### Linux

On Linux distros, use `get-edgectl.bash`.

```
curl https://cloud.edgeworx.io/get-edgectl.bash | bash
```

### Windows

Windows support is coming in the near future. Watch this space!

## Enable edgectl tab completion

It is highly recommended that you enable tab completion, so that `edgectl` can help you complete commands and arguments. The installation process is shell-dependent: `bash`, `zsh`, `fish`, and `powershell` are supported. Execute `edgectl completion --help` for detailed instructions for your shell.

## Use edgectl

Now we are ready to use edgectl to login and start managing our Edgeworx Cloud resources!

### Login

_edgectl_ requires an _Access Token_. You can get one via: `edgectl login`, which will open a web browser on `cloud.edgeworx.io`. After authentication, _edgectl_ will receive the account's master _Personal Access Token,_ and will be logged in.

If a web browser is not available (e.g. SSH'd into a box), you can also login by providing either a _Personal Access Token_ or _Project Access Token_ from `cloud.edgeworx.io`. For _Personal Access Token_, click `Access Tokens` in the upper-right account menu. For _Project Acccess Token_, click the settings (gear) icon on the project page. Once you have the _Access Token_, you can execute:

```bash
edgectl login --token xyz
```

## Get Familiar

Lets get familiar with edgectl. We can observe the main use cases by running the top-level help command:

```
edgectl --help
```

We can run the flag `--help` against any of the commands that return from the above command. For the remainder of this tutorial, we will focus on the following commands:

```
edgectl account     (Manage accounts)
edgectl app         (Manage applications)
edgectl defaults    (List, get, or set edgectl defaults)
edgectl node        (Manage project nodes)
edgectl org         (Manage orgs)
edgectl project     (Manage projects)
edgectl registry    (Manage registries)
```

## Configure Defaults

We can use the `edgectl defaults set` command to set a default organization and project. This allows us to use many commands without having to provide the the `--org` and `--project` flags.

Let's start by viewing the current defaults:

```
edgectl defaults list
```

On first login, the default org is set to your account's personal org. You typically don't want to change the default org, but you probably want to change the default project. First, let's list the available projects in your org:

```
edgectl project list
```

And then set the default project (note that there is tab-completion available for the project name).

```
edgectl defaults set project alice/edge-project-1
```

Similarly, you can change other defaults, e.g.

```
edgectl defaults set format json
```
