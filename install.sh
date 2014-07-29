#!/bin/bash

# Install the frontend boilerplate
if ! type "git" > /dev/null; then
  # install foobar here
  echo "Frontend boilerplate requires Git to install, please install it then try again."
  exit
fi

if ! type "node" > /dev/null; then
  # install foobar here
  echo "Frontend boilerplate requires Node to install, please install it then try again."
  exit
fi

if [ -z "$1" ]; then
    echo "Please specify a project name. Usage: sh install.sh my-project"
    exit
fi

if [ -d "$1" ]; then
    echo "The directory $1 already exists, please use another name"
    exit
fi

git init "$1"
cd "$1"
git pull git@github.com:gosukiwi/frontend-boilerplate.git
npm install
gulp
