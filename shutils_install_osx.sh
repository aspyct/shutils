#!/bin/sh

# Add this directory to the $PATH if not yet in the profile
cd `dirname $0`
dir=`pwd`
profile=~/.profile

line="export PATH=\$PATH:$dir"
found=`grep "$line" $profile`

if [ "$found" -a "$1" != "-f" ]; then
    echo "ERROR: Looks like the path is already in your .profile"
    echo "ERROR: Try sourcing the profile: \". $profile\""
    echo "ERROR: Re-run with -f to force if it still doesn't work"
else
    echo $line >> $profile
    echo "Added \"$line\" to your $profile. Please source it now"
    echo "-> run \". $profile\""
fi
