; Note: Code below allows elevated processed to be terminated by AHK. You have to ensure you have AHK 
; ; installed with X64 as default. 
; #SingleInstance force
; if !InStr(A_AhkPath, "_UIA.exe")
; {
; 	newPath := RegExReplace(A_AhkPath, "\.exe", "U" (A_PtrSize * 8) "_UIA.exe")
; 	Run % StrReplace(DllCall("Kernel32\GetCommandLine", "Str"), A_AhkPath, newPath)
; 	ExitApp
; }

if A_Is64bitOS && A_PtrSize != 8
{
    ahkPath := RegExReplace(A_AhkPath, "AutoHotkey(U.+)?\.exe", "AutoHotkeyU64.exe")
    Run % """" ahkPath """" StrReplace(DllCall("GetCommandLine", "str"), """" A_AhkPath """")
    ExitApp
}

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. Take inspiration from the samples provided here.

;-------------------------------------------------------------------------------
;;; SEARCH GOOGLE ;;;
;-------------------------------------------------------------------------------
if BSIO = g%A_Space% ; Search Google 
{
    gui_search_title = LMGTFY
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if BSIO = a%A_Space% ; Search Google for AutoHotkey related stuff
{
    gui_search_title = Autohotkey Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if BSIO = l%A_Space% ; Search Google with ImFeelingLucky
{
    gui_search_title = I'm Feeling Lucky
    gui_search("http://www.google.com/search?q=REPLACEME&btnI=Im+Feeling+Lucky")
}
else if BSIO = m%A_Space% ; Open more than one URL
{
    gui_search_title = multiple
    gui_search("https://www.google.com/search?&q=REPLACEME")
    gui_search("https://www.bing.com/search?q=REPLACEME")
    gui_search("https://duckduckgo.com/?q=REPLACEME")
}
else if BSIO = x%A_Space% ; Search Google as Incognito
;   A note on how this works:
;   The function name "gui_search()" is poorly chosen.
;   What you actually specify as the parameter value is a command to run. It does not have to be a URL.
;   Before the command is run, the word REPLACEME is replaced by your input.
;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
{
    gui_search_title = Google Search as Incognito
    gui_search("C:\Program Files\Google\Chrome\Application\chrome.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
}


;-------------------------------------------------------------------------------
;;; SEARCH OTHER THINGS ;;;
;-------------------------------------------------------------------------------
else if BSIO = f%A_Space% ; Search Facebook
{
    gui_search_title = Search Facebook
    gui_search("https://www.facebook.com/search/results.php?q=REPLACEME")
}
else if BSIO = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}

else if BSIO = the%A_Space% ; Thesaurus
{
    gui_search_title = Thesaurus
    gui_search("https://www.thesaurus.com/browse/REPLACEME")
}

else if BSIO = ncontrol%A_Space% ; NIST 800-53 R5 Control Search
{
    gui_search_title = NIST 800-53 R5 Control Search - CASE SENSITIVE!
    gui_search("https://csrc.nist.gov/projects/cprt/catalog#/cprt/framework/version/SP_800_53_5_1_0/home?element=REPLACEME")
}

else if BSIO = nkey%A_Space% ; NIST 800-53 R5 Control Keyword Search
{
    gui_search_title = NIST 800-53 R5 Control Keyword Search
    gui_search("https://csrc.nist.gov/projects/cprt/catalog#/cprt/framework/version/SP_800_53_5_1_0/home?keyword=REPLACEME")
}


else if BSIO = cart%A_Space% ; Search CMS Technical Reference Architecture
{
    gui_search_title = Search CMS Ref Architecture
    gui_search("https://www.cms.gov/tra/Content/Search.htm?q=REPLACEME")
}

else if BSIO = ndef%A_Space% ; NIST Definition
{
    gui_search_title = NIST Definition
    gui_search("https://csrc.nist.gov/glossary?keywords-lg=REPLACEME")
}

else if BSIO = cmvp%A_Space% ; CMVP Search
{
    gui_search_title = Search CMVP
    gui_search("https://csrc.nist.gov/projects/cryptographic-module-validation-program/validated-modules/search?SearchMode=Basic&ModuleName=REPLACEME&CertificateStatus=Active&ValidationYear=0")
}


else if BSIO = frmarket%A_Space% ; Search FR Marketplace # need to be updated to support FR new website
{
    gui_search_title = Search FedRAMP Marketplace
    gui_search("https://marketplace.fedramp.gov/#!/products?sort=productName&productNameSearch=REPLACEME")
}

else if BSIO = t%A_Space% ; Search torrent networks
{
    gui_search_title = Sharing is caring
    gui_search("https://kickass.to/usearch/REPLACEME")
}
else if BSIO = jp ; Translate English to Japanese
{
    gui_search_title = English to Japanese
    gui_search("https://translate.google.com/#en/ja/REPLACEME")
}

else if BSIO = li%A_Space% ; Search LinkedIn
{
    gui_search_title = Search LinkedIn
    gui_search("https://www.linkedin.com/search/results/all/?keywords=REPLACEME")
}

;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if BSIO = / ; Go to subreddit. This is a quick way to navigate to a specific URL.
{
    gui_search_title := "/r/"
    gui_search("https://www.reddit.com/r/REPLACEME")
}


else if BSIO = clock ; clock app
{
    gui_destroy()
    run explorer.exe shell:Appsfolder\Microsoft.WindowsAlarms_8wekyb3d8bbwe!App
}


else if BSIO = blk ; clean screen / black screen
{
    gui_destroy()
    run https://www.youtube.com/watch?v=AjWfY7SnMBI&t=171s&ab_channel=CandRfun
}




else if BSIO = Instap ; Instapaper
{
    gui_destroy()
    run https://www.instapaper.com/u
}




else if BSIO = ama%A_Space% ; Amazon Search
{
    gui_search_title = Search Amazon.com
    gui_search("https://www.amazon.com/s?k=REPLACEME&crid=1G4RZ6T4I6AZT&sprefix=REPLACEME%2Caps%2C64&ref=nb_sb_noss_2")
}





else if BSIO = awsscope ; AWS Services in Scope - FedRAMP
{
    gui_destroy()
    run https://aws.amazon.com/compliance/services-in-scope/FedRAMP/
}




else if BSIO = github ;  GitHub
{
    gui_destroy()
    run https://github.com/
}


else if BSIO = zrec ;  zoom recordings
{
    gui_destroy()
    run https://zoom.us/recording/management
}


else if BSIO = red ; reddit.com
{
    gui_destroy()
    run www.reddit.com
}

else if BSIO = gphotos ; Google Photos
{
    gui_destroy()
    run https://photos.google.com/
}


else if BSIO = gmail ; Google Mail
{
    gui_destroy()
    run https://mail.google.com/mail/u/0/
}


else if BSIO = gcal ; Google Calendar
{
    gui_destroy()
    run https://www.google.com/calendar
}
else if BSIO = note ; Notepad
{
    gui_destroy()
    Run Notepad
}
else if BSIO = paint ; MS Paint
{
    gui_destroy()
    run "C:\Windows\system32\mspaint.exe"
}


else if BSIO = lin ; Linkedin.com
{
    gui_destroy()
    run www.linkedin.com
}



else if BSIO = market ; FedRAMP Marketplace
{
    gui_destroy()
    run https://marketplace.fedramp.gov/#!/products?sort=productName
}

else if BSIO = gmaps ; Google Maps
{
    gui_destroy()
    run https://www.google.com/maps/
}
else if BSIO = ginbox ; Open google inbox
{
    gui_destroy()
    run https://inbox.google.com/u/0/
    ; run https://mail.google.com/mail/u/0/#inbox  ; Maybe you prefer the old gmail
}
else if BSIO = mes ; Opens Facebook unread messages
{
    gui_destroy()
    run https://www.facebook.com/messages?filter=unread&action=recent-messages
}
else if BSIO = url ; Open an URL from the clipboard (naive - will try to run whatever is in the clipboard)
{
    gui_destroy()
    run %ClipBoard%
}



else if BSIO = slack ; Open slack
{
    gui_destroy()
    DetectHiddenWindows, Off
    Process, Exist, slack.exe
    slackPid = %ErrorLevel%
    IfWinNotExist, ahk_pid %slackPid%
    {
        TrayIcon_Button("slack.exe")
        Run %slack%
    }
    Else
    {
        IfWinActive, ahk_pid %slackPid%
        {
            WinActivate, ahk_pid %slackPid%
        }
        Else
        {
            Run %slack%
            WinActivate, ahk_pid %slackPid%
        }
    }
    return
}

else if BSIO = teams ; Open Teams
{
    gui_destroy()
    DetectHiddenWindows, Off
    Process, Exist, Teams.exe
    teamsPid = %ErrorLevel%
    IfWinNotExist, ahk_pid %teamsPid%
    {
        TrayIcon_Button("Teams.exe")
        Run %teams%
    }
    Else
    {
        IfWinActive, ahk_pid %teamsPid%
        {
            WinActivate, ahk_pid %teamsPid%
        }
        Else
        {
            WinActivate, ahk_pid %teamsPid%
        }
    }
    return
}



else if BSIO = zoom ; Open Zoom
{
    gui_destroy()
    DetectHiddenWindows, On
    Process, Exist, Zoom.exe
    zoomPid = %ErrorLevel%
    IfWinNotExist, ahk_pid %zoomPid% WinActivate, ahk_class ZPContentViewWndClass
    IfWinNotExist, ahk_pid %zoomPid% WinActivate, ahk_class ZPContentViewWndClass
    {
        TrayIcon_Button("zoom.exe") ahk_pid %zoomPid% ahk_class ZPContentViewWndClass
        WinRestore, ahk_class ZPContentViewWndClass
        WinActivate, ahk_class ZPContentViewWndClass
    }
    Else
    {
        IfWinActive, ahk_class ZPContentViewWndClass
        IfWinActive, ahk_class ZPPTMainFrmWndClassEx
        IfWinActive, ahk_class ZPFTEWndClass
        {
            WinActivate, ahk_class ZPContentViewWndClass
            WinRestore, ahk_class ZPContentViewWndClass
            WinActivate, ahk_class ZPPTMainFrmWndClassEx
            WinRestore, ahk_class ZPFTEWndClass

        }
        Else
        {
            WinActivate, ahk_class ZPContentViewWndClass
            WinRestore, ahk_class ZPContentViewWndClass
            WinActivate, ahk_class ZPPTMainFrmWndClassEx
            WinRestore, ahk_class ZPFTEWndClass
        }
    }
    return
}




else if BSIO = obi ; Obsidian Quick Capture Note
{
    gui_destroy()
        global hidden_obsidian_window_id

        window_id := WinExist("ahk_exe Obsidian.exe")

        ; If app window exists (hidden windows are ignored by WinExist)
        if (window_id) {
            ; Check if it's focused
            if (WinActive("ahk_id " . window_id)) {
                ; Activate previous window
                Send !{Esc}
                ; Save window id and hide
                hidden_obsidian_window_id := window_id
                WinHide, % "ahk_id " . window_id
            } else {
                ; Focus
                WinActivate, % "ahk_id " . window_id
                Run "REPLACE_ME_WITH_YOUR_OBI_VAULT_URL_API"
            }
        } else {
            if (hidden_obsidian_window_id) {
                ; Unhide
                WinShow, % "ahk_id " . hidden_obsidian_window_id
                WinActivate, % "ahk_id " . hidden_obsidian_window_id
                Run "REPLACE_ME_WITH_YOUR_OBI_VAULT_URL_API"
                hidden_obsidian_window_id := false
            } else {
                ; Launch the app
                SendMode Input
                SetWorkingDir, %A_ScriptDir%
                SetTitleMatchMode, RegEx
                WinActivate, i) Obsidian
                EnvGet, A_LocalAppData, LocalAppData
                Run "REPLACE_ME_WITH_YOUR_OBI_VAULT_URL_API"
            }
        }
        return
}


;---------------------------------------------------------- ---------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if BSIO = rel ; Reload this script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}
else if BSIO = dir ; Open the directory for this script
{
    gui_destroy()
    Run, %A_ScriptDir%
}
else if BSIO = host ; Edit host script
{
    gui_destroy()
    run, %code% "%A_ScriptFullPath%"
}
else if BSIO = edit ; Edit GUI user commands
{
    gui_destroy()
    run, %code% "%A_ScriptDir%\GUI\UserCommands.ahk"
}

