.POSIX:

OPENRING_PATH="layouts/partials/openring.html"

# Clean `public` submodule
clean:
	cd public \
		&& git checkout master \
		&& git reset --hard origin/master
	rm -rf public/*


# Generate updated openring section html
update-openring:
	./openring/openring \
		-s https://drewdevault.com/blog/index.xml \
		-s https://nullprogram.com/feed \
		-s https://danluu.com/atom.xml \
		< openring.template > $(OPENRING_PATH)


# Generate a clean build of the blog
build: clean update-openring
	hugo


# Generate static content and push it to submodule's repository
TITLE := ""
release: build
	git diff --quiet $(OPENRING_PATH) || \
		(git add $(OPENRING_PATH) && git commit -m 'Update openring')
	CURRENT_REF=$$(git log -1 --pretty="%s") && TITLE="$(TITLE)" \
	&& cd public && git diff --quiet || \
		(git add . && git commit -m "Release$${TITLE:+ - $$TITLE}" && git push)
	git diff --quiet public || \
		(git add public && git commit -m "Update submodule ref" )
	git push

