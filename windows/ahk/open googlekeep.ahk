#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


SetTitleMatchMode, 3
winTitle = Google Keep

#i::
if !WinExist(winTitle) {
    Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --profile-directory=Default --app-id=hmjkmjkepdijhoojdojkdfohbdgmmhki
}
else {
    WinHide, %winTitle%
}
