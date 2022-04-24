.POSIX:

# Clean `public` submodule
clean:
	rm -rf public

# Generate a clean build of the blog
build: clean
	hugo
