#!/usr/bin/env bash

SOURCE_ENV=""

while getopts ":e:" opt; do
  case $opt in
    e)
      if [ -d envs/$OPTARG ]; then
          SOURCE_ENV="envs/$OPTARG";
          echo "Environment is $OPTARG";
      else
          echo "Invalid Environment, must be a directory!";
          exit 2;
      fi;
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2;
      exit 1;
      ;;
  esac
done

git pull origin master;

function doIt() {
    rsync --exclude ".git/" \
          --exclude ".DS_Store" \
          --exclude ".osx" \
          --exclude "bootstrap.sh" \
          --exclude "README.md" \
          --exclude "LICENSE-MIT.txt" \
          --exclude "requirements-user.txt" \
          --exclude "envs" \
          -avh --no-perms . ~;
    if [ $SOURCE_ENV != "" ]; then
        rsync -avh --no-perms $SOURCE_ENV/ ~;
    fi;
    pip install --user -r requirements-user.txt
    source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
