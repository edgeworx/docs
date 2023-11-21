---
title: "Orgs & Members"
weight: 900
draft: false
beta: false
---
When you create an account on Edgeworx Cloud, a _Personal Org_ (organization) is created automatically,
with the same name as your username. Thus, the user _Alice_ with username `alice`
has a _personal org_ also named `alice`. When `alice` creates new projects,
those projects are created inside her personal org, e.g. `alice/someproject`.

For collaboration, you should create a separate org for your company.
For example, if Alice's employer is Acme Corp., she would create an org `acme`. New
projects would be created inside the `acme` org, e.g. `acme/megaproject`. (Projects can also be
 from Alice's personal org to the corporate org).
Naturally Alice can invite people to join the org.

When inviting a member to the org, you must specify the permissions that member has. These permissions
can be reviewed at the

A member's permissions are set when the [org invite is created](/docs/cloud/edgectl/create-invite).
The permissions can also be [modified](/docs/cloud/edgectl/patch-member/) by an org admin. A member
can have more than one permission for an org, and some permissions imply others. For example,
an _Org Owner_ has permission `org:owner`, but also `org:admin` and `org:write` (through inheritance).

## Create an Org

On the Cloud Portal homepage, select "create an org" where orgs are listed (there will be none when
you first sign up). You will then be guided through creation. The only required information is the org website

![Org Create Screen](/images/orgs/org-create.png)

![Org Create Details Screen](/images/create_org_modal.png)

![Org Details Screen](/images/dashboard_org_details.png)

## Invite members

### Using the CLI

Use [`edgectl create invite`](/docs/cloud/edgectl/create-invite) to invite people
to join the org. Below, Alice invites her colleague Bob to join the `acme` org
as an admin. Other scopes (permissions) include `org:owner` and `org:write`.

```shell
$ edgectl create invite --email bob@acme.com --org acme --scope org:admin
UUID                                  INVITEE EMAIL          CREATED UTC  EXPIRES UTC
b478ce89-7172-4d2a-abac-b76b09afe01b  bob@acme.com           2023-01-31   2023-03-02
```

The `scope` argument determines Bob's role (permissions) in the org. If `scope` is
not specified, the default (`org:write`) is used.

Bob will receive an invite email. If Bob doesn't have an account, he needs
to [sign up.](https://cloud.edgeworx.io)

### Using the Cloud Portal

After creating an org, you will be presented with a screen to invite other
members into the org by email.

![Org Member Invite Screen](/images/orgs/org-member-invite.png)

If you need to invite more members, you can do so through the member details screen.
Navigate to the org page, and click `INVITE MEMBER` to invite a new member by their email.

## Accept invite

### Using the CLI

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

### Using the Cloud Portal

You should receive an email with directions on how to accept an org invite. Follow
the instructions to create an account and accept the invite to the new org.

![Org Member Invite Email](/images/verification_email.png)

## Modify member scopes

### Using the CLI

Use [`edgectl patch member`](/docs/cloud/edgectl/patch-member) to change a member's scopes. For example, Alice can
reduce Bob's set of scopes to only `org:write` as follows:

```shell
$ edgectl patch member --org acme --account bob --scope org:write
Updated scopes on account {bob} in org {15e23cf5-c4f7-4ac9-aedb-689231124f10|acme}
```

### Using the Cloud Portal

In the Cloud Portal, navigate to the org page, click the settings wheel next to the "members" header,
and select the permission you want to change for a user.

![Org Member Details](/images/org_details_members.png)

![Change Member Permissions](/images/org_details_members_perm.png)

## Remove member

### Using the CLI

Use [`edgectl delete member`](/docs/cloud/edgectl/delete-member) to remove a member from an org. Note that this only deletes
the account's membership of the org: it does not delete the account itself.

```shell
edgectl delete member --org acme --account bob
```

### Using the Cloud Portal

In the Cloud Portal, navigate to the org page, click the settings wheel next to the "members" header,
and remove the user with the "delete" icon next to the user's email.

![Remove Member](/images/org_member_delete_modal.png)
