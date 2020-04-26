#!/bin/bash

#quickly generates the symlinks from universal into the separate environments
set -xe
FILES=`ls _universal/`
STEPS=("0-bootstrap" "1-org" "2-networks" "3-projects")


#validate we're in the right place
if [ ${PWD##*/} == "scripts" ]; then
    echo "call this script from the git root, not from the scripts folder"
    exit
fi

for step in ${STEPS[*]}
do
  #remove possibly symlinks
  pushd ./
  cd $step
  find "./" -type l -delete
  for file in $FILES
  do
    echo "Linking $file into $step"
    ln -s "../_universal/$file" "$file"
  done
  popd
done
