; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. Take inspiration from the samples provided here.

;-------------------------------------------------------------------------------
;;; SEARCH GOOGLE ;;;
;-------------------------------------------------------------------------------
if Pedersen = g%A_Space% ; Search Google
{
    gui_search_title = LMGTFY
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = a%A_Space% ; Search Google for AutoHotkey related stuff
{
    gui_search_title = Autohotkey Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = l%A_Space% ; Search Google with ImFeelingLucky
{
    gui_search_title = I'm Feeling Lucky
    gui_search("http://www.google.com/search?q=REPLACEME&btnI=Im+Feeling+Lucky")
}
else if Pedersen = m%A_Space% ; Open more than one URL
{
    gui_search_title = multiple
    gui_search("https://www.google.com/search?&q=REPLACEME")
    gui_search("https://www.bing.com/search?q=REPLACEME")
    gui_search("https://duckduckgo.com/?q=REPLACEME")
}
else if Pedersen = x%A_Space% ; Search Google as Incognito
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
else if Pedersen = f%A_Space% ; Search Facebook
{
    gui_search_title = Search Facebook
    gui_search("https://www.facebook.com/search/results.php?q=REPLACEME")
}
else if Pedersen = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}

else if Pedersen = the%A_Space% ; Thesaurus
{
    gui_search_title = Thesaurus
    gui_search("https://www.thesaurus.com/browse/REPLACEME")
}

else if Pedersen = ncontrol%A_Space% ; NIST 800-53 R5 Control Search
{
    gui_search_title = NIST 800-53 R5 Control Search
    gui_search("https://csrc.nist.gov/projects/cprt/catalog#/cprt/framework/version/SP_800_53_5_1_0/home?element=REPLACEME")
}

else if Pedersen = nkey%A_Space% ; NIST 800-53 R5 Control Keyword Search
{
    gui_search_title = NIST 800-53 R5 Control Keyword Search
    gui_search("https://csrc.nist.gov/projects/cprt/catalog#/cprt/framework/version/SP_800_53_5_1_0/home?keyword=REPLACEME")
}

else if Pedersen = nistdef%A_Space% ; NIST Definition
{
    gui_search_title = NIST Definition
    gui_search("https://csrc.nist.gov/glossary?keywords-lg=REPLACEME")
}

else if Pedersen = cmvp%A_Space% ; CMVP Search
{
    gui_search_title = Search CMVP
    gui_search("https://csrc.nist.gov/projects/cryptographic-module-validation-program/validated-modules/search?SearchMode=Basic&Vendor=REPLACEME&CertificateStatus=Active&ValidationYear=0")
}


else if Pedersen = frmarket%A_Space% ; Search FR Marketplace
{
    gui_search_title = Search FedRAMP Marketplace
    gui_search("https://marketplace.fedramp.gov/#!/products?sort=productName&productNameSearch=REPLACEME")
}

else if Pedersen = t%A_Space% ; Search torrent networks
{
    gui_search_title = Sharing is caring
    gui_search("https://kickass.to/usearch/REPLACEME")
}
else if Pedersen = jap ; Translate English to Japanese
{
    gui_search_title = English to Japanese
    gui_search("https://translate.google.com/#en/ja/REPLACEME")
}

else if Pedersen = li%A_Space% ; Search LinkedIn
{
    gui_search_title = Search LinkedIn
    gui_search("https://www.linkedin.com/search/results/all/?keywords=REPLACEME")
}

;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = / ; Go to subreddit. This is a quick way to navigate to a specific URL.
{
    gui_search_title := "/r/"
    gui_search("https://www.reddit.com/r/REPLACEME")
}
else if Pedersen = face ; facebook.com
{
    gui_destroy()
    run www.facebook.com
}

else if Pedersen = shoplist ; shoppinglist
{
    gui_destroy()
    run https://shoppinglist.google.com/
}


else if Pedersen = miro ; miro.com
{
    gui_destroy()
    run https://miro.com/app/dashboard/
}


else if Pedersen = vb ; vegetable and butcher
{
    gui_destroy()
    run https://vegetableandbutcher.com/account
}


else if Pedersen = chase ; chase.com
{
    gui_destroy()
    run https://secure07a.chase.com/web/auth/dashboard#/dashboard/overviewAccounts/overview/index
}

else if Pedersen = bjira.a ; BSIO Jira
{
    gui_destroy()
    run https://bladestack.atlassian.net/jira/projects
}

else if Pedersen = bjira.f ; BSIO Jira - Filtered
{
    gui_destroy()
    run https://bladestack.atlassian.net/jira/software/c/projects/BKAIZEN/boards/14?assignee=62c593724d60fcc2579659ec
}

else if Pedersen = bjira.stand ; BSIO Jira - Standup
{
    gui_destroy()
    run https://bladestack.atlassian.net/jira/software/c/projects/BKAIZEN/boards/14
}


else if Pedersen = bjs%A_Space% ; BSIO Jira - Search
{
    gui_search_title = Search BSIO Jira
    gui_search("https://bladestack.atlassian.net/issues/?jql=text%20~%20%22REPLACEME%22")
}


else if Pedersen = aorders ; Amazon Orders
{
    gui_destroy()
    run https://www.amazon.com/gp/css/order-history?ref_=nav_orders_first
}


else if Pedersen = jticket ; BSIO Jira - Create JIRA Ticket
{
    gui_destroy()
    run https://bladestack.atlassian.net/jira/projects
}


else if Pedersen = awsscope ; AWS Services in Scope - FedRAMP
{
    gui_destroy()
    run https://aws.amazon.com/compliance/services-in-scope/FedRAMP/
}

else if Pedersen = dash-ant ; Anthology Dashboard
{
    gui_destroy()
    run https://app.smartsheet.com/dashboards/g824frhC4pC3JvhQ8JcJ2mRCv39JXqF82jCr58M1
}

else if Pedersen = erl-ants ; Anthology ERL Dashboard Sheet
{
    gui_destroy()
    run https://app.smartsheet.com/sheets/v2fxGrJgfhQFpJW2gRFC88P9mXGWVC7h3JXqMQR1?view=grid
}

else if Pedersen = erl-antd ; Anthology ERL Dashboard
{
    gui_destroy()
    run https://app.smartsheet.com/dashboards/hjf6c25h6hC7hP629Cv3cfvchJHm2f4v5hMJ4Q41
}

else if Pedersen = gap-weka ; Weka.io Dashboard
{
    gui_destroy()
    run https://app.smartsheet.com/dashboards/Q3rmcQ53RrG8VHvFWWmGgf9wHwWppVvRqX9gMR21
}

else if Pedersen = bsio-git ; BSIO GitHub
{
    gui_destroy()
    run https://github.com/bladestack-io
}

else if Pedersen = github ;  GitHub
{
    gui_destroy()
    run https://github.com/
}


else if Pedersen = zrec ;  zoom recordings
{
    gui_destroy()
    run https://zoom.us/recording/management
}

else if Pedersen = spek ; spekcleaning
{
    gui_destroy()
    run https://www.spekless.com/login/
}
else if Pedersen = red ; reddit.com
{
    gui_destroy()
    run www.reddit.com
}

else if Pedersen = gphotos ; Google Calendar
{
    gui_destroy()
    run https://photos.google.com/
}


else if Pedersen = gcal ; Google Calendar
{
    gui_destroy()
    run https://www.google.com/calendar
}
else if Pedersen = note ; Notepad
{
    gui_destroy()
    Run Notepad
}
else if Pedersen = paint ; MS Paint
{
    gui_destroy()
    run "C:\Windows\system32\mspaint.exe"
}

else if Pedersen = caffe ; Caffeine
{
    gui_destroy()
    run "C:\Users\Admin\OneDrive - bladestack.io\# BACKUPS\# PERSONAL BACKUP\Downloads Backup 2021-10-05\Archive\caffeine\caffeine64.exe"
}

else if Pedersen = lin ; Linkedin.com
{
    gui_destroy()
    run www.linkedin.com
}

else if Pedersen = bsio-link ; BSIO LinkedIn
{
    gui_destroy()
    run https://www.linkedin.com/company/75065597/admin/notifications/all/
}

else if Pedersen = market ; FedRAMP Marketplace
{
    gui_destroy()
    run https://marketplace.fedramp.gov/#!/products?sort=productName
}

else if Pedersen = maps ; Google Maps focused on the Technical University of Denmark, DTU
{
    gui_destroy()
    run https://www.google.com/maps/@38.9175498,-77.2290188,15z
}
else if Pedersen = ginbox ; Open google inbox
{
    gui_destroy()
    run https://inbox.google.com/u/0/
    ; run https://mail.google.com/mail/u/0/#inbox  ; Maybe you prefer the old gmail
}
else if Pedersen = mes ; Opens Facebook unread messages
{
    gui_destroy()
    run https://www.facebook.com/messages?filter=unread&action=recent-messages
}
else if Pedersen = url ; Open an URL from the clipboard (naive - will try to run whatever is in the clipboard)
{
    gui_destroy()
    run %ClipBoard%
}

else if Pedersen = term ; Open WSL Terminal
{
    gui_destroy()
    run "C:\Users\Admin\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\wt.exe"
}

else if Pedersen = code ; Open Visual Code
{
    gui_destroy()
    Run "C:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\code.exe"
}

else if Pedersen = slack ; Open slack
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
            WinActivate, ahk_pid %slackPid%
        }
    }
    return
}

