#!/bin/bash

BASE_DIR="`dirname $0`"

cd "$BASE_DIR"
./jruby.sh gem install -i gem_home --no-rdoc --no-ri bundler
