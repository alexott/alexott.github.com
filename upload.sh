#!/bin/sh
#
# File: upload.sh
#
# Created: Tuesday, September 28 2010 by Alex Ott
#

OS=`uname -s`
MPOINT=/Volumes/alexott.net/
if [ "$OS" = "Darwin"  ]; then
    MPOINT=/Volumes/alexott.net/   
elif [ "$OS" = "Linux" ]; then
    MPOINT=/mnt/alexott.net/
else
    echo "Unsupported OS! $OS"
    exit 1
fi
if [ ! -d $MPOINT ]; then
    mkdir $MPOINT
fi
if [ ! -f $MPOINT/index.html ]; then
    s3fs www.alexott.net $MPOINT -olocal,ping_diskarb,volname=AlexOttNet
fi

rsync -avrlpm --exclude-from=exclude-list --delete-excluded --delete-during --rsh=ssh ~/projects/my-page-muse/ $MPOINT
