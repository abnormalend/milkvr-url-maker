#!/bin/bash
IFS=$'\n'
videoFolder="/var/www/VR"
urlBase="http://r2/VR/"
echo "<HTML>"
echo "<HEAD><TITLE>My Sideload Videos</TITLE></HEAD>"
echo "<BODY>"
for oneFile in $(ls $videoFolder -1 | sed s/^.*\\/\//)
do
	videotype=$(echo "$oneFile"|sed "s/^.*\.\(.*\)\.mp4$/\1/g")
	name=$(echo "$oneFile"|sed "s/\(^.*\)\..*\.mp4$/\1/g")
	echo "<P><A HREF=\"milkvr://sideload/?url=$urlBase$oneFile&video_type=$videotype\">$name</A>"
done
echo "</BODY></HTML>"
