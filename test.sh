#!/bin/sh
echo $0
echo $@
echo $BASH_SOURCE
echo "$(dirname "${BASH_SOURCE[0]}")"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR
exec $@
