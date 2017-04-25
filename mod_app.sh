#!/bin/bash

# NOTE: This script is executed from the new app's root directory
  
CHAPTER=$1

echo '**************'
echo "BEGIN $CHAPTER"
echo '**************'
cp mod/mod-$CHAPTER/* $PWD
SCRIPT="mod-$CHAPTER.sh"
sh $SCRIPT
# rm mod-$CHAPTER-*
echo '*****************'
echo "FINISHED $CHAPTER"
echo '*****************'