else if BSIO = env ; Edit Env Variables commands
{
    gui_destroy()
    run, %code% "%A_ScriptDir%\GUI\env.ahk"
}


;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------


else if BSIO = name ; My name
{
    gui_destroy()
    Send, %MyName%
}
else if BSIO = phone ; My phone number
{
    gui_destroy()
    SendRaw, %PhoneNumber%
}
else if BSIO = int ; LaTeX integral
{
    gui_destroy()
    SendRaw, \int_0^1  \; \mathrm{d}x\,
}
else if BSIO = lenny ; ( ͡° ͜ʖ ͡°)
{
    gui_destroy()
    Send ( ͡° ͜ʖ ͡°)
}
else if BSIO = clip ; Paste clipboard content without formatting
{
    gui_destroy()
    SendRaw, %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if BSIO = down ; Downloads
{
    gui_destroy()
    run %DownloadsPath%
}

else if BSIO = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}

else if BSIO = start ; Startup folder
{
    gui_destroy()
    run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
}


;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------


else if BSIO = ping ; Ping Google
{
    gui_destroy()
    Run, cmd /K "ping www.google.com"
}
else if BSIO = hosts ; Open hosts file in Notepad
{
    gui_destroy()
    Run notepad.exe C:\Windows\System32\drivers\etc\hosts
}
else if BSIO = date ; What is the date?
{
    gui_destroy()
    FormatTime, date,, LongDate
    MsgBox %date%
    date =
}
else if BSIO = week ; Which week is it?
{
    gui_destroy()
    FormatTime, weeknumber,, YWeek
    StringTrimLeft, weeknumbertrimmed, weeknumber, 4
    if (weeknumbertrimmed = 53)
        weeknumbertrimmed := 1
    MsgBox It is currently week %weeknumbertrimmed%
    weeknumber =
    weeknumbertrimmed =
}





