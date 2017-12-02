export SITE_DIR=$(CURDIR)

RESUME=$(CURDIR)/index.html
RESUME_DIR=$(CURDIR)/_resume-template

.PHONY: all build resume serve clean

build: clean all

all: $(RESUME)

serve: build
	python $(CURDIR)/scripts/run_server.py

resume: $(RESUME)

$(RESUME):
	$(MAKE) -C $(RESUME_DIR) site

clean:
	$(MAKE) -C $(RESUME_DIR) clean
