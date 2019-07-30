#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

DetectHiddenWindows, On ;Detect Spotify even if it's minimized
#IfWinExist ahk_class SpotifyMainWindow ;Only do the following if Spotify is running
spotify = ahk_class SpotifyMainWindow ;Set variable for Spotify Window Name


^Right::Media_Next


^Left::Media_Prev

^Rshift::Media_Play_Pause

{
	WinGetTitle, spotify_playing, %spotify% ;Get the title of Spotify which contains the track-name

	StringTrimLeft, trimmed_playing, spotify_playing, 10 ;Get rid of extra text and place into 'trimmed_playing'
	StringReplace, replaced_playing, trimmed_playing, –, -, All ;Replace en dash with normal dash and place into 'replaced_playing'

	clipboard = %replaced_playing% ;Copy the fixed text to clipboard
	return
}


{
	ControlSend, ahk_parent, ^{Down}, %spotify%
	return
}


GetContextMenuItemText(hMenu, nPos)
{
	length := DllCall("GetMenuString"
			, "UInt", hMenu
			, "UInt", nPos
			, "UInt", 0 ; NULL
			, "Int", 0  ; Get length
			, "UInt", 0x0400)   ; MF_BYPOSITION
		VarSetCapacity(lpString, length + 1)
		length := DllCall("GetMenuString"
			, "UInt", hMenu
			, "UInt", nPos
			, "Str", lpString
			, "Int", length + 1
			, "UInt", 0x0400)
	return lpString
}