else if BSIO = ? ; Tooltip with list of commands
{
    GuiControl,, BSIO, ; Clear the input box
    Gosub, gui_commandlibrary
}





;-------------------------------------------------------------------------------
;;; OUTLOOK ;;;
;-------------------------------------------------------------------------------

else if BSIO = cal ; open outlook calendar
{
    gui_destroy()
   ; Connect to the Outlook application.
   Outlook := ComObjCreate("Outlook.Application")
   ; Get the MAPI namespace.
   Namespace := Outlook.GetNamespace("MAPI")
   ; Get the default calendar folder.
   Calendar := Namespace.GetDefaultFolder(9)
   ; Display the calendar.
   Calendar.Display
   ; Release the objects.
   Calendar := ""
   Namespace := ""
   Outlook := ""
return

}

else if BSIO = out ; open outlook
    {
        gui_destroy()
    
        ; Check if Outlook is running
        Process, Exist, OUTLOOK.exe
        outlookPid = %ErrorLevel%
    
        ; If Outlook is not running, start it
        if !outlookPid
        {
            Run %outlook%
            ; Wait for Outlook to open
            WinWait, ahk_class rctrl_renwnd32
        }
    
        ; Create and display the specified folder in Outlook
        Outlook := ComObjCreate("Outlook.Application")
        Namespace := Outlook.GetNamespace("MAPI")
        Account := Namespace.Folders.Item("REPLACE_ME_WITH_YOUR_EMAIL")
        Folder := Account.Folders.Item("Inbox")
        Folder.Display
    
        ; Release the COM objects
        Folder := ""
        Account := ""
        Namespace := ""
        Outlook := ""
    
        return
    }
    