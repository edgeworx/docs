# Get Started: edgectl

Edgectl is Edgeworx Cloud's command line interface (CLI). It can be used to manage Edgeworx Cloud accounts, organizations, projects, nodes, and applications.

In this section we will show you how to use edgectl to get started with your first project and deploy some live microservices to the edge!

# Create an Edgeworx Cloud Account

Before installing and using edgectl, we must first create an account through [cloud.edgeworx.io](https://cloud.edgeworx.io).

Navigate to the portal and click the `Create Account` button on the top right.

Enter your unique username and hit `NEXT`.

On the "Welcome" page, choose an auth provider or provide your own email and password.

# Install edgectl

Edgectl supports Mac, Linux, and Windows.

## MacOS

On Mac, we can us `brew` to install edgectl:

```
brew install Edgeworx/edgectl/edgectl
```

## Linux

#### Debian

On Debian distributions, we can use `apt` to install edgectl.

```
curl -s https://packagecloud.io/install/repositories/edgeworx/edgectl/script.deb.sh | sudo bash
sudo apt-get update -y
sudo apt-get install edgectl -y
```

#### RPM

We can use the following commands to install edgectl on `RPM` based distributions.

```
curl -s https://packagecloud.io/install/repositories/edgeworx/edgectl/script.rpm.sh | sudo bash
sudo yum install edgectl -y
```

## Windows

Windows support is coming in the near future. Watch this space!

# Use edgectl

Now we are ready to use edgectl to login and start managing our Edgeworx Cloud resources!

## Login

To initiate the login procedure, run:

```
edgectl login
```

This will bring up an authentication view in a web browser. Use this view to select your authentication method and provide the required credentials.

## Get Familiar

Lets get familiar with edgectl. We can observe the main use cases by running the top-level help command:

```
edgectl --help
```

We can run `--help` against any of the commands that return from the above command. For the remainder of this tutorial, we will focus on the following commands:

```
edgectl account     (Manage accounts)
edgectl app         (Manage applications)
edgectl defaults    (List, get, or set edgectl defaults)
edgectl node        (Manage project nodes)
edgectl org         (Manage orgs)
edgectl project     (Manage projects)
edgectl registry    (Manage registries)
```
