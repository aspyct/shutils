#!/bin/sh

# Add this directory to the $PATH if not yet in
cd `dirname $0`
dir=`pwd`

line="export PATH=\$PATH:$dir"
found=`grep "$line" ~/.profile`

if [ "$found" ]; then
    if [ "$1" != "-f" ]; then
        echo "Looks like the path is already in your .profile"
        echo "\tTry sourcing the profile: \". ~/.profile\""
        echo "\tRe-run with -f to force if it still doesn't work"
        exit
    fi
fi

echo $line >> ~/.profile
echo "Added \"$line\" to your ~/.profile. Please source it now"
echo "-> run \". ~/.profile\""
