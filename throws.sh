#!/bin/bash
set -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# Recipe file (more: https://github.com/kovidgoyal/calibre/tree/master/recipes)
RECIPEFILE="$DIR/recipes/$RECIPE.recipe"
# Generate for kindle device
OUTPROFILE="kindle"

DATE=`date "+%Y-%m-%d"`
FILENAME="$RECIPE-$DATE.mobi"
OUTPUT="$DIR/output/$FILENAME"

# Get news feeds accroding to recipe and output as kindle book
echo "Printing..."
mkdir -p "$DIR/output"
xvfb-run ebook-convert "$RECIPEFILE" "$OUTPUT" --output-profile "$OUTPROFILE"

# Preparing email lists
MAILLIST=""
exec < $EMAILS
while read line
do
	MAILLIST=$MAILLIST'{"email": "'$line'", "name": "'$line'", "type": "to"},'
done
MAILLIST=$(echo $MAILLIST | gawk '{print substr($0, 0, length($0)-1)}')

# Packing with base64 and embedded in .json for mandrill
echo -e "\nPacking..."
CONTENT=$(base64 -w 0 $OUTPUT)
echo "{s|CONTENT|$CONTENT|}" > "$DIR/$RECIPE.tmp"
sed -e "s/API_KEY/$API_KEY/" \
    -e "s/SENDER/$SENDER/" \
    -e "s/FILENAME/$FILENAME/" \
    -e "s/MAILLIST/$MAILLIST/" \
    "$DIR/mail_template.json" | 
    sed -f "$DIR/$RECIPE.tmp" > "$DIR/$RECIPE.send.tmp"

# Sending with mandrill
echo -e "\nThrowing..."
curl -A 'Mandrill-Curl/1.0' -d '@'$DIR/$RECIPE.send.tmp \
    'https://mandrillapp.com/api/1.0/messages/send.json'
echo -e "\n\nDone."
