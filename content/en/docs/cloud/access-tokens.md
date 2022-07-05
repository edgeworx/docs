---
title: "Access tokens"
weight: 800
aliases:
  - /darcy/darcy-cloud/access-tokens
---

Darcy Cloud supports basic HTTP authentication through access tokens.

Simply pass the token as username in
the [HTTP Basic authentication](https://en.wikipedia.org/wiki/Basic_access_authentication) header.
If you are doing the base64 encoding yourself, don't forget to append a single `:` at the end of
your token before encoding.

## Usage

- Inside a URL:

```text
https://<access_token>@api.darcy.io/v1/...
```

- As an HTTP header (base64 encoded)

```text
window.fetch(
    "https://api.darcy.io/v1/account/cypress%40edgeworx.io",
    { headers:
        { Authorization: "Basic " + window.btoa("<access_token>:")}
    }
)
```

- As a login option in edgectl or for a specific command

```shell
edgectl login --token <access_token>
edgectl --token <access_token> account get <your_email>
```

### Personal Access Token

Personal Access Tokens have the same privilege as the user they represent and have a lifecycle
connected to the user account.

![Personal Access Tokens](</images/image (23).png>)

### Project Access Token

[Project](../more/terminology.md#project) Access Tokens have full access to the project they represent and have a lifecycle connected
to their project. Those are the token used in the [node install script](../more/terminology.md#node-install-script).

![Project Access Token](</images/image (29).png>)

### Third Party Access Tokens

You can create third party access tokens both at a project level and at an account level.

3rd party access token have a label and can be revoked at any time. Those are useful for using
edgectl in a CI/CD environment or share access to a specific project to another account.
