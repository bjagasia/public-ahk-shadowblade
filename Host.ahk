; #SingleInstance force
; if !InStr(A_AhkPath, "_UIA.exe")
; {
; 	newPath := RegExReplace(A_AhkPath, "\.exe", "U" (A_PtrSize * 8) "_UIA.exe")
; 	Run % StrReplace(DllCall("Kernel32\GetCommandLine", "Str"), A_AhkPath, newPath)
; 	ExitApp
; }

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance

; #InstallKeybdHook

;-------------------------------------------------------
; AUTO EXECUTE SECTION FOR INCLUDED SCRIPTS
; Scripts being included need to have their auto execute
; section in a function or subroutine which is then
; executed below.
;-------------------------------------------------------
Gosub, gui_autoexecute
;-------------------------------------------------------
; END AUTO EXECUTE SECTION
return
;-------------------------------------------------------

; Load the GUI code
#Include %A_ScriptDir%\GUI\GUI.ahk

; General settings
#Include %A_ScriptDir%\Miscellaneous\miscellaneous.ahk

; ALT + G Google Search
#Include %A_ScriptDir%\look_up.ahk

; TrayIcon Lib
#Include TrayIcon.ahk

; Chrome Lib
#Include Chrome.ahk

