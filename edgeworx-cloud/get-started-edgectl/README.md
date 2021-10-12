# Get Started: edgectl

Edgectl is Edgeworx Cloud's command line interface (CLI). It can be used to manage Edgeworx Cloud accounts, organizations, projects, nodes, and applications.

In this section we will show you how to use edgectl to get started with your first project and deploy some live microservices to the edge!

## 1. Create an Edgeworx Cloud Account

Before installing and using edgectl, we must first create an account through [cloud.edgeworx.io](https://cloud.edgeworx.io).

Navigate to the portal and click the `Create Account` button on the top right.

Enter your unique username and hit `NEXT`.

On the "Welcome" page, choose an auth provider or provide your own email and password.

## 2. Install edgectl

Edgectl supports Mac, Linux, and Windows.

### MacOS

On Mac, we can use [brew](https://brew.sh) to install _edgectl_:

```bash
brew install Edgeworx/edgectl/edgectl
```

### Linux

#### Debian

On Debian distributions, we can use `apt` to install _edgectl_.

```
curl -s https://packagecloud.io/install/repositories/edgeworx/edgectl/script.deb.sh | sudo bash
sudo apt-get update -y
sudo apt-get install edgectl -y
```

#### RPM

We can use the following commands to install _edgectl_ on `RPM` based distributions.

```
curl -s https://packagecloud.io/install/repositories/edgeworx/edgectl/script.rpm.sh | sudo bash
sudo yum install edgectl -y
```

### Windows

Windows support is coming in the near future. Watch this space!

## 3. Use edgectl

Now we are ready to use edgectl to login and start managing our Edgeworx Cloud resources!

### Login

_edgectl_ requires an _Access Token_. You can get one via: `edgectl login`, which will open a web browser on `cloud.edgeworx.io`. After authentication, _edgectl_ will receive the account's master _Personal Access Token,_ and will be logged in.

If it's preferred to now use a web browser (e.g. SSH'd into a box), you can also login by providing either a _Personal Access Token_ or _Project Access Token_ from `cloud.edgeworx.io`. For _Personal Access Token_, click `Access Tokens` in the upper-right account menu. For _Project Acccess Token_, click the settings (gear) icon on the project page. Once you have the _Access Token_, you can execute:

```bash
edgectl login --token xyz
```

## 4. Get Familiar

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

## 5. Configure Default Org and Project

We can use the `edgectl defaults` command to set a default organization and project. This allows us to use many commands without having to provide the the `--org` and `--project` flags.

We can use the `list` command to see our available organizations:

```
edgectl org list
```

This will produce `json` output. We can use the `uuid` field from the json output in the following command in order to set our default organization:

```
edgectl defaults set org b828800a-6b34-4414-b884-2bbcd47a0950
```

Similarly, we can list available projects:

```
edgectl project list
```

And set the default project using the `uuid` field:

```
edgectl defaults set project fe495002-c276-499f-910e-f8914f147e22
```

