# docs.edgeworx.io

[![Better Uptime Badge](https://betteruptime.com/status-badges/v1/monitor/e975.svg)](https://betteruptime.com/?utm_source=status_badge)

Here you can contribute to the Edgeworx Docs Site, which lives
at [docs.edgeworx.io](https://docs.edgeworx.io).

## Overview

The docs site is generated from markdown files stored in `/content` by the [Hugo](https://gohugo.io)
site generator. The Hugo theme is a fork of [Doks](https://getdoks.org).

When changes are merged to the `master` branch, a
CI [pipeline](https://github.com/darcyai/docs/actions) kicks off, which publishes the
content to [Netlify](https://www.netlify.com).

## Pre-requisites

- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) — `node v18.12.1 (npm v9.2.0)` or higher. It is recommended to
  install [nvm](https://github.com/nvm-sh/nvm). Then simply `nvm use 18`.

> The Doks theme uses npm (included with Node.js) to centralize dependency management,
> making it [easy to update](https://getdoks.org/docs/help/how-to-update/) resources, build tooling,
> plugins, and build scripts.

## Get started

- Clone the repo: `git clone https://github.com/darcyai/docs.git`
- Change to the repo dir: `cd docs`
- Install dependencies: `npm install`
- Start a local server: `npm start`
- View the website locally: [http://localhost:1313](http://localhost:1313)
- Test your changes: `npm test`

> NOTE: when the local server is running, you can generally make edits and they will
> appear in your browser. However, for some types of changes, you may need to restart
> the local server.

## Contributing

If you find issues with the content, you can:

- Ask a question or open a discussion
  in [GitHub Discussions](https://github.com/darcyai/docs/discussions)
- Open a [GitHub issue](https://github.com/darcyai/docs/issues/new/choose)
- Submit a [Pull Request](https://github.com/darcyai/docs/pulls). If submitting a PR:
  - Verify that your changes build locally. Run `npm test`:
  - Create a [Pull Request](https://github.com/darcyai/docs/pulls) (follow
    the [GitHub flow](https://guides.github.com/introduction/flow/)
    and [Conventional Commits Specification](https://www.conventionalcommits.org/en/v1.0.0/))
  - Supports all screen sizes (if relevant)

## Development

The site is generated using Hugo, based off the Doks theme. Start with
the [Hugo docs](https://gohugo.io/getting-started/) and then
the [Doks theme docs](https://getdoks.org/docs/overview/introduction/).

Content is stored in [`/content`](/content).

### Staging branch

If you merge changes to branch `staging`, those changes will show up
at [https://staging--darcydocs.netlify.app](https://staging--darcydocs.netlify.app).

### Templates

The [`/layouts`](/layouts) dir contains the templates for rendering. The most interesting parts are:

- `/layouts/_default`: the core template files
- `/layouts/partials`: templates for partial (e.g. footer, header, sidebar etc)
- `/layouts/docs`: templates for the `docs` content type (i.e. most of the content)

### CSS

Styling is controlled via the SCSS files in `/assets/scss`. Note that the theme
supports both normal and "dark" mode, so be sure to also update `/assets/scss/common/_dark.scss`.

> For one-off HTML components, put that CSS into `/assets/scss/_custom.scss`.

### Content Security Policy

If the site pulls in scripts etc. from other external domains (e.g. analytics), then we need
to update the Content-Security-Policy in [./netlify.toml](./netlify.toml).

## Branches

If you merge a change to `master`, this will trigger the build pipeline, and ultimately result in
your changes being published to `prod` (meaning [https://docs.edgeworx.io](https://docs.edgeworx.io))

We've also enabled a `staging` branch. If you merge a change to the `staging` branch, this will also
trigger a pipeline, and your changes will be visible
at [https://staging--darcydocs.netlify.app](https://staging--darcydocs.netlify.app).

Obviously, that `staging` branch needs to be merged to `master` for that content to take effect on
the live site.

## Content

### Format
Content added by Edgeworx or the community must follow the guidelines below:

- Must use `alice` and `bob` users in all screenshots or code referencing a user.
- Screenshots must be PNG if static and GIF/WEBM files for moving pictures at desktop breakpoints.
  Smaller breakpoints require scaled images. (media queries)


### Markdown files

Content is generated from markdown files stored under [`/content`](/content).

Every content directory must have an `_index.md` file (which is basically the equivalent
of an `index.html`). Other files should be in `lower-kebab-case.md` format.

### Front matter

Markdown files must have [front matter](https://gohugo.io/content-management/front-matter/), which
is basically metadata. For example:

```markdown
---
title: "Add Virtual Node to Edgeworx Cloud"
linkTitle: "Add Virtual Node"
description: "Add a Virtual Node to Edgeworx Cloud via edgectl or Cloud Portal."
weight: 100
draft: false
beta: false
---

CONTENT GOES HERE
```

Note that `title` is required in the front matter. If `linkTitle` is also present, that value is
used to generate link values in preference to `title` (useful if `title` is long). Neither `title`
nor 'linkTitle' should have a period (`.`) at the end.

You should also add a `description`. This field is displayed in the search results. It should be a
single sentence, ending with a period (`.`).

Note that the values of `title`, `linkTitle` and `description` should be enclosed in double quotes.

If `draft` is `true`, the content will be visible on `local` and `staging` builds, but not
on `prod`.

If `beta` is true, a notice is displayed to the user, indicating that the content refers to
a beta feature.

#### Slugs & Aliases

Hugo will generate the page slug (URL path) based on the filename and the slug of
the file's parents.

For example:

```text
+ doc                               /doc
    + ai
        - _index.md                 /doc/ai
        - getting-started.md        /doc/getting-started
```

If you want to set a specific slug for a page, use the `slug` field in the front matter.

```text
---
title : "About Edgeworx Cloud"
weight: 100
slug: "how-to-get-started"
---
```

This results in path `/doc/how-to-get-started`.

Relatedly, you can also set one or more aliases in the front matter. An alias is a full path
which will be redirected to the current content.

```markdown
---
title: "About Edgeworx Cloud"
weight: 100
slug: "how-to-get-started"
aliases:

- /doc/get-started/
- /guide/how-to-get-started/

---
```

### Ordering (weight)

The order in which pages appear is determined by the `weight` value in the page's front matter.
For a sub-directory, its order amongst its siblings is determined by the `weight` value in
the front matter of the `_index.md` in the sub-directory.

Within a directory, the `_index.md` file should have the smallest weight. The other markdown
files should have a weight greater than the weight of `_index.md`.

### Images & other assets

To reference an image from markdown, add the image to the [`/static/images`](/static/images) dir.
For example,
add `/static/images/my-image.png`, then reference the image in markdown
using `![My Image](/images/my-image.png)`.

You can do the same for other files, e.g. add `/static/pdfs/my.pdf` and reference in markdown
with `![My PDF](/pdfs/my.pdf)`.

> NOTE: Use descriptive file names for uploaded images. _DO NOT_ upload a file
> named `screen-shot-2021-10-08-at-5.59.22-pm.png`; instead upload `portal-projects-overview.png`.

### Alerts / Callouts

You can use the `info` [shortcode](https://gohugo.io/content-management/shortcodes/) to generate
[Bootstrap-style alerts](https://getbootstrap.com/docs/4.0/components/alerts/).

```markdown
{{<info>}}
Here's the info you're looking for!

For more info, go [here](https://example.com).
{{</info>}}
```

You can also use `{{<success>}}`, `{{<warning>}}`, and `{{<danger>}}`.

### Links

External links look like this:

```markdown
This is an [external link](https://example.com).
```

Internal links should use the absolute content path. For example:

```markdown
This is a link to the [Build Guide](/docs/guides/build).
```

An exception is made for content in the same directory, e.g.

```markdown
This is a link to [sibling content](./sibling).
```

### Tabs

Tabs can be used when there are several options, e.g. `macOS | Linux | Windows`. The tabs
mechanism has significant flexibility, such as including content from separate
files. See [these docs](https://kubernetes.io/docs/contribute/style/hugo-shortcodes/#tabs).

The snippet below creates a "platform switcher" set of tabs.

```markdown
# Let's say this file is "example.md"

{{<tabs name="platform" >}}

{{<tab name="macOS" subtitle="(amd64)">}}
Intel Mac
{{</tab>}}

{{<tab name="macOS" subtitle="(arm64)">}}
Apple Silicon
{{</tab>}}

{{%tab name="Linux"%}}
This tab has [markdown content](https://https://www.markdownguide.org). That
is why it uses `%tab` instead of `<tab`.
{{%/tab%}}

{{<tab name="Windows" subtitle="10" include="example__platform__windows__10" />}}
{{<tab name="Windows" subtitle="11" include="example__platform__windows__11" />}}

{{</tabs>}}
```

#### Tab subtitle

Note the optional `subtitle` attribute. This is useful for distinguishing between related tabs,
e.g. `macOS (arm64)` and `macOS (amd64)`.

#### Tabs with markdown content

If the tab content itself markdown, use the `{%tab` syntax instead of `{<tab`, as in the `Linux` tab
above.
The `%` notation tells Hugo that the inner content needs to be parsed and rendered.

#### Include tab content from file

Note the `include` attribute on the first `Windows` tab. The tab content will be loaded from
a file in the same directory. Tab content files follow this naming
convention `PARENTFILENAME__TABSNAME__TABNAME__SUBTITLE.md`. Thus, if the content file is named
`example.md`, the tabs are named `platform`, the tab is named `windows`, and the subtitle is `10`,
then the tab content file should be `example__platform__windows__10.md`.

#### Tab code blocks

Set the `codelang` attribute (e.g. `codelang="py"`) to syntax highlight the contents of a tab.

```markdown
{{<tabs name="languages-tabs" >}}

{{<tab name="Python" codelang="py">}}
print('Hello World!');
{{</tab>}}

{{<tab name="Go" codelang="go">}}
fmt.Println("Hello World!")
{{</tab>}}

{{</tabs>}}
```

### Raw HTML

From time to time it may be pragmatic to include raw HTML in the markdown. For example, if
there's a one-off HTML structure on a landing page. To do so, use the `rawhtml` shortcode:

```text
# Normal markdown here...

{{< rawhtml >}}
<div class="hello">
  <p>hello</p>
</div>
{{< /rawhtml >}}

## Normal markdown continues here...
```

### Sitenav external links

Sometimes you may want to add an external link to the left sitenav, e.g. a link
to external reference documentation. To do so, create a content markdown file
as per normal, but add an `externalLink: "https://my.external.link` line
to the front matter. You should also add content to the markdown, as this content
will show up in search results. Example
from [Reference Docs](https://raw.githubusercontent.com/darcyai/docs/staging/content/en/docs/ai/reference-docs.md)

```text
---
title: "Reference Docs"
linkTitle: "Reference Docs"
weight: 500
externalLink: "https://darcyai.github.io/darcyai/"
---
Python docs for the Edgeworx IO Engine.
```

## Generated docs

### `edgectl`

`edgectl` is the CLI for Edgeworx Cloud. Its has extensive builtin documentation
for each command, e.g. `edgectl get --help`. These builtin docs are also available
on this docs site, under [`/docs/cloud/edgectl`](https://docs.edgeworx.io/docs/cloud/edgectl).
When a new version of `edgectl` is released, these docs must be updated. To do so:

```shell
$ cd ./content/en/docs/cloud/edgectl
```

## Linting

The `npm test` target executes several linters:

- JavaScript
- Markdown
- Links

All lint errors must be addressed before a PR can be accepted. The GitHub workflow
also executes the linters.

> See GitHub [RULES.md](https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md) for
> markdown linting rules.
