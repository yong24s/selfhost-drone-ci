#!/bin/bash

DRONE="/build/drone-server"

if [ ! -f "$DRONE" ]; then
  CLONE_DIR="/tmp/clone"
  GOPATH="/go"

  git clone https://github.com/drone/drone.git $CLONE_DIR

  # add oss to -tags as required
  cd $CLONE_DIR && go install -tags "nolimit" $CLONE_DIR"/cmd/drone-server"

  mv $GOPATH"/bin/drone-server" $DRONE

  rm -rf CLONE_DIR
fi

# Change pwd to a mounted volume so that db file will be saved there
cd "/build"
$DRONE

