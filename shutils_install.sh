#!/bin/sh

# Add this directory to the $PATH if not yet in the profile
cd `dirname $0`
dir=`pwd`
profile=~/.bash_profile
requirements="php"

line="export PATH=\$PATH:$dir"
if [ -f $profile ]; then
    found=`grep "$line" $profile`
else
    found=""
fi

if [ "$found" -a "$1" != "-f" ]; then
    echo "ERROR: Looks like the path is already in your `basename $profile`"
    echo "ERROR: Try sourcing the profile: \". $profile\""
    echo "ERROR: Re-run with -f to force if it still doesn't work"
else
    for req in $requirements
    do
        prog=`which $req`

        if [ "$prog" ]; then
            echo "Using $prog"
        else
            echo "WARNING: Some of these scritps require '$req'"
        fi
    done

    echo $line >> $profile
    echo "Added \"$line\" to your `basename $profile`. Please source it now"
    echo "-> run \". $profile\""
fi


