.POSIX:

# Clean `public` submodule
clean:
	rm -rf public


# TODO: Add a page about the blogs I follow/like and remove this piece of code
# update-openring: # Generate updated openring section html
# 	./openring/openring \
# 		-s https://drewdevault.com/blog/index.xml \
# 		-s https://nullprogram.com/feed \
# 		-s https://danluu.com/atom.xml \
# 		-s https://jvns.ca/atom.xml \
# 		-s http://www.brendangregg.com/blog/rss.xml \
# 		< openring.template > $(OPENRING_PATH)


# Generate a clean build of the blog
build: clean
	hugo
