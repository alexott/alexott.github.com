#!/bin/sh
#
# File: generate-sitemap.sh
#
# Created: Wednesday, April  2 2008 by Alex Ott
#

FILE=sitemap.xml

echo '<?xml version="1.0" encoding="UTF-8"?>' > $FILE
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> $FILE
find . -name \*.html -o -name \*.pdf| xargs ls -ls |awk '{print "<url><loc>" $9 "</loc>\n<lastmod>" $7 "</lastmod></url>"}'|sed -e 's|\.\/|http://xtalk.msk.su/~ott/|' >> $FILE
echo '</urlset>' >> $FILE
