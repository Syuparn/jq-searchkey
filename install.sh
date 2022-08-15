#!/bin/bash

# -e: Exit immediately if a command exits with a non-zero status.
# -u: Treat unset variables as an error when substituting.
# -x: Print commands and their arguments as they are executed.
set -eux

LOCATION=~/.jq-searchkey
CONFIG_FILE=~/.bashrc

mkdir -p $LOCATION
# NOTE: since executable is not stand-alone, a whole repository is required!
git -C $LOCATION clone https://github.com/Syuparn/jq-searchkey.git
chmod +x $LOCATION/jq-searchkey/jq-searchkey

# add the directory to PATH
cat <<EOS >> $CONFIG_FILE
# https://github.com/Syuparn/jq-searchkey
export PATH=$LOCATION/jq-searchkey:\$PATH
EOS
source $CONFIG_FILE
