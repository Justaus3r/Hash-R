@echo off
reg save hklm\sam "%~dp0SAM"
reg save hklm\system "%~dp0SYSTEM"
