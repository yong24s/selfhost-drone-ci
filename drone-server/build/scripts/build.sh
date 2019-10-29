#!/bin/bash

DRONE="/build/drone-server"

if [ ! -f "$DRONE" ]; then
  CLONE_DIR="/tmp/clone"
  GOPATH="/tmp/build"

  git clone https://github.com/drone/drone.git $CLONE_DIR

  # add oss to -tags as required
  cd $CLONE_DIR && go install -tags "nolimit" github.com/drone/drone/cmd/drone-server

  mv $GOPATH"/bin/drone-server" $DRONE

  rm -rf CLONE_DIR GOPATH
fi

$DRONE

