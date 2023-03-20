$TARGET_PROGRAMS = @("Google Chrome", "Notepad++", "Snagit 2023", "Visual Studio Code", "WinSCP", "Slack", "Microsoft Teams", "Microsoft Outlook", "Obsidian")


$output = ""
foreach ($program in $TARGET_PROGRAMS) {
    $programFound = $false
    $path = ""

    # Look for program in registry keys
    $registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths"
    $registryKeys = Get-ChildItem $registryPath -ErrorAction SilentlyContinue | Where-Object {$_.PSChildName -like "*$program*"}
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
            "C:\Program Files (x86)"
        )
        foreach ($dir in $dirs) {
            $files = Get-ChildItem $dir -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.Name -like "*$program*"}
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

    if ($programFound) {
        $output += "$program=`"$path`"`r`n"
    } else {
        Write-Host "Could not find program: $program"
    }
}

if ($output -ne "") {
    $output | Set-Content -Path (Join-Path -Path $PSScriptRoot -ChildPath "ProgramPaths.txt")
    Write-Host "Output saved to: $(Join-Path -Path $PSScriptRoot -ChildPath "ProgramPaths.txt")"
} else {
    Write-Host "No programs found"
}

Read-Host -Prompt "Press Enter to exit"
