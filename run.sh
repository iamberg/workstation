#!/bin/bash

sudo apt update 
sudo apt install -y git make

FOLDER=projects/personal
GIT_USER=iamberg
GIT_REPO=workstation
GIT_BRANCH=main
URL=https://github.com/$GIT_USER/$GIT_REPO.git

cd ~ || exit
mkdir -p $FOLDER
cd $FOLDER || exit
if [ ! -d "$GIT_REPO" ] ; then
  git clone -b $GIT_BRANCH $URL $GIT_REPO
else
  echo "Didn't clone repo since folder exists"
fi

sudo chown -R "$USER:$USER" $GIT_REPO
sudo chmod -R 755 $GIT_REPO

cd $GIT_REPO || exit
