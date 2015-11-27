;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Brent Rogers <brentarogers@gmail.com>
;
; Script Function:
;	Creates a basic HTML file full of gearVR links to videos
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

videoFolder := A_ScriptDir
urlBase := "http://" . A_ComputerName . "/VR/"
filename := "index.html"

Loop, %0%  ; For each parameter:
{
    param := %A_Index%  ; Fetch the contents of the variable whose name is contained in A_Index.
	if InStr(param, "--urlbase")
	{
		StringSplit, paramArray, param, "="
		urlBase := paramArray2
	}
	if InStr(param, "--videofolder")
	{
		StringSplit, paramArray, param, "="
		videoFolder := paramArray2
	}	
	if InStr(param, "--filename")
	{
		StringSplit, paramArray, param, "="
		filename := paramArray2
	}
}

searchString := videoFolder . "\*.mp4"

file := FileOpen(videoFolder . "\" . filename, "w")
file.Write("<HTML>`r`n")
file.Write("<HEAD><TITLE>My Sideload Videos</TITLE></HEAD>`r`n")
file.Write("<BODY>`r`n") 

OutputDebug %searchString%`r`n
Loop, %searchString%
{
	file_minus_ext := RegExReplace(A_LoopFileName, "(.*).mp4$", "$1")
	video_type := RegExReplace(file_minus_ext, ".*\.(.*)", "$1")
	name := RegExReplace(file_minus_ext, "(.*)\..*", "$1")
	file.Write("<P><A HREF=""milkvr://sideload/?url=" . urlBase . A_LoopFileName . "&video_type=" . video_type . """>" . name . "</A>`r`n")
}

file.Write("</BODY></HTML>")
file.Close()