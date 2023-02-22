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
    gui_search_title = NIST 800-53 R5 Control Search
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
    gui_search("https://csrc.nist.gov/projects/cryptographic-module-validation-program/validated-modules/search?SearchMode=Basic&Vendor=REPLACEME&CertificateStatus=Active&ValidationYear=0")
}


else if BSIO = frmarket%A_Space% ; Search FR Marketplace
{
    gui_search_title = Search FedRAMP Marketplace
    gui_search("https://marketplace.fedramp.gov/#!/products?sort=productName&productNameSearch=REPLACEME")
}

else if BSIO = t%A_Space% ; Search torrent networks
{
    gui_search_title = Sharing is caring
    gui_search("https://kickass.to/usearch/REPLACEME")
}
else if BSIO = jap ; Translate English to Japanese
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


else if BSIO = smartsheet ; smartsheet
{
    gui_destroy()
    run https://app.smartsheet.com/b/home
}

else if BSIO = shoplist ; shoppinglist
{
    gui_destroy()
    run https://shoppinglist.google.com/
}


else if BSIO = miro ; miro.com
{
    gui_destroy()
    run https://miro.com/app/dashboard/
}

else if BSIO = clock ; clock app
{
    gui_destroy()
    run explorer.exe shell:Appsfolder\Microsoft.WindowsAlarms_8wekyb3d8bbwe!App
}



else if BSIO = cleanscreen ; clean screen / black screen
{
    gui_destroy()
    run https://www.youtube.com/watch?v=AjWfY7SnMBI&t=171s&ab_channel=CandRfun
}

else if BSIO = blk ; clean screen / black screen
{
    gui_destroy()
    run https://www.youtube.com/watch?v=AjWfY7SnMBI&t=171s&ab_channel=CandRfun
}


else if BSIO = boxwebs%A_Space% ; Box Web Search
{
    gui_search_title = Search BSIO Box
    gui_search("https://bladestackio.app.box.com/folder/0/search?isTrashSearch=0&metadata=&owners=&query=REPLACEME&resinSessionID=03cdcffa48d9edce694cec&types=&updatedTime=0&updatedTimeFrom=0&updatedTimeTo=0")
}

else if BSIO = chase ; chase.com
{
    gui_destroy()
    run https://secure07a.chase.com/web/auth/dashboard#/dashboard/overviewAccounts/overview/index
}


else if BSIO = Instap ; Instapaper
{
    gui_destroy()
    run https://www.instapaper.com/u
}


else if BSIO = logs-slack ; Check slack activity logs
{
    gui_destroy()
    run https://bladestack.slack.com/admin/logs
}

else if BSIO = bsio ; BSIO website
{
    gui_destroy()
    run https://bladestack.io/
}

else if BSIO = bjira.a ; BSIO Jira
{
    gui_destroy()
    run https://bladestack.atlassian.net/jira/projects
}

else if BSIO = bjira.me ; BSIO Jira - Filtered
{
    gui_destroy()
    run https://bladestack.atlassian.net/jira/software/c/projects/BKAIZEN/boards/14?assignee=62c593724d60fcc2579659ec
}

else if BSIO = bjira.stand ; BSIO Jira - Standup
{
    gui_destroy()
    run https://bladestack.atlassian.net/jira/software/c/projects/BKAIZEN/boards/14
}


else if BSIO = bjira%A_Space% ; BSIO Jira - Search
{
    gui_search_title = Search BSIO Jira
    gui_search("https://bladestack.atlassian.net/issues/?jql=text%20~%20%22REPLACEME%22")
}


else if BSIO = ama%A_Space% ; Amazon Search
{
    gui_search_title = Search Amazon.com
    gui_search("https://www.amazon.com/s?k=REPLACEME&crid=1G4RZ6T4I6AZT&sprefix=REPLACEME%2Caps%2C64&ref=nb_sb_noss_2")
}

else if BSIO = aorders ; Amazon Orders
{
    gui_destroy()
    run https://www.amazon.com/gp/css/order-history?ref_=nav_orders_first
}


else if BSIO = jticket ; BSIO Jira - Create JIRA Ticket
{
    gui_destroy()
    run https://bladestack.atlassian.net/jira/projects
}


else if BSIO = awsscope ; AWS Services in Scope - FedRAMP
{
    gui_destroy()
    run https://aws.amazon.com/compliance/services-in-scope/FedRAMP/
}

else if BSIO = activity-ant ; Anthology Activitiy Report
{
    gui_destroy()
    run https://app.smartsheet.com/b/form/3fb66766c84f452398d37e62255eecaf
}


