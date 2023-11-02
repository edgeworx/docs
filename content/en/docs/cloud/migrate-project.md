---
title: "Migrate project"
description: |-
  Migrate a project to a different org.
weight: 1100
draft: true
beta: true
---
You can migrate a project from one org to another using _edgectl_. This is
best illustrated with an example.

_Alice_ has created a project in her personal org, let's call it `alice/projecthatter`.
After working on the project for some time, she decides that it's best hosted under her
employer's org (Acme Corp). That is to say, Alice wants to
perform the project migration `alice/projecthatter --> acme/projecthatter`.

{{<info>}}
The person performing the migration must have role `org:admin` (or higher) on both the
  source org (`alice` in this case) and the destination org (`acme`).

If you don't have sufficient privileges, contact [Edgeworx Support](mailto:support@edgeworx.io) for assistance.

{{</info>}}

Using `edgectl`:

```shell
edgectl migrate project --id alice/projecthatter --org acme
```

Verify that the migration was successful:

```shell
edgectl get project acme/projecthatter
```
