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
1. Copy resume site to the main landing page
```bash
    cd _resume_template
    SITE_DIR=../ make site
```
2. Copy and build blog
```bash
    cd ../_blog
    jekyll build --destination ../blog
```
