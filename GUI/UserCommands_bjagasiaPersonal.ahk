;
;  BJAGASIA Personal AHK
;
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


else if BSIO = kader ; kader barber
{
    gui_destroy()
    run https://kadersbarbershop.youcanbook.me/
}

else if BSIO = caffe ; Caffeine
    {
        gui_destroy()
        run "C:\Users\Admin\OneDrive - bladestack.io\# BACKUPS\# PERSONAL BACKUP\Downloads Backup 2021-10-05\Archive\caffeine\caffeine64.exe"
    }

else if BSIO = term ; Open WSL Terminal
{
    gui_destroy()
    run "C:\Users\Admin\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\wt.exe"
}

else if BSIO = code ; Open Visual Code
{
    gui_destroy()
    Run "C:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\code.exe"
}

else if BSIO = workapps ; launch work apps
    {
        gui_destroy()
        DetectHiddenWindows, On
        Run "C:\Program Files\TechSmith\Snagit 2023\SnagitCapture.exe"
        Run "C:\Users\Admin\AppData\Local\Obsidian\Obsidian.exe"
        Run "C:\Users\Admin\AppData\Local\slack\app-4.28.184\slack.exe"
        Run "C:\Users\Admin\AppData\Local\Microsoft\Teams\current\Teams.exe"
        Run "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"  
        Run "C:\Program Files\Everything 1.5a\Everything64.exe"
        Run "C:\Program Files\Everything 1.5a\Everything64.exe"
        Run "C:\Program Files\Synergy\synergys.exe"
        Run "C:\Users\Admin\AppData\Local\muteme_client\app-0.12.2\MuteMe-Client.exe"
    }

else if BSIO = rlight ; launch ring light control center
{
    gui_destroy()
    DetectHiddenWindows, On
    Run %rlight%
}

else if BSIO = killappsg ; kill apps - performance mode
{
    gui_destroy()
    DetectHiddenWindows, On
    Run, *RunAs "taskkill" /IM "synergys" /F
    Run, *RunAs "taskkill" /IM "synergyd" /F
    Run, *RunAs "taskkill" /IM "Everything64.exe" /F
    Process, Close, Zoom.exe
    Process, Close, slack.exe
    Process, Close, SnagitCapture.exe    
    Process, Close, Teams.exe
    Process, Close, MuteMe-Client.exe
    Process, Close, MuteMe-Client.exe
    Process, Close, MuteMe-Client.exe
    Process, Close, MuteMe-Client.exe
    Process, Close, synergys.exe
    Process, Close, synergyd.exe
    Process, Close, OUTLOOK.EXE
    Process, Close, chrome.exe
    Process, Close, acrotray.exe
    Process, Close, Obsidian.exe
    Process, Close, caffeine64.exe
    Process, Close, Everything64.exe
    Process, Close, Everything64.exe
    Run %rlight%
}

else if BSIO = killtemp ; kill temp monitoring
    {
        gui_destroy()
        DetectHiddenWindows, On
        Process, Close, HWiNFO64.EXE
        Run, *RunAs "taskkill" /IM "HWiNFO64.EXE" /F
    }

    
else if BSIO = snag ; open snagit
{
    gui_destroy()
    Run "C:\Program Files\TechSmith\Snagit 2023\SnagitCapture.exe"
}

else if BSIO = temp ; open temps
{
    gui_destroy()
    Run "C:\Program Files\HWiNFO64\HWiNFO64.EXE"
}

else if BSIO = sound ; Restart SoundBlaster Audio Service
{
    gui_destroy()
    Run, cmd /c sc stop CTAudSvcService & sc start CTAudSvcService
}

