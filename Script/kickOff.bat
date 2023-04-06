::Check for Admin? 

:: All the lines beneath this sentence have been double coloned ( :: ), 
:: this is done so the scripts ignores this first block. 
:: I have done this because it is not yet clear if we want to push these script as an admin or 
:: if we let the 'user/exam canidate' logon as an administrator to the device. 
:: So it's here for if we need the script to check for admin privileges. 

:: :-------------------------------------
:: REM --> Check if this file has administrator rights.
::    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
:: >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
:: ) ELSE (
:: >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
:: )

:: REM --> If no rights, we don't have setted the flag for it.
:: if '%errorlevel%' NEQ '0' (
::    echo Requesting administrative privileges...
::    goto UACPrompt
:: ) else ( goto gotAdmin )

:: :UACPrompt
    ::echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    ::set params= %*
    ::echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    ::"%temp%\getadmin.vbs"
    ::del "%temp%\getadmin.vbs"
    ::exit /B

:: :gotAdmin
    :: pushd "%CD%"
    :: CD /D "%~dp0"
:: :--------------------------------------    

:: Code explaination for 'new-time' users, or people who aren't familliar to .batch
:: We are only going to change the "START" line/commando that you see under the MAINCODE category.
:: START means that we want to run/start an application or kick something off.
:: In this case we add doulbe quotes to the START command, which looks like this; START ""
:: START "" -- means that we open a standard application that can open or do something with the later added information.
:: We want the script to open a browser which navigates to a Form that we specified...
:: So we add the link/redirect to the START command; START "" URL
:: start "" https://websiteURLofWhereItNeedsToNavigateToo 
:: Hit save and start the script.

:: Maincode - Goes to Google in this case.
@echo off
title SEB - Kick off your Form!
start firefox https://www.google.com/
pause
exit /b 

:: Maybe the PAUSE option should be deleted so SEB doesn't keep it open?