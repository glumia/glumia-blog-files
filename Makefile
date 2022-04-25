.POSIX:

# Remove hugo generated files
clean:
	rm -rf public resources

# Generate a clean build of the blog
build: clean
	hugo
