export SITE_DIR=$(CURDIR)

BLOG=$(CURDIR)/blog
BLOG_DIR=$(CURDIR)/_blog
RESUME=$(CURDIR)/index.html
RESUME_DIR=$(CURDIR)/_resume-template

.PHONY: all build blog resume serve clean



build: clean all

all: $(BLOG) $(RESUME)

serve: build
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