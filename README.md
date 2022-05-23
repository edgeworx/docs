# Welcome to Darcy's Docs Repository

Here you can contribute to the Darcy Docs Site, which lives at [docs.darcy.ai](https://docs.darcy.ai).

# Overview

The docs site is generated from markdown files stored in `/content` by the [Hugo](https://gohugo.io)
site generator. The Hugo theme is a fork of [Doks](https://getdoks.org).

When changes are merged to the `master` branch, a CI pipeline kicks off, which publishes the
content to [Netlify](https://www.netlify.com).


## Pre-requisites

- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) — latest LTS version or newer

> The Doks theme uses npm (included with Node.js) to centralize dependency management,
> making it [easy to update](https://getdoks.org/docs/help/how-to-update/) resources, build tooling,
> plugins, and build scripts.


## Get started

- Clone the repo: `git clone https://github.com/darcyai/docs.git`
- Change to the repo dir: `cd docs`
- Install dependencies: `npm install`
- Start a local server: `npm run start`
- View the website locally: [http://localhost:1313](http://localhost:1313)

> NOTE: when the local server is running, you can generally make edits and they will
> appear in your browser. However, for some types of changes, you may need to restart
> the local server.

## Contributing

If you find issues with the content, you can either:

- Submit a Pull Request, or
- Open a [GitHub issue](https://github.com/darcyai/docs/issues/new/choose)

## Development

The site is generated using Hugo, based off the Doks theme. Start with
the [Hugo docs](https://gohugo.io/getting-started/) and then the [Doks theme docs](https://getdoks.org/docs/overview/introduction/).

Content is stored in [`/content`](/content).

### Templates

The [`/layouts`](/layouts) dir contains the templates for rendering. The most interesting parts are:

- `/layouts/_default`: the core template files
- `/layouts/partials`: templates for partial (e.g. footer, header, sidebar etc)
- `/layouts/docs`: templates for the `docs` content type (i.e. most of the content)

### CSS

Styling is controlled via the SCSS files in `/assets/scss`. Note that the theme
supports both normal and "dark" mode, so be sure to also update `/assets/scss/common/_dark.scss`.

## Content

### Markdown

Content is generated from markdown files stored under [`/content`](/content).

Markdown files must have [front matter](https://gohugo.io/content-management/front-matter/), which
is basically metadata. For example:

```markdown

---
title : "About Darcy Cloud"
weight: 100
---

CONTENT GOES HERE
```

Every content directory must have an `_index.md` file (which is basically the equivalent
of an `index.html`).

### Ordering (weight)

The order in which pages appear is determined by the `weight` value in the page's front matter.
For a sub-directory, its order amongst its siblings is determined by the `weight` value in
the front matter of the `_index.md` in the sub-directory.

Within a directory, the `_index.md` file should have the smallest weight. The other markdown
files should have a weight greater than the weight of `_index.md`.


### Images & other assets

To reference an image from markdown, add the image to the `/static/images` dir. For example,
add `/static/images/my-image.png`. Then reference the image in markdown using `![My Image](/images/my-image.png)`.

You can do the same for other files, e.g. add `/static/pdfs/my.pdf` and reference in markdown
with `![My PDF](/pdfs/my.pdf)`.

### Alerts

You can use the `alert` [shortcode](https://gohugo.io/content-management/shortcodes/) to generate
[Bootstrap-style alerts](https://getbootstrap.com/docs/4.0/components/alerts/).

```markdown
{{<alert>}}
  Here's the info you're looking for!
{{</alert>}}
```

The default alert style is `info`, but you can explicitly set a style (`success`, `info`, `warning`, `danger`).

```markdown
{{<alert style="warning">}}
  If you do not have any of the above hardware, you can create a VM and run
  the node installation script.
{{</alert>}}
```

### Links

When referring to other content (markdown files), use the [Hugo ref shortcode](https://gohugo.io/content-management/cross-references/)
instead of a traditional markdown link. For example, if you're in `/docs/cloud/a.md` and you want to refer
to `/docs/cloud/b.md`, use this:

```markdown
I am talking about [the b thing]({{<ref "b.md">}}).
```

Yes, it's more long-winded than the traditional markdown (`[the b thing](b.md)`), but the shortcode
mechanism causes Hugo to verify the link, and Hugo will fail if it cannot resolve the referenced document.
This is a significant benefit.

If you are linking outside the current dir:
- If you're linking to a file below the current dir, typically use a relative path, e.g. `[the below thing]({{<ref "./c/d.md">}})`.
- If you're linking to a file above the current dir, typically use absolute an absolute path, e.g. `[the above thing]({{<ref "/docs/cloud/e/f.md">}})`
