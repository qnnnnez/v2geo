#!/bin/bash
V2RAY_UPSTREAM="https://github.com/v2ray/v2ray-core.git"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TMP_DIR="$DIR/tmp"
REPO_DIR="$TMP_DIR/v2ray.com/core"
mkdir -p $REPO_DIR

if [[ -d $REPO_DIR/.git ]]; then
    pushd $REPO_DIR
    git pull
    popd
else
    git clone $V2RAY_UPSTREAM $REPO_DIR
fi

for proto in /app/router/config.proto /common/net/{port,network}.proto; do
    protoc -I$TMP_DIR --python_out=$DIR $REPO_DIR$proto
done
