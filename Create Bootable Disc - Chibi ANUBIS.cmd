@echo off
title Create Bootable Disc - Chibi ANUBIS
cls

SET IMAGE=C:\COMPIL\ISO
SET ISOPath=C:\COMPIL
SET ISOLABEL=Win10PROx64
SET ISONAME=Win10PROx64

:: ========================NO CHANGE BELOW THIS LINE===========================

if exist "%programfiles%\Windows kits" SET "_dirADK=%programfiles%\Windows kits"
if exist "%programfiles(x86)%\Windows kits" SET "_dirADK=%programfiles(x86)%\Windows kits"
if not defined _dirADK goto exit
	
	if exist "%IMAGE%\efi\microsoft\boot\efisys.bin" (
		"%_dirADK%\10\Assessment and Deployment Kit\Deployment Tools\%PROCESSOR_ARCHITECTURE%\Oscdimg\oscdimg.exe" -l"%ISOLABEL%" -m -oc -u2 -udfver102 -bootdata:2#p0,e,b"%IMAGE%\boot\etfsboot.com"#pEF,e,b"%IMAGE%\efi\microsoft\boot\efisys.bin" "%IMAGE%" "%ISOPath%\%ISONAME%.iso"
	) else (
		"%_dirADK%\10\Assessment and Deployment Kit\Deployment Tools\%PROCESSOR_ARCHITECTURE%\Oscdimg\oscdimg.exe" -l"%ISOLABEL%" -m -oc -u2 -udfver102 -b"%IMAGE%\boot\etfsboot.com" "%IMAGE%" "%ISOPath%\%ISONAME%.iso"
	)

echo.
echo Process finished, press any key to exit...
pause>nul
exit
