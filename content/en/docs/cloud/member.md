---
title: "Orgs & Members"
weight: 800
draft: true
beta: true
---
<!-- TODO: Redo this content per Neil. Create headers/subheaders for portal and CLI -->
When you create an account on Edgeworx Cloud, a _Personal Org_ (organization) is created automatically,
with the same name as your username. Thus, the user _Alice_ with username `alice`
has a _personal org_ also named `alice`. When `alice` creates new projects,
those projects are created inside
her personal org, e.g. `alice/hatproject`.

For collaboration, you should create a separate org for your company.
For example, if Alice's employer is Acme Corp., she would create an org `acme`. New
projects would be created inside the `acme` org, e.g. `acme/megaproject`. (Projects can also be
[migrated](docs/cloud/migrate-project/) from Alice's personal org to the corporate org).
Naturally Alice can invite people to join the org.

## Create an Org

Use [`edgectl create org`](/docs/cloud/edgectl/create-org) to create the new org.
The supplied org `name` must be unique.

```shell
$ edgectl create org --name acme
UUID                                  NAME  PERSONAL ORG  CREATED UTC
15e23cf5-c4f7-4ac9-aedb-689231124f10  acme  false         2023-01-31
```

{{<info>}}
If you will mainly be working in the newly created org, set that org
as your default.

```shell
edgectl set default org acme
```

{{</info>}}

## Invite members

Use [`edgectl create invite`](/docs/cloud/edgectl/create-invite) to invite people
to join the org. Below, Alice invites her colleague Bob to join the `acme` org.

```shell
$ edgectl create invite --email bob@acme.com --org acme --scope org:admin
UUID                                  INVITEE EMAIL          CREATED UTC  EXPIRES UTC
b478ce89-7172-4d2a-abac-b76b09afe01b  bob@acme.com           2023-01-31   2023-03-02
```

The `scope` argument determines Bob's role (permissions) in the org. If `scope` is
not specified, the default (`org:write`) is used.

Bob will receive an invite email. If Bob doesn't have an account, he needs
to [sign up](https://cloud.darcy.ai).

## Accept invite

Bob can use `edgectl` to respond to the invite.

```shell
$ edgectl get invites
INVITE UUID                           INVITER  ORG NAME  INVITEE EMAIL
b478ce89-7172-4d2a-abac-b76b09afe01b  alice    acme      bob@acme.com
```

To accept the invite, use the `patch invite` command:

```shell
edgectl patch invite --uuid b478ce89-7172-4d2a-abac-b76b09afe01b --state accepted
```

{{<info>}}
Use tab completion for the `--uuid` flag to avoid typing the full invite UUID.
{{</info>}}

Verify that Bob can access the `acme` org:

```shell
$ edgectl get orgs
UUID                                  NAME     PERSONAL ORG  CREATED UTC  SCOPES
15e23cf5-c4f7-4ac9-aedb-689231124f10  acme     false         2023-01-31   org:admin,org:write
7bc10fbb-ef0a-47f8-bf71-608eece7c317  bob      true          2023-01-03   org:admin,org:owner,org:write
```

## Scopes

A `scope` (which is similar to a `role`) determines what
actions a user can perform.

- `org:write` (default):
  - Create new projects.
  - Modify existing projects (e.g. add nodes, deploy applications).
  - Delete existing projects.
  - Referred to as an _Org Member_.
- `org:admin`:
  - All the abilities of `org:write`.
  - Create invites to org.
  - Change member scopes (except for owners).
  - Remove members.
  - Referred to as an _Org Admin_.
- `org:owner`:
  - All the abilities of `org:admin`.
  - Change member scopes of all members.
  - Can delete org.
  - Referred to as an _Org Owner_.

A member's scopes are set when the [org invite is created](/docs/cloud/edgectl/create-invite).
The scopes can also be [modified](/docs/cloud/edgectl/patch-member/) by an org admin. A member
can have more than one scope for an org, and some scopes imply others. For example,
an _Org Owner_ has scope `org:owner`, but also scopes `org:admin` and `org:write`.

## Modify member scopes

Use [`edgectl patch member`](/docs/cloud/edgectl/patch-member) to change a member's scopes. For example, Alice can
reduce Bob's set of scopes to only `org:write` as follows:

```shell
$ edgectl patch member --org acme --account bob --scope org:write
Updated scopes on account {bob} in org {15e23cf5-c4f7-4ac9-aedb-689231124f10|acme}
```

## Remove member

Use [`edgectl delete member`](/docs/cloud/edgectl/delete-member) to remove a member from an org. Note that this only deletes
the account's membership of the org: it does not delete the account itself.

```shell
edgectl delete member --org acme --account bob
```
