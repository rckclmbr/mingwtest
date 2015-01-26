#!/bin/bash
docker build -t golang-cross .
docker run -t -i --rm -v "$(pwd)":/opt/go/src/mingwtest -w /opt/go/src/mingwtest golang-cross \
    go build -x .
