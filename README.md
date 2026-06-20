# satyamsundaram.com

Personal site and long-term knowledge base for [Satyam Sundaram](https://satyamsundaram.com). A place to write about tech, building, economy, culture, and life.

**Live site:** https://satyamsundaram.com

---

## What this is

A static site built with [Jekyll](https://jekyllrb.com/) and hosted on GitHub Pages. No database, no backend — markdown files in this repo become HTML at build time.

| Section | URL | Purpose |
|---------|-----|---------|
| Home | `/` | Intro |
| Blog | `/blog` | Chronological list of posts |
| Post | `/YYYY/MM/DD/slug.html` | Individual blog article |
| Projects | `/projects` | Portfolio index |
| Project | `/projects/:name/` | Evergreen write-up (motivation, what, why, how) |
| About | `/about` | About page |
| RSS | `/feed.xml` | Blog feed |

**Blog vs projects:** Blog posts are dated and narrative (diaries, essays, learnings). Project pages are evergreen case studies about things you've built. Cross-link them when useful — e.g. a hackathon post linking to `/projects/opendiscourse/`.

---

## Tech stack

- **Jekyll** — static site generator
- **Kramdown** — markdown parser
- **Rouge** — syntax highlighting at build time (fenced code blocks)
- **Custom CSS** — no Jekyll theme; layouts and styles are hand-written
- **GitHub Pages** — hosting; custom domain via `CNAME`

---

## Project structure

```
.
├── _config.yml           # Site config (title, url, collections, highlighter)
├── CNAME                 # Custom domain (satyamsundaram.com)
├── _layouts/
│   ├── default.html      # Shell: nav, theme toggle, CSS
│   ├── post.html         # Blog post template
│   └── project.html      # Project detail template
├── _posts/               # Blog posts (dated markdown)
├── _projects/            # Project collection (evergreen write-ups)
├── assets/
│   ├── style.css         # Site styles, code block layout, light/dark variables
│   └── syntax.css        # Auto-generated Rouge syntax colors (do not edit by hand)
├── scripts/
│   └── generate-syntax-css.sh   # Regenerates assets/syntax.css
├── index.md              # Home page
├── blog.md               # Blog index
├── projects.md           # Projects index
├── about.md
├── feed.xml              # RSS template
└── _site/                # Build output (gitignored in production; generated locally)
```

---

## Adding content

### Blog post

Create `_posts/YYYY-MM-DD-slug.md`:

```yaml
---
layout: post
title: "Your Post Title"
date: 2026-06-17
---

Your content here.
```

- Filename date must match front matter `date`
- URL becomes `/2026/06/17/slug.html` (from filename)
- Link from another post: `[text](/2024/07/05/practices-to-transform-life.html)`

**Code blocks** — always tag the language for syntax highlighting:

````markdown
```javascript
const foo = require('./foo.js');
```
````

Supported languages are whatever [Rouge](https://github.com/rouge-ruby/rouge) supports (`javascript`, `cpp`, `python`, `bash`, etc.).

### Project

Create `_projects/my-project.md`:

```yaml
---
title: My Project
year: 2026
layout: project
link: https://example.com    # optional — live app or repo
excerpt: One-line summary shown on /projects
---

## Motivation
...

## What
...
```

- Index at `/projects` shows title → project page, plus optional `visit →` external link
- Full write-up lives at `/projects/my-project/`

---

## Syntax highlighting

Colors come from Rouge themes, generated into `assets/syntax.css`:

```bash
./scripts/generate-syntax-css.sh
```

This uses `github.light` and `github.dark` scoped to `div.highlighter-rouge` so fenced blocks get colors in both theme modes without affecting inline `` `code` ``.

Requires the `rouge` gem (`gem install rouge` provides `rougify`).

**Do not edit `assets/syntax.css` by hand** — re-run the script if you change themes.

Block layout (padding, line wrapping, borders) lives in `assets/style.css`.

---

## Light / dark mode

The theme toggle in the top-right sets `data-theme="light"` or `data-theme="dark"` on `<html>`, persisted in `localStorage`. Defaults to the user's OS preference on first visit.

CSS variables in `style.css` control site colors; `syntax.css` controls code token colors per theme.

---

## Local development

### Prerequisites

- Ruby (3.x recommended)
- Jekyll and Rouge:

```bash
gem install jekyll rouge
```

### Run locally

```bash
jekyll serve
```

Open http://localhost:4000. The site rebuilds automatically when you save files.

### Build only

```bash
jekyll build
```

Output goes to `_site/`.

### Before committing (if you changed syntax themes)

```bash
./scripts/generate-syntax-css.sh
jekyll build
```

---

## Deployment

Push to the `main` branch on GitHub. GitHub Pages builds and serves the site. The `CNAME` file points the custom domain `satyamsundaram.com` at the Pages site.

After deploying CSS changes, hard-refresh the browser (Cmd+Shift+R) to avoid stale cached stylesheets.

---

## Configuration reference

Key settings in `_config.yml`:

```yaml
title: Satyam Sundaram
url: https://satyamsundaram.com
markdown: kramdown
highlighter: rouge

collections:
  projects:
    output: true
    permalink: /projects/:name/
```

Posts use Jekyll's default permalink: `/:categories/:year/:month/:day/:title.html`.
