@echo off

    call :MsgBox "Nyan cat annoying? Would you like an uninstaller?"  "VBYesNo+VBQuestion" "Click yes for an uninstaller, click no if you love nyan cat"
    if errorlevel 7 (
        echo NO - apparently you love nyan cat. Nyan cat will be launched again next time you boot up your pc
		start "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\counter.bat"
		del crash.txt
		start /b "" cmd /c del "%~f0"&exit /b
    ) else if errorlevel 6 (
        echo YES - Uninstaller has been placed on your desktop, as NyanRemover.bat Run the file and nyan cat will be gone :(
        call :MsgBox "Uninstaller has been placed on your desktop, as NyanRemover.bat Run the file and nyan cat will be gone :("
		move "%AppData%\Kitty\Files\NyanRemover.bat" "%UserProfile%\desktop"
    )

    exit /b

:MsgBox prompt type title
    setlocal enableextensions
    set "tempFile=%temp%\%~nx0.%random%%random%%random%vbs.tmp"
    >"%tempFile%" echo(WScript.Quit msgBox("%~1",%~2,"%~3") & cscript //nologo //e:vbscript "%tempFile%"
    set "exitCode=%errorlevel%" & del "%tempFile%" >nul 2>nul
    endlocal & exit /b %exitCode%