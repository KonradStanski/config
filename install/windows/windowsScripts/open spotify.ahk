#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 3
winTitle = spotify

^m::
if !WinExist(winTitle) {
    Run "C:\Users\Konrad\AppData\Roaming\Spotify\Spotify.exe"
}
else {
    WinHide, %winTitle%
}
