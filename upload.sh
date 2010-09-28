#!/bin/sh
#
# File: upload.sh
#
# Created: Tuesday, September 28 2010 by Alex Ott
#

rsync -avrlpm --exclude-from=exclude-list --delete-excluded --delete-during --rsh=ssh ~/projects/my-page-muse/ alexott@simple-hosting.ru:/home/alexott/alexott.net/htdocs/
