.POSIX:


# Generate updated openring section html
update-openring:
	./openring/openring \
		-s https://drewdevault.com/blog/index.xml \
		-s https://nullprogram.com/feed \
		-s https://danluu.com/atom.xml \
		< openring.template > layouts/partials/openring.html

# Generate static content and push it to submodule's repository
release: update-openring
	git push
	cd public \
		&& git checkout master
	hugo
	CURRENT_REF=$$(git log -1 --pretty="%h %s") \
		&& cd public \
			&& git add . \
			&& git commit -m "Release - $$CURRENT_REF" \
			&& git push
	git add public
	git commit -m "Update submodule ref"
	git push

# Clean `public` submodule
clean:
	cd public \
		&& git reset --hard origin/master

	
