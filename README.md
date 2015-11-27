# milkvr-url-maker
Script to generate basic HTML that can be used to sideload videos from your local PC to the milkVR application.

##Runtime arguments
The autohotkey version has several options built into it.
 -  --urlbase will override the main URL being assigned to the links.  The default if not specified is http://<HOSTNAME>/VR.
 -  --videofolder is the folder to scan for videos, and where to place the html file that it creates.  The default is the folder that it is being run from.
 -  --filename is the file to place into the video folder with the links.  the default is index.html.
