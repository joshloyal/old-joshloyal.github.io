BLOG=$(CURDIR)/blog

.PHONY: all blog clean


blog: $(BLOG)


$(BLOG):
	cd _blog; jekyll build --destination $(BLOG)


clean:
	rm -rf $(BLOG)