else if BSIO = risk-ant ; Anthology Dashboard - Risk Tracker and Form
{
    gui_destroy()
    run https://app.smartsheet.com/sheets/9hX2hMcR2hrwqQPCmVvqW2CQW53mrp28v7V593p1?view=grid
}

else if BSIO = erl-ant ; Anthology Dashboard - Evidence Request List Tracker
{
    gui_destroy()
    run https://app.smartsheet.com/sheets/v2fxGrJgfhQFpJW2gRFC88P9mXGWVC7h3JXqMQR1?view=grid&filterId=3166092154693508
}


else if BSIO = dash-ant ; Anthology Dashboard
{
    gui_destroy()
    run https://app.smartsheet.com/dashboards/g824frhC4pC3JvhQ8JcJ2mRCv39JXqF82jCr58M1
}

else if BSIO = dash-hrc ; Harvard RC Dashboard
{
    gui_destroy()
    run https://app.smartsheet.com/dashboards/qQfgMFXmH9ppF22wG6JvcvXpmFcm9fvJ6mG76451
}

else if BSIO = act-ant ; Anthology Dashboard
{
    gui_destroy()
    run https://app.smartsheet.com/sheets/6gFMjqgwjGHFFxXFjQhR8vJV64qq6c8qx2hqR8c1?view=grid
}


else if BSIO = stake-ant ; Anthology Dashboard
{
    gui_destroy()
    run https://app.smartsheet.com/sheets/28jCv8wjX29cPQQ4MR2fqW7v9h2CMXHQv5vQJ481?view=grid
}

else if BSIO = dash-ant ; Anthology Dashboard - Action Tracker with Form
{
    gui_destroy()
    run https://app.smartsheet.com/sheets/6gFMjqgwjGHFFxXFjQhR8vJV64qq6c8qx2hqR8c1?view=grid
}


else if BSIO = dash-weka ; Weka.io Advsiory Dashboard
{
    gui_destroy()
    run https://app.smartsheet.com/dashboards/hwRQx22rrFcffjHgGVC65q8JjwjH3JhgwxvxWrj1
}

