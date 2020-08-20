#!/bin/bash
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# SCRIPT:  ./script.sh
#
#   This script is an entry point to another scrip
#    at `/project/templates/jangsymtmp.sh`
#   if you are having trouble with this 
#    just navigate there.
#
# AUTHOR:  shanerowden
# LICENSE:  gpl 3.0
#
# DESCRIPTION: a django utility for consolidating templates
#               to a single directory using symlinks.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #

PROJPATH="./project/templates/"
SCRIPT="./djangsymtmp.sh"

[[ -d $PROJPATH ]] && cd $PROJPATH || {
    mkdir -p $PROJPATH ;
    cd $PROJPATH
}

[[ -f $SCRIPT ]] && bash $SCRIPT || {
    echo "This script is having trouble reaching $PROJPATH/$SCRIPT. You can just navigate there and execute that."
}
