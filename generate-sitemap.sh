#!/bin/sh
#
# File: generate-sitemap.sh
#
# Created: Wednesday, April  2 2008 by Alex Ott
#

export LC_TIME=C
FILE=sitemap.xml

echo '<?xml version="1.0" encoding="UTF-8"?>' > $FILE
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> $FILE
find . -name \*.html -a -type f -print0| xargs -0 ls -l --time-style='full-iso' |awk '{print "<url><loc>" $9 "</loc>\n<lastmod>" $6 "</lastmod></url>"}'|sed -e 's|\.\/|http://alexott.net/|' >> $FILE
find . -name \*.pdf  -a -type f -print0| xargs -0 ls -l --time-style='full-iso' |awk '{print "<url><loc>" $9 "</loc>\n<lastmod>" $6 "</lastmod></url>"}'|sed -e 's|\.\/|http://alexott.net/|' >> $FILE
echo '</urlset>' >> $FILE
