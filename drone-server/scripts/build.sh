git clone https://github.com/drone/drone.git

mkdir bin
export GOPATH=$(pwd)/bin

# add oss to -tags as required
cd drone && go install -tags "nolimit" github.com/drone/drone/cmd/drone-server

