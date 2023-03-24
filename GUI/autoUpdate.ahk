#NoEnv
#SingleInstance, Force

; Function to download a file from a URL to a local path
DownloadIncludeFile(url, targetFile) {
    URLDownloadToFile, %url%, %targetFile%
}

; Function to calculate the SHA-1 checksum of a file
CalculateFileChecksum(filePath) {
    FileRead, content, %filePath%
    return content ? sha1(content) : ""
}

; Function to check if the cloud version of the include file has changed and update it if necessary
UpdateIncludeFileIfNeeded(cloudUrl, localPath) {
    localChecksum := CalculateFileChecksum(localPath)
    tempPath := A_Temp "\temp_include.ahk"
    
    DownloadIncludeFile(cloudUrl, tempPath)
    cloudChecksum := CalculateFileChecksum(tempPath)
    
    if (localChecksum != cloudChecksum) {
        FileDelete, %localPath%
        FileMove, %tempPath%, %localPath%
    } else {
        FileDelete, %tempPath%
    }
}

; Update the following URL with the direct download link for your cloud-hosted include file
cloudUrl := "https://your-cloud-service.com/path/to/shared_include.ahk"
; Update the following path with the desired local path for the include file
localPath := "shared_include.ahk"

UpdateIncludeFileIfNeeded(cloudUrl, localPath)

; Include the local version of the shared include file
#Include shared_include.ahk

; Set a timer to check for updates every hour (3600000 milliseconds)
; You can adjust the interval by changing the value (in milliseconds)
SetTimer, UpdateCheck, 3600000
return

; Function called by the timer to periodically check for updates to the include file
UpdateCheck:
    UpdateIncludeFileIfNeeded(cloudUrl, localPath)
return
