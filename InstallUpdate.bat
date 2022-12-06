@echo off
color f0
title Initializing...

SET _DirUpdate=%CD%

for /f "delims=" %%i in ('dir /b /a-d "%_DirUpdate%\Windows10.0-*.cab"') do set "result=%%i"

if not defined result goto error

SET _TITLE=Installing %result%.
title %_TITLE%
echo Installing %_TITLE% Update

Dism /Online /Add-Package /PackagePath:%_DirUpdate%\%result%

echo Press any keys for exit.
pause>nul
exit

:error
echo No update found ^^!
echo Press any keys for exit.
pause>nul
exit