#!/bin/bash
if [ $PWD##*/ != "dr2web" ]; then
    echo "Please cd to the root directory of dr2web and restart with bin/apply_chTitle.sh"
    exit 1
fi
for file in $(find . -name \*.html) ; do
    bin/chTitle.pl $file
done
