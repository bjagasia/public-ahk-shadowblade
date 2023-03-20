@echo off
powershell.exe -Command "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0findPath.ps1""' -Verb RunAs"
