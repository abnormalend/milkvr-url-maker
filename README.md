# milkvr-url-maker

Script to generate basic HTML that can be used to sideload videos from your local PC to the milkVR application.

## Runtime arguments

The autohotkey version has several options built into it.

-   --urlbase will override the main URL being assigned to the links.  The default if not specified is http://<HOSTNAME>/VR.
-   --videofolder is the folder to scan for videos, and where to place the html file that it creates.  The default is the folder that it is being run from.
-   --filename is the file to place into the video folder with the links.  the default is index.html.

## The Basics

If you already have a web server running and configured, just drop this in the folder with your VR video files and run it, and it will create milkvr:// links to each.  The files do need to be named in the same way that milkvr would expect them if you were copying to your phone's storage.

### Don't already have a webserver?  (assumes you're on windows)

-   Download nginx. (http://nginx.org/en/download.html)
-   Unzip somewhere on your system
-   Enter the nginx folder, then the html folder.
-   For the default settings, create a folder within html called VR.
-   Copy some VR videos (named correctly) to this folder, and the url maker.
-   Run the URL maker.
-   Go back to the main nginx folder and run nginx.exe.  If you have windows firewall turned on, you should get prompted about allowing it.
-   Test it out, visit http://your PC hostname/VR from your browser

### Video really slow to start playing?

MP4 files need to be "web optimized" in order to play without downloading the whole file.  Videos already intended for streaming probably have had this done.  Other videos can be re-encoded in a program like handbrake to make them web optimized.  Doing so puts the metadata at the beginning of the file instead of the end, so it doesn't need to retrieve the whole thing before playback can start.

### Video is stuttering?

I've had several files that were very high resolution/bitrate, and they were constantly buffering while trying to stream them over my wifi.  MilkVR can play H.265 (aka HEVC) files.  Re-encoding in this codec shrinks the file significantly, saving both disk space and the network speed required to stream the file.
