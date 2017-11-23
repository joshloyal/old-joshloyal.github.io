# website
Content for my Personal Website

To update the repo
1. Update submodules
```bash
git submodule update --recursive --remote
```
2. Update main repo
```bash
git pull
```

To generate the site
1. To serve a site with blog drafts
```bash
    make serve-draft
```
2. To build and serve the site for publication
```bash
    make serve
```
