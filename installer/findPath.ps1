$TARGET_PROGRAMS = @(
    @{Name="Google Chrome"; Executable="chrome.exe"},
    @{Name="Notepad++"; Executable="notepad++.exe"},
    @{Name="Snagit 2023"; Executable="SnagitCapture.exe"},
    @{Name="Visual Studio Code"; Executable="code.exe"},
    @{Name="WinSCP"; Executable="WinSCP.exe"},
    @{Name="Slack"; Executable="slack.exe"},
    @{Name="Microsoft Teams"; Executable="Teams.exe"},
    @{Name="Microsoft Outlook"; Executable="OUTLOOK.exe"},
    @{Name="Obsidian"; Executable="Obsidian.exe"}
)

$output = ""
$totalPrograms = $TARGET_PROGRAMS.Count
$progress = 0

foreach ($program in $TARGET_PROGRAMS) {
    $programFound = $false
    $path = ""

    # Display progress bar
    $progress++
    Write-Progress -Activity "Searching for programs..." -Status "Processing $($program.Name)" -PercentComplete (($progress / $totalPrograms) * 100)

    # Look for program in registry keys
    $registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths"
    $registryKeys = Get-ChildItem $registryPath -ErrorAction SilentlyContinue | Where-Object {$_.PSChildName -eq $program.Executable}
    if ($registryKeys) {
        foreach ($key in $registryKeys) {
            $programFound = $true
            $path = (Get-ItemProperty $key.PSPath).'(Default)'
            break
        }
    }

    # Look for program in common directories
    if (!$programFound) {
        $dirs = @(
            "C:\Program Files",
            "C:\Program Files (x86)",
            "$env:USERPROFILE\AppData\Local",
            "$env:USERPROFILE\AppData\Local\Programs",
            "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps",
            "$env:USERPROFILE\AppData\Roaming"
        )

        foreach ($dir in $dirs) {
            $files = Get-ChildItem $dir -Recurse -ErrorAction SilentlyContinue -Filter $program.Executable | Where-Object {$_.Name -eq $program.Executable}
            if ($files) {
                foreach ($file in $files) {
                    $programFound = $true
                    $path = $file.FullName
                    break
                }
            }
            if ($programFound) {
                break
            }
        }
    }

    # Look for program in Office directories
    if (!$programFound) {
        $officeDirs = Get-ChildItem -Path "C:\Program Files\Microsoft Office\root" -Recurse -Directory -ErrorAction SilentlyContinue -Filter "Office*"
        $officeDirs += Get-ChildItem -Path "C:\Program Files (x86)\Microsoft Office\root" -Recurse -Directory -ErrorAction SilentlyContinue -Filter "Office*"

        foreach ($officeDir in $officeDirs) {
            $files = Get-ChildItem $officeDir.FullName -Recurse -ErrorAction SilentlyContinue -Filter $program.Executable | Where-Object {$_.Name -eq $program.Executable}
            if ($files) {
                foreach ($file in $files) {
                    $programFound = $true
                    $path = $file.FullName
                    break
                }
            }
            if ($programFound) {
                break
            }
        }
    }
# Look for program in registry keys (Outlook specific)
if (!$programFound -and $program.Name -eq "Microsoft Outlook") {
    $registryPath = "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\REGISTRY\MACHINE\Software\Microsoft\Office"
    $officeKeys = Get-ChildItem $registryPath -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.GetValue("PathToExe") -like "*$($program.Executable)"}
    if ($officeKeys) {
        foreach ($key in $officeKeys) {
            $programFound = $true
            $path = $key.GetValue("PathToExe")
            break
        }
    }
}

    if ($programFound) {
        $output += "$($program.Name)=`"$path`"`r`n"
    } else {
        Write-Host "Could not find program: $($program.Name)"
    }
}

Write-Host "Processing complete."

if ($output -ne "") {
    $output | Set-Content -Path (Join-Path -Path $PSScriptRoot -ChildPath "ProgramPaths.txt")
    Write-Host "Output saved to: $(Join-Path -Path $PSScriptRoot -ChildPath "ProgramPaths.txt")"
    Write-Host "Found programs and their directories:"
    Write-Host $output
} else {
    Write-Host "No programs found"
}

Read-Host -Prompt "Press Enter to exit"
