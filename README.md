# Sierra Hall — Portfolio

A static site. One HTML file plus its assets. No build step, no dependencies, no
framework. It works on GitHub Pages, Cloudflare Pages, Netlify, or by opening
`index.html` in a browser.

---

## Deploy to GitHub Pages

This site is already stamped for **https://sierrahall.github.io** — the short
address, with nothing after the domain. That requires one specific repo name.

**1. Create the repository.** On github.com, make a new repo named **exactly**
`SierraHall.github.io`. The name has to match the account name; that is what
makes it a user site rather than a project site. Public — GitHub Pages requires
it on free accounts.

**2. Push these files.** From inside this folder:

```bash
git init
git add .
git commit -m "Portfolio"
git branch -M main
git remote add origin https://github.com/SierraHall/SierraHall.github.io.git
git push -u origin main
```

**3. Turn on Pages.** Repo → **Settings** → **Pages** → under *Build and
deployment*, set **Source: Deploy from a branch**, **Branch: `main`**, folder
**`/ (root)`**. Save. First build takes a minute or two.

The site is then live at **https://sierrahall.github.io**. Nothing further to
configure — the canonical link and social preview tags already point there.

---

## If you use a different repo name

A repo named anything else serves at `https://sierrahall.github.io/REPONAME`.
Re-stamp the meta tags for that address:

```bash
./set-url.sh https://sierrahall.github.io/REPONAME
git commit -am "Set site URL" && git push
```

The résumé PDFs print the short address, so prefer the user-site repo unless you
have a reason not to.

## Custom domain

Settings → Pages → Custom domain. Add a file named `CNAME` containing just the
domain, then point a DNS `CNAME` record at `YOURNAME.github.io`. Re-run
`set-url.sh` with the new address.

---

## What's in here

| File | |
|---|---|
| `index.html` | The entire site — markup, styles and script in one file |
| `sierra-hall-resume.pdf` | Served behind the Résumé button |
| `oia-overview.mp4` | 26-second silent overview of the Operations Intelligence Hub |
| `oia-poster.jpg` | Video poster frame; also the social preview image |
| `sierra-hall.jpg` | Portrait |
| `frontline-*.jpg` | Redacted configuration screens — HR and payroll case |
| `research-tally.jpg` | Handwritten research tally — CORE case |
| `website-ownership.jpg` | Ownership map — CORE case |
| `delivery-pivot.jpg` | Task data pivot — Hibbett case |
| `driver-tracker.jpg` | Driver tracker, Feb 2022 — supporting work |
| `.nojekyll` | Tells Pages to serve files as-is |
| `set-url.sh` | Stamps the live URL into the meta tags |

Every path in `index.html` is relative, so the site works from a subfolder
(`/portfolio`) without changes.

---

## Editing

Open `index.html`. It is organized as:

1. `<style>` — design tokens at the top (`:root`, then `body` for light surfaces
   and `.dark` for the dark anchor sections). Change a color once there and it
   changes everywhere.
2. `<nav>` and the `<main>` views — `home`, `work`, `approach`, `case`,
   `hibbett`, `core`. Only one is visible at a time; the script at the bottom
   toggles the `hidden` attribute.
3. `<script>` — view switching, sector filter, case phase rail, scroll reveal,
   and play-on-view for the video.

To add a case study: copy an existing `<main id="...">` block, give it a new id,
and point something at it with `data-view="yourid"`.

---

## Before you share it

Images here are redacted on purpose. District and employer identifiers, employee
names, kiosk IP addresses and organization identifiers have been removed from the
screenshots. Keep it that way if you swap any of them.

The site deliberately does **not** publish the Frontline adoption percentage.
That figure is district-held and restricted from public use. The HR and payroll
case makes its adoption argument through implementation design, utilization
monitoring and exception controls instead.
