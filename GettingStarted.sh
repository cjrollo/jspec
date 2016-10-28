!#/bin/ash

# Getting started with jRuby
# Step 1: launch a container
#   Note: this command mounts a local dir 'demo' as '/home/demo' inside the container
#     thus, any code in the local 'demo' folder is immediately available to container!
docker run -it --rm -v $(pwd)/demo:/home/demo openjdk:8u92-jdk-alpine ash
#   TL;DR to get coding now (Step 8), execute...
# docker run -it --rm -v $(pwd)/demo:/home/demo rollo/jspec:jalpine892

# Step 2: install an editor
apk update
apk add vim   # and why not? ;-)

# Step 3: install jRuby
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update
apk add jruby
# install optional subpackages, if you need them
apk add jruby-irb jruby-maven jruby-minitest jruby-rdoc jruby-rake jruby-testunit

# Step 4: validate the jRuby install
jruby -v

## To dive into BDD/TDD, using Rspec with jRuby, check out this post:
## http://www.tweakstreet.io/blog/2015/2/9/using-standalone-jruby-and-rspec-to-test-your-java-projects
## What follows is a "manual" setup
# Step 5: install Rspec
jruby -S gem install rspec

# Step 6: validate the Rspec install
jruby -S rspec

# Step 7: create a non-root user
adduser -D 'dev' # WARNING: the -D flag creates a user without a password

# Step 8: get coding...
su - 'dev'
cd /home/demo
# setup your project to use rspec
jruby -S rspec --init
# modify configuration as needed
vim spec/spec_helper.rb
# Run some simple "java"
jruby /home/demo/helloWorld.rb   # or... jruby --dev ./helloWorld.rb
# Run some simple "spec"
jruby -S rspec --format doc /home/demo/spec/hello_world_spec.rb
# Run any existing specs
jruby -S rspec --format doc
