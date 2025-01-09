#!/bin/bash

set -ex # Setting the automatic exit, if we get error. Here -e for exit and -ex for debug

failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal
echo "Hi Good Morning"
echoo "Hi very good morning"
echo "Good Evening"
