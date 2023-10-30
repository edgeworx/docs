---
title: "Scopes & Roles"
weight: 1000
draft: false
beta: false
---
## Scopes vs Roles
Scopes and roles are synonymous and interchangeable. In the CLI and API
we use the term `scope` to define how a member is able to interact within an
organization. In the cloud portal, we use the term `role` to display the
specific member's permissions. Both `scope` and `role` are how we define permissions.

## Permissions 

A `permission` determines what actions a user can perform.

- `org:write` (default):
  - Create new projects.
  - Modify existing projects (e.g. add nodes, deploy applications).
  - Delete existing projects.
  - Referred to as an _Org Member_.
- `org:admin`:
  - Inherits all abilities of `org:write`.
  - Create invites to org.
  - Change permissions of all members (except for owners).
  - Remove members.
  - Referred to as an _Org Admin_.
- `org:owner`:
  - Inherits all abilities of `org:admin`.
  - Change permissions of all members.
  - Can delete org.
  - Referred to as an _Org Owner_.

You can set the permissions through the Cloud Portal and CLI when inviting members to the org,
these instructions can be seen on the [orgs and members](/docs/cloud/orgs-and-members) page.
