@echo off 
setlocal
set _filename=%~n1
set _extension=%~x1

if not %_extension%==.AppxBundle goto Error

echo Install in progress...
PowerShell Add-AppxPackage -Path "%_filename%%_extension%"
endlocal 
echo Install DONE! 
pause>nul
exit

:Error
echo Is not a AppxBundle file
echo Install ABORD!
endlocal  
pause>nul
exit