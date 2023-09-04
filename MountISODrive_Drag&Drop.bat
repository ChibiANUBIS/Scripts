@echo off
set "img=%1"
IF "%img%" == "" exit

ECHO.
ECHO Please wait...
call :mount_iso "%img%" iso
Echo Mounted ISO drive letter : %iso%

ECHO.
ECHO Pause before unmount
ECHO Press any keys for unmount
pause>nul

ECHO.
ECHO Please wait...
call :unmount_iso "%img%" 
exit


:mount_iso
for /f "usebackq" %%? in (`powershell "(Mount-DiskImage -ImagePath '%1' -PassThru|Get-Volume).DriveLetter"`) do set "%~2=%%?:"
exit /b

:unmount_iso
powershell DisMount-DiskImage -ImagePath '%1' >nul
exit /b