else if BSIO = bsio-git ; BSIO GitHub
{
    gui_destroy()
    run https://github.com/bladestack-io
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

else if BSIO = spek ; spekcleaning
{
    gui_destroy()
    run https://www.spekless.com/login/
}
else if BSIO = red ; reddit.com
{
    gui_destroy()
    run www.reddit.com
}

else if BSIO = gphotos ; Google Calendar
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

else if BSIO = bsio-link ; BSIO LinkedIn
{
    gui_destroy()
    run https://www.linkedin.com/company/75065597/admin/notifications/all/
}

else if BSIO = market ; FedRAMP Marketplace
{
    gui_destroy()
    run https://marketplace.fedramp.gov/#!/products?sort=productName
}

else if BSIO = maps ; Google Maps focused on the Technical University of Denmark, DTU
{
    gui_destroy()
    run https://www.google.com/maps/@38.9175498,-77.2290188,15z
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
    }
    Else
    {
        IfWinActive, ahk_pid %slackPid%
        {
            WinActivate, ahk_pid %slackPid%
        }
        Else
        {
            Run "C:\Users\Admin\AppData\Local\slack\app-4.28.184\slack.exe"
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
        Run "C:\Users\Admin\AppData\Local\Microsoft\Teams\current\Teams.exe"
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



else if BSIO = bsio-slack ; Open BSIO Slack
{
    gui_destroy()
    DetectHiddenWindows, Off
    Process, Exist, slack.exe
    slackPid = %ErrorLevel%
    IfWinNotExist, ahk_pid %slackPid%
    {
        TrayIcon_Button("slack.exe")
        Send ^1
    }
    Else
    {
        IfWinActive, ahk_pid %slackPid%
        {
            WinActivate, ahk_pid %slackPid%
            Send ^1
        }
        Else
        {
            WinActivate, ahk_pid %slackPid%
            Send ^1
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



else if BSIO = zoobsio ; Open Zoom, Switch Accounts to bsio
{
    gui_destroy()
    DetectHiddenWindows, On
    Process, Exist, Zoom.exe
    zoomPid = %ErrorLevel%
    IfWinNotExist, ahk_class ZPPTMainMenuWndClass WinActivate, ahk_class ZPPTMainMenuWndClass
    {
        TrayIcon_Button("zoom.exe")
        WinActivate, ahk_class ZPPTMainMenuWndClass
    }
    Else
    {
        IfWinActive, ahk_class ZPPTMainMenuWndClass
        {
            WinRestore, ahk_class ZPPTMainMenuWndClass
            Sleep 100
            Send, {Space}
            Sleep 10
            SendInput {Down 13}
            Send, {Space}
            Sleep 10
            Send ^a
            Sleep 5
            Send {Delete}
            Send bjagasia@bladestack.io
            Send {Tab}
            Send, {Space}
            SendInput {Down 13}
            Send, {Space}
        }
        Else
        {
            WinActivate, ahk_class ZPPTMainMenuWndClass
            WinRestore, ahk_class ZPPTMainMenuWndClass
            WinActivate, ahk_class ZPPTMainMenuWndClass
            Send, {Space}
            SendInput {Down 13}
            Send, {Space}
        }
    }
    return
}





else if BSIO = killonedrive ; kill onedrive
{
    gui_destroy()
    DetectHiddenWindows, On
    Process, Close, OneDrive.exe
    Process, Close, OneDrive.exe
    Process, Close, OneDrive.exe
}


else if BSIO = killteams ; kill teams
{
    gui_destroy()
    DetectHiddenWindows, On
    Process, Close, Teams.exe
}



else if BSIO = killzoom ; kill zoom
{
    gui_destroy()
    DetectHiddenWindows, On
    Process, Close, Zoom.exe
}

else if BSIO = killslack ; kill snagit
{
    gui_destroy()
    Process, Close, slack.exe
}

else if BSIO = killsnag ; kill snagit
{
    gui_destroy()
    Process, Close, SnagitCapture.exe
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
                Run "obsidian://advanced-uri?vault=dafb97a6f702913e&commandname=QuickAdd: Capture to Daily Notes"
            }
        } else {
            if (hidden_obsidian_window_id) {
                ; Unhide
                WinShow, % "ahk_id " . hidden_obsidian_window_id
                WinActivate, % "ahk_id " . hidden_obsidian_window_id
                Run "obsidian://advanced-uri?vault=dafb97a6f702913e&commandname=QuickAdd: Capture to Daily Notes"
                hidden_obsidian_window_id := false
            } else {
                ; Launch the app
                SendMode Input
                SetWorkingDir, %A_ScriptDir%
                SetTitleMatchMode, RegEx
                WinActivate, i) Obsidian
                EnvGet, A_LocalAppData, LocalAppData
                Run "obsidian://advanced-uri?vault=dafb97a6f702913e&commandname=QuickAdd: Capture to Daily Notes"
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
else if BSIO = @jcg ; Email address
{
    gui_destroy()
    Send, bhanu.jagasia@jagasiaconsulting.com
}
else if BSIO = @bsio ; Email address
{
    gui_destroy()
    Send, bjagasia@bladestack.io
}
else if BSIO = name ; My name
{
    gui_destroy()
    Send, Bhanu Jagasia
}
else if BSIO = phone ; My phone number
{
    gui_destroy()
    SendRaw, 571.269.4272
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
    run D:\bjagasia\Downloads
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

else if BSIO = qp ; Quickpart Refresher
    {
        gui_destroy()
        MsgBox,
        (
        Quickparts:
        Document Title: [ Title ] 
        Company Name: [ Company ]
        System Name: [ Subject ]
        Short Name: [ Status ]
        Cloud Model: [ Comments ]
        Framework: [ Keywords ]
        FIPS-199: [ Category ]
        Impact Level: [ Company Phone ]
        Author: [ Author ]
        Approver [ Manager ]
        )
    }



else if BSIO = ? ; Tooltip with list of commands
{
    GuiControl,, BSIO, ; Clear the input box
    Gosub, gui_commandlibrary
}



;-------------------------------------------------------------------------------
;;; BSIO - SMARTSHEET ;;;
;-------------------------------------------------------------------------------

else if BSIO = dash-anomali ; Anomali Advisory Project Dashboard
{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/Qm8QpCj637Hm392FC54MFgjrM496j7jP25ghr341"
}
else if BSIO = anom-action ; Anomali Advisory Action Items Dashboard
{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/JwwVH7ghw9MQGJPPvPgQV9364RmVwpr7qxJ4Mmq1"
}

else if BSIO = dash-oda ; Odaseva Advisory Smartsheet

{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/5vcPPfch3VQJCWpx6cGQmWfPFcf8hjpPP6xf8841"
}

else if BSIO = gap-oda ; Odaseva Gap Dash

{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/23QWmxj2v2Gm5w2jMXV9QjF8pwVJgHvvFP5Mcwc1"
}


else if BSIO = gap-weka ; Weka Gap Dash

{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/Q3rmcQ53RrG8VHvFWWmGgf9wHwWppVvRqX9gMR21"
}



else if BSIO = pip-conmon ; Perceptyx ConMon Dashboard

{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/g3xMjVrqjvjg2mxv52Qf8Q8wH2VMmM3VhVpJqx51"
}


else if BSIO = pip-hours ; Perceptyx ConMon Dashboard

{
    gui_destroy()
    run "https://app.smartsheet.com/b/form/0b897cde02b549ab8f36fd3353fbf501"
}

;-------------------------------------------------------------------------------
;;; BSIO - NOTION ;;;
;-------------------------------------------------------------------------------

else if BSIO = nbiz ; Notion - Business Blade

{
    gui_destroy()
    run "https://www.notion.so/bladestack/28082810ae784a1093f8274c5c4d3733?v=5f3d700087b64349a17fde230b0f91b8"
}

else if BSIO = ndue ; Notion - Overdue Tasks

{
    gui_destroy()
    run "https://www.notion.so/bladestack/Overdue-Tasks-9a4df6efb21e426f8a9463368ed1e754"
}

else if BSIO = ntask ; Notion - Samuraitasuku

{
    gui_destroy()
    run "https://www.notion.so/bladestack/Board-By-Status-0e25bb0b78164c90af47f6b72f08f619"
}

else if BSIO = nstand ; Notion - Daily Tachiagaru Standups

{
    gui_destroy()
    run "https://www.notion.so/bladestack/0c13e42faa9e43819fc55a0944c7b709?v=d7902a4e463d4cb280902d4f0220e1d8"
}

else if BSIO = nkb ; Notion - Knowledge Blade

{
    gui_destroy()
    run "https://www.notion.so/bladestack/cf667487fe9346358f5c1a14acf4f440?v=76431287eea34434bd2d829f91b59c94"
}

else if BSIO = nts ; Notion - Samuraitasuku Tablew view by Samurai

{
    gui_destroy()
    run "https://www.notion.so/bladestack/Board-By-Samurai-b91d92546b73450da04d44c4dc9fd413"
}



else if BSIO = nadv ; Notion - Advisory


{
    gui_destroy()
    run "https://www.notion.so/bladestack/49f7906990ae4808a7302becd3d5ba98?v=bfe63a0e8ed64548866f71c12e6e36c8"
}

else if BSIO = nsam ; Notion - Samurai Mananagement Meeting Minutes


{
    gui_destroy()
    run "https://www.notion.so/bladestack/bba111fd01244da1b0c9b45ad4041123?v=155d7f30621040bbb5bcdb899c9f8def"
}


else if BSIO = tstack ; Notion - Samurai Mananagement Meeting Minutes


{
    gui_destroy()
    run "https://www.notion.so/bladestack/Tools-Stack-201646485c97404e84fb4b1a838f0139"
}


;-------------------------------------------------------------------------------
;;; BSIO - BOX - EXPLORER;;;
;-------------------------------------------------------------------------------

else if BSIO = bfin ; BSIO Finances Box Sync Folder
{
    gui_destroy()
    run, D:\Box Sync\Box Sync\# FOUNDING SAMURAIS & OWNERS\Finances
}

else if BSIO = boxs ; BSIO Box Sync Folder
{
    gui_destroy()
    run, D:\Box Sync\Box Sync\
}

else if BSIO = broot ; BSIO Box Root
{
    gui_destroy()
    run, D:\Box Sync\Box Sync\BLADESTACK.IO Root
}

;-------------------------------------------------------------------------------
;;; BSIO - BOX.COM ;;;
;-------------------------------------------------------------------------------

else if BSIO = box-anom ; Anomali Advisory Box
{
    gui_destroy()
    run "https://bladestackio.app.box.com/folder/153635172096"
}

else if BSIO = box-root ; Root Box
{
    gui_destroy()
    run "https://bladestackio.app.box.com/folder/0"
}

else if BSIO = box-ant ; Anthology Box
{
    gui_destroy()
    run "https://bladestackio.app.box.com/folder/176157435309"
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
    Outlook := ComObjCreate("Outlook.Application")
    Namespace := Outlook.GetNamespace("MAPI")
    Account := Namespace.Folders.Item("bjagasia@bladestack.io")
    Folder := Account.Folders.Item("Inbox")
    Folder.Display
    Folder := ""
    Account := ""
    Namespace := ""
    Outlook := ""
    return
}
