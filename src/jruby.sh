#!/bin/bash

# directory where this script resides
BASE_DIR="`dirname $0`"

# faster startup time, no verification of classes, no waiting for entropy to build in /dev/random
JRUBY_BASE_OPTS='-J-noverify -J-Djava.security.egd=file:/dev/./urandom'

# trade even shorter startup time for less than optimal runtime performance
JRUBY_STARTUP_TIME_OPTS='-Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -Xcompile.mode=OFF'

# memory settings
MEM_OPTS='-J-Xms2048m -J-Xmx2048m -J-XX:MaxPermSize=256m'
export JRUBY_OPTS="$JRUBY_BASE_OPTS $JRUBY_STARTUP_TIME_OPTS $MEM_OPTS"

# run jruby command, passing all incoming arguments to JRuby
PATH="$BASE_DIR/bin:$BASE_DIR/gem_home/bin:$PATH" \
GEM_HOME="$BASE_DIR/gem_home" \
GEM_PATH="$BASE_DIR/gem_home" \
java -cp $(echo lib/*.jar | tr ' ' ':') \
org.jruby.Main -S "$@"
