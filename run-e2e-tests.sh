#!/bin/bash

DEFAULT_FILE=./protractor.conf.js
TEST_FILE=${TEST_FILE:=$DEFAULT_FILE}

cd $HOME

Xvfb :21 -screen 0 1024x768x24 &
export DISPLAY=:21

echo "Starting webdriver"
webdriver-manager start --standalone &
echo "Finished starting webdriver"

sleep 10

echo "Running Test"
protractor $TEST_FILE
a=$?
echo "Done running test"
exit $a
