#!/bin/zsh
#
# File: generate-sitemap.sh
#
# Created: Wednesday, April  2 2008 by Alex Ott
#

export LC_TIME=C
FILE=sitemap.xml

echo '<?xml version="1.0" encoding="UTF-8"?>' > $FILE
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> $FILE

for file in **/*.html **/*.pdf ; do
    DFILE=`dirname "$file"`
    MFILE=$DFILE/`basename "$file" .html`.muse
    if [ -L "$file" ] ; then
        echo "$file is symbolic link!"
    elif [ -L "$DFILE" ] ; then
        echo "directory is symbolic link!"
    elif [ -f "$MFILE" ]; then
        MTIME=`ls -l --time-style='full-iso' "$MFILE" |awk '{print $6}'`
        echo "MTIME=$MTIME MFILE=$MFILE"
        echo "<url><loc>http://alexott.net/$file</loc>\n<lastmod>$MTIME</lastmod></url>" >> $FILE
    else
        ls -l --time-style='full-iso' "$file" |awk '{print "<url><loc>http://alexott.net/" $9 "</loc>\n<lastmod>" $6 "</lastmod></url>"}' >> $FILE
    fi
done

echo '</urlset>' >> $FILE
