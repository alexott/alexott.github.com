#!/bin/sh
#
# File: commit.sh
#
# Created: 31 Jul 2007 by Alex Ott <alex_ott@securecomputing.com>
#

find . -type f -a name \*~ | xargs rm -f
hg addremove
hg commit -m 'Update notes'