else if Pedersen = teams ; Open Teams
{
    gui_destroy()
    DetectHiddenWindows, Off
    Process, Exist, Teams.exe
    teamsPid = %ErrorLevel%
    IfWinNotExist, ahk_pid %teamsPid%
    {
        TrayIcon_Button("Teams.exe")
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



else if Pedersen = bsio-slack ; Open BSIO Slack
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






else if Pedersen = zoom ; Open Zoom
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



else if Pedersen = zoobsio ; Open Zoom, Switch Accounts to bsio
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

else if Pedersen = workapps ; launch work apps
{
    gui_destroy()
    DetectHiddenWindows, On
    Run "C:\Program Files\TechSmith\Snagit 2023\SnagitCapture.exe"
    Run "C:\Users\Admin\AppData\Local\Obsidian\Obsidian.exe"
    Run "C:\Users\Admin\AppData\Local\slack\app-4.28.184\slack.exe"
    Run "C:\Users\Admin\AppData\Local\Microsoft\Teams\current\Teams.exe"
    Run "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"  
    Run "C:\Program Files\Everything 1.5a\Everything64.exe"
}

else if Pedersen = rlight ; launch ring light control center
{
    gui_destroy()
    DetectHiddenWindows, On
    Run "C:\Program Files\Elgato\ControlCenter\ControlCenter.exe"
}

else if Pedersen = killappsg ; kill apps - performance mode
{
    gui_destroy()
    DetectHiddenWindows, On
    Process, Close, Zoom.exe
    Process, Close, slack.exe
    Process, Close, SnagitCapture.exe    
    Process, Close, Teams.exe
    Process, Close, synergys.exe
    Process, Close, OUTLOOK.EXE
    Process, Close, chrome.exe
    Process, Close, acrotray.exe
    Process, Close, Obsidian.exe
    Process, Close, caffeine64.exe
    Process, Close, Everything64.exe
    Run "C:\Program Files\Elgato\ControlCenter\ControlCenter.exe"
}

else if Pedersen = killteams ; kill teams
{
    gui_destroy()
    DetectHiddenWindows, On
    Process, Close, Teams.exe
}

else if Pedersen = killtemp ; kill temp monitoring
{
    gui_destroy()
    DetectHiddenWindows, On
    Process, Close, HWiNFO64.EXE
    Process, Close, hw
}


else if Pedersen = killzoom ; kill zoom
{
    gui_destroy()
    DetectHiddenWindows, On
    Process, Close, Zoom.exe
}

else if Pedersen = killslack ; kill snagit
{
    gui_destroy()
    Process, Close, slack.exe
}

else if Pedersen = killsnag ; kill snagit
{
    gui_destroy()
    Process, Close, SnagitCapture.exe
}

else if Pedersen = snag ; open snagit
{
    gui_destroy()
    Run "C:\Program Files\TechSmith\Snagit 2023\SnagitCapture.exe"
}

else if Pedersen = temp ; open snagit
{
    gui_destroy()
    Run "C:\Program Files\HWiNFO64\HWiNFO64.EXE"
}




else if Pedersen = obi ; Obsidian Quick Capture Note
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
else if Pedersen = rel ; Reload this script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}
else if Pedersen = dir ; Open the directory for this script
{
    gui_destroy()
    Run, %A_ScriptDir%
}
else if Pedersen = host ; Edit host script
{
    gui_destroy()
    run, C:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\code.exe "%A_ScriptFullPath%"
}
else if Pedersen = edit ; Edit GUI user commands
{
    gui_destroy()
    run, C:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\code.exe "%A_ScriptDir%\GUI\UserCommands.ahk"
}


;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------
else if Pedersen = @jcg ; Email address
{
    gui_destroy()
    Send, bhanu.jagasia@jagasiaconsulting.com
}
else if Pedersen = @bsio ; Email address
{
    gui_destroy()
    Send, bjagasia@bladestack.io
}
else if Pedersen = name ; My name
{
    gui_destroy()
    Send, Bhanu Jagasia
}
else if Pedersen = phone ; My phone number
{
    gui_destroy()
    SendRaw, 571.269.4272
}
else if Pedersen = int ; LaTeX integral
{
    gui_destroy()
    SendRaw, \int_0^1  \; \mathrm{d}x\,
}
else if Pedersen = lenny ; ( ͡° ͜ʖ ͡°)
{
    gui_destroy()
    Send ( ͡° ͜ʖ ͡°)
}
else if Pedersen = clip ; Paste clipboard content without formatting
{
    gui_destroy()
    SendRaw, %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = down ; Downloads
{
    gui_destroy()
    run D:\bjagasia\Downloads
}

else if Pedersen = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}

else if Pedersen = start ; Startup folder
{
    gui_destroy()
    run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
}


;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = sound ; Restart SoundBlaster Audio Service
{
    gui_destroy()
    Run, cmd /c sc stop CTAudSvcService & sc start CTAudSvcService
}

else if Pedersen = ping ; Ping Google
{
    gui_destroy()
    Run, cmd /K "ping www.google.com"
}
else if Pedersen = hosts ; Open hosts file in Notepad
{
    gui_destroy()
    Run notepad.exe C:\Windows\System32\drivers\etc\hosts
}
else if Pedersen = date ; What is the date?
{
    gui_destroy()
    FormatTime, date,, LongDate
    MsgBox %date%
    date =
}
else if Pedersen = week ; Which week is it?
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
else if Pedersen = ? ; Tooltip with list of commands
{
    GuiControl,, Pedersen, ; Clear the input box
    Gosub, gui_commandlibrary
}



;-------------------------------------------------------------------------------
;;; BSIO - SMARTSHEET ;;;
;-------------------------------------------------------------------------------

else if Pedersen = dash-anomali ; Anomali Advisory Project Dashboard
{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/Qm8QpCj637Hm392FC54MFgjrM496j7jP25ghr341"
}
else if Pedersen = anom-action ; Anomali Advisory Action Items Dashboard
{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/JwwVH7ghw9MQGJPPvPgQV9364RmVwpr7qxJ4Mmq1"
}

else if Pedersen = dash-oda ; Odaseva Advisory Smartsheet

{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/23QWmxj2v2Gm5w2jMXV9QjF8pwVJgHvvFP5Mcwc1"
}

else if Pedersen = gap-oda ; Odaseva Gap Dash

{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/23QWmxj2v2Gm5w2jMXV9QjF8pwVJgHvvFP5Mcwc1"
}


else if Pedersen = gap-weka ; Weka Gap Dash

{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/Q3rmcQ53RrG8VHvFWWmGgf9wHwWppVvRqX9gMR21"
}



else if Pedersen = pip-conmon ; Perceptyx ConMon Dashboard

{
    gui_destroy()
    run "https://app.smartsheet.com/dashboards/g3xMjVrqjvjg2mxv52Qf8Q8wH2VMmM3VhVpJqx51"
}


else if Pedersen = pip-hours ; Perceptyx ConMon Dashboard

{
    gui_destroy()
    run "https://app.smartsheet.com/b/form/0b897cde02b549ab8f36fd3353fbf501"
}

;-------------------------------------------------------------------------------
;;; BSIO - NOTION ;;;
;-------------------------------------------------------------------------------

else if Pedersen = nbiz ; Notion - Business Blade

{
    gui_destroy()
    run "https://www.notion.so/bladestack/28082810ae784a1093f8274c5c4d3733?v=5f3d700087b64349a17fde230b0f91b8"
}

else if Pedersen = ndue ; Notion - Overdue Tasks

{
    gui_destroy()
    run "https://www.notion.so/bladestack/Overdue-Tasks-9a4df6efb21e426f8a9463368ed1e754"
}

else if Pedersen = ntask ; Notion - Samuraitasuku

{
    gui_destroy()
    run "https://www.notion.so/bladestack/Board-By-Status-0e25bb0b78164c90af47f6b72f08f619"
}

else if Pedersen = nstand ; Notion - Daily Tachiagaru Standups

{
    gui_destroy()
    run "https://www.notion.so/bladestack/0c13e42faa9e43819fc55a0944c7b709?v=b66591dff7b4486fb5ec487dba4b3d2a"
}

else if Pedersen = nkb ; Notion - Knowledge Blade

{
    gui_destroy()
    run "https://www.notion.so/bladestack/cf667487fe9346358f5c1a14acf4f440?v=76431287eea34434bd2d829f91b59c94"
}

else if Pedersen = nts ; Notion - Samuraitasuku Tablew view by Samurai

{
    gui_destroy()
    run "https://www.notion.so/bladestack/Board-By-Samurai-b91d92546b73450da04d44c4dc9fd413"
}



else if Pedersen = nadv ; Notion - Advisory


{
    gui_destroy()
    run "https://www.notion.so/bladestack/49f7906990ae4808a7302becd3d5ba98?v=bfe63a0e8ed64548866f71c12e6e36c8"
}

else if Pedersen = nsam ; Notion - Samurai Mananagement Meeting Minutes


{
    gui_destroy()
    run "https://www.notion.so/bladestack/66b3c7786e83417b9445e7098e66cdc0?v=d5a48e70451c48069bcd780791e8346f"
}


else if Pedersen = tstack ; Notion - Samurai Mananagement Meeting Minutes


{
    gui_destroy()
    run "https://www.notion.so/bladestack/Tools-Stack-201646485c97404e84fb4b1a838f0139"
}


;-------------------------------------------------------------------------------
;;; BSIO - BOX - EXPLORER;;;
;-------------------------------------------------------------------------------

else if Pedersen = bfin ; BSIO Finances Box Sync Folder
{
    gui_destroy()
    run, D:\Box Sync\Box Sync\# FOUNDING SAMURAIS & OWNERS\Finances
}

else if Pedersen = boxs ; BSIO Box Sync Folder
{
    gui_destroy()
    run, D:\Box Sync\Box Sync\
}

else if Pedersen = broot ; BSIO Box Root
{
    gui_destroy()
    run, D:\Box Sync\Box Sync\BLADESTACK.IO Root
}

;-------------------------------------------------------------------------------
;;; BSIO - BOX.COM ;;;
;-------------------------------------------------------------------------------

else if Pedersen = box-anom ; Anomali Advisory Box
{
    gui_destroy()
    run "https://bladestackio.app.box.com/folder/153635172096"
}

else if Pedersen = box-root ; Root Box
{
    gui_destroy()
    run "https://bladestackio.app.box.com/folder/0"
}

else if Pedersen = box-ant ; Anthology Box
{
    gui_destroy()
    run "https://bladestackio.app.box.com/folder/176157435309"
}



;-------------------------------------------------------------------------------
;;; OUTLOOK ;;;
;-------------------------------------------------------------------------------

else if Pedersen = cal ; open outlook calendar
{
    gui_destroy()
    DetectHiddenWindows, On
    WinActivate, Calendar - bjagasia@bladestack.io - Outlook
    WinActivate, lollybaggins@gmail.com - Internet Calendars - Outlook
    WinActivate, lollybaggins@gmail.com (1) - Internet Calendars - Outlook

}

else if Pedersen = out ; open outlook
{
    gui_destroy()
    DetectHiddenWindows, On
    WinActivate, Inbox - bjagasia@bladestack.io - Outlook
    WinActivate, ### BSIO ARCHIVE ### - bjagasia@bladestack.io - Outlook
    WinActivate, Sent Items - bjagasia@bladestack.io - Outlook
    WinActivate, Drafts - bjagasia@bladestack.io - Outlook
    WinActivate, Inbox - bhanu.jagasia@jagasiaconsulting.com - Outlook
    WinActivate, ### JCG ARCHIVE ### - bhanu.jagasia@jagasiaconsulting.com - Outlook
    WinActivate, Inbox - bjagasia@auditmation.io - Outlook
}


else if Pedersen = out-b ; open BSIO outlook
{
    gui_destroy()
	try
		outlookApp := ComObjActive("Outlook.Application")
	catch
		outlookApp := ComObjActive("Outlook.Application")

	JCGFolder := outlookApp.GetDefaultFolder(6)
	JCGFolder.Display
}


;-------------------------------------------------------------------------------
;;; AUDITMATION.IO ;;;
;-------------------------------------------------------------------------------

else if Pedersen = uat-audit ; Open auditmation.io UAT
{
    gui_destroy()
    Run "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 3" uat.auditmation.io
}

else if Pedersen = qa-audit ; Open auditmation.io UAT
{
    gui_destroy()
    Run "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 3" qa.auditmation.dev
}

else if Pedersen = dev-audit ; Open auditmation.io UAT
{
    gui_destroy()
    Run "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 3" ci.auditmation.dev
}

else if Pedersen = nfslack ; Open NF slack
{
    gui_destroy()
    DetectHiddenWindows, Off
    Process, Exist, slack.exe
    slackPid = %ErrorLevel%
    IfWinNotExist, ahk_pid %slackPid%
    {
        TrayIcon_Button("slack.exe")
        Send ^2
    }
    Else
    {
        IfWinActive, ahk_pid %slackPid%
        {
            WinActivate, ahk_pid %slackPid%
            Send ^2
        }
        Else
        {
            WinActivate, ahk_pid %slackPid%
            Send ^2
        }
    }
    return
}

else if Pedersen = nfjira ; Open auditmation.io jira
{
    gui_destroy()
    Run "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 3" https://neverfail.atlassian.net/jira/projects
}
