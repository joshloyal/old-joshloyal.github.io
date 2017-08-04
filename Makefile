export SITE_DIR=$(CURDIR)

BLOG=$(CURDIR)/blog
BLOG_DRAFT=$(CURDIR)/blog
BLOG_DIR=$(CURDIR)/_blog
RESUME=$(CURDIR)/index.html
RESUME_DIR=$(CURDIR)/_resume-template

.PHONY: all build build-draft blog resume serve serve-draft clean



build: clean all

build-draft: clean $(RESUME)
	cd $(BLOG_DIR); jekyll build --draft --destination $(BLOG)

all: $(BLOG) $(RESUME)

serve: build
	python $(CURDIR)/scripts/run_server.py

serve-draft: build-draft
	python $(CURDIR)/scripts/run_server.py

blog: $(BLOG)

resume: $(RESUME)

$(BLOG):
	cd $(BLOG_DIR); jekyll build --destination $(BLOG)

$(RESUME):
	$(MAKE) -C $(RESUME_DIR) site

clean:
	rm -rf $(BLOG)
	$(MAKE) -C $(RESUME_DIR) clean
