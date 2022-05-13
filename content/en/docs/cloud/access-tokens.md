---
title: "Access Tokens"
date: 2020-10-06T08:49:31+00:00
draft: false
weight: 630
menu:
  docs:
    parent: "cloud"
---


Darcy Cloud supports basic HTTP authentication through access tokens\
\
Simply pass the token as username in the [**HTTP Basic authentication**](https://en.wikipedia.org/wiki/Basic\_access\_authentication) header. If you are doing the base64 encoding yourself, don't forget to append a single `:` at the end of your token before encoding

## Usage

* Inside a URL:

```
https://<access_token>@api.edgeworx.io/v1/...
```

* As an HTTP header (base64 encoded)

```
window.fetch(
    "https://api.dev.edgeworx.io/v1/account/cypress%40edgeworx.io",
    { headers:
        { Authorization: "Basic " + window.btoa("<access_token>:")}
    }
)
```

* As a login option in edgectl or for a specific command

```
edgectl login --token <access_token>
edgectl --token <access_token> account get <your_email>
```

### Personal Access Token

Personal Access Tokens have the same privilege as the user they represent and have a lifecycle connected to the user account

![](<../assets/image (23).png>)

### Project Access Token

Project Access Tokens have full access to the project they represent and have a lifecycle connected to their project. Those are the token used in in the node install script

![](<../assets/image (29).png>)

### Third Party Access Tokens

You can create third party access tokens both at a project level and at an account level

3rd party access token have a label and can be revoked at any time. Those are useful for using edgectl in a CI/CD environment or share access to a specific project to another account

### Coming Soon...

You'll be able to set specific permissions for 3rd party access tokens
