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
 
#echo -n "Project name: "
#read name
while [ -e $NAME ]
do
        echo -n "Project name: "
        read NAME </dev/tty
done

if [ -d "$NAME" ]; then
    echo "The directory $NAME already exists, please use another name"
    exit
fi

git init "$NAME"
cd "$NAME"
git pull git@github.com:gosukiwi/frontend-boilerplate.git
npm install
gulp
