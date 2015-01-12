#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
EMAILS="$DIR/emails.txt"
RECIPE="$DIR/recipes/appledaily_tw.recipe"
DATE=`date "+%Y-%m-%d"`
FILENAME="$DATE.mobi"
OUTPUT="$DIR/output/$FILENAME"
OUTPROFILE="kindle"

# Get news feeds accroding to recipe and output as kindle book
echo "Printing..."
mkdir -p "$DIR/output"
xvfb-run ebook-convert "$RECIPE" "$OUTPUT" --output-profile "$OUTPROFILE"

# Preparing email lists
MAILLIST=""
exec < $EMAILS
while read line
do
	MAILLIST=$MAILLIST'{"email": "'$line'", "name": "kindle", "type": "to"},'
done
MAILLIST=$(echo $MAILLIST | gawk '{print substr($0, 0, length($0)-1)}')

# Packing with base64 and embedded in .json for mandrill
echo "Packing..."
CONTENT=$(base64 -w 0 $OUTPUT)
echo "{s|CONTENT|$CONTENT|}" > "$DIR/data.tmp"
sed -e "s/API_KEY/$API_KEY/" \
    -e "s/FILENAME/$FILENAME/" \
    -e "s/MAILLIST/$MAILLIST/" \
    "$DIR/mail_template.json" | 
    sed -f "$DIR/data.tmp" > "$DIR/send.tmp"

# Sending with mandrill
echo "Throwing..."
curl -A 'Mandrill-Curl/1.0' -d '@'$DIR/send.tmp 'https://mandrillapp.com/api/1.0/messages/send.json'