#!/bin/sh
echo $BASH_SOURCE
echo "$(dirname "$BASH_SOURCE")"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR
