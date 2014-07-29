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
 
echo -n "Project name: "
read name

if [ -z "$name" ]; then
    echo "Please specify a project name."
    exit
fi

if [ -d "$name" ]; then
    echo "The directory $name already exists, please use another name"
    exit
fi

git init "$name"
cd "$name"
git pull git@github.com:gosukiwi/frontend-boilerplate.git
npm install
gulp
