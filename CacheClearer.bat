cls
@echo off

echo This program was created by Luke Henderson
echo Email: lukemhenderson06@gmail.com
echo .
echo .

timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
    echo Running..
    echo .
) else (
    echo You must run me as an Administrator. Exiting..
    echo .
    echo Right-click on me and select ^'Run as Administrator^' and try again.
    echo .
    echo Press any key to exit..
    pause > NUL
    exit
)

set /p Input=Delete standard Windows cache? (y/n):
If /I "%Input%"=="y" goto normalyes
goto normalno

:normalyes
del /s /q /f "%HomePath%\AppData\Local\Temp\*.*"
for /d %%p in ("%HomePath%\AppData\Local\Temp\*.*") do rmdir "%%p" /s /q

del /s /q /f "%HomePath%\AppData\LocalLow\Temp\*.*"
for /d %%p in ("%HomePath%\AppData\LocalLow\Temp\*.*") do rmdir "%%p" /s /q

del /s /q /f "%AppData%\Temp\*.*"
for /d %%p in ("%AppData%\Temp\*.*") do rmdir "%%p" /s /q

del /s /q /f "%WinDir%\Temp\*.*"
for /d %%p in ("%WinDir%\Temp\*.*") do rmdir "%%p" /s /q

del /s /q /f "%Temp%\*.*"
for /d %%p in ("%Temp%\*.*") do rmdir "%%p" /s /q

del /s /q /f "%WinDir%\SoftwareDistribution\Download\*.*"
for /d %%p in ("%WinDir%\SoftwareDistribution\Download\*.*") do rmdir "%%p" /s /q

del /s /q /f "%WinDir%\Prefetch\*.*"
for /d %%p in ("%WinDir%\Prefetch\*.*") do rmdir "%%p" /s /q

del /s /q /f "%SYSTEMDRIVE%\AMD\*.*"
for /d %%p in ("%SYSTEMDRIVE%\AMD\*.*") do rmdir "%%p" /s /q

del /s /q /f "%SYSTEMDRIVE%\NVIDIA\*.*"
for /d %%p in ("%SYSTEMDRIVE%\NVIDIA\*.*") do rmdir "%%p" /s /q

del /s /q /f "%SYSTEMDRIVE%\INTEL\*.*"
for /d %%p in ("%SYSTEMDRIVE%\INTEL\*.*") do rmdir "%%p" /s /q

cd "C:\Windows\system32\"
cleanmgr.exe
WSReset.exe

ipconfig /flushdns

set /p Input=Update what applications open on startup? (y/n):
If /I "%Input%"=="y" goto startupyes
goto startupno

:startupyes
echo .
echo Opening System Configuration...
echo Select "Startup" at the top and then go to Task Manager
echo Choose what you want to run on startup
echo .

set /p Input=Delete old Windows update folder? (y/n):
If /I "%Input%"=="y" goto windowsoldyes
goto windowsoldno

:startupno
set /p Input=Delete old Windows update folder? (y/n):
If /I "%Input%"=="y" goto windowsoldyes
goto windowsoldno

:normalno
set /p Input=Delete old Windows update folder? (y/n):
If /I "%Input%"=="y" goto windowsoldyes
goto windowsoldno

:windowsoldyes
if not exist "C:\Windows.old" goto nowinold
del /s /q /f "C:\Windows.old\*.*"
for /d %%p in ("C:\Windows.old\*.*") do rmdir "%%p" /s /q

echo Old Windows update folder deleted

set /p Input=Delete Windows ten update folder? (y/n):
If /I "%Input%"=="y" goto windowsnewyes
goto windowsnewno

:nowinold
echo No old Windows update folder

set /p Input=Delete Windows ten update folder? (y/n):
If /I "%Input%"=="y" goto windowsnewyes
goto windowsnewno

:windowsoldno
set /p Input=Delete Windows ten update folder? (y/n):
If /I "%Input%"=="y" goto windowsnewyes
goto windowsnewno

:windowsnewyes
if not exist "C:\Windows10Upgrade" goto nowinnew
del /s /q /f "C:\Windows10Upgrade\*.*"
for /d %%p in ("C:\Windows10Upgrade\*.*") do rmdir "%%p" /s /q

echo Windows ten update folder deleted

set /p Input=Delete Browser History? (y/n):
If /I "%Input%"=="y" goto browseryes
goto browserno

:nowinnew
echo No Windows ten update folder

set /p Input=Delete Browser History? (y/n):
If /I "%Input%"=="y" goto browseryes
goto browserno

:windowsnewno
set /p Input=Delete Browser History? (y/n):
If /I "%Input%"=="y" goto browseryes
goto browserno

:browseryes
del /s /q /f "%HomePath%\AppData\Local\Google\Chrome\User Data\*.*"
for /d %%p in ("%HomePath%\AppData\Local\Google\Chrome\User Data\*.*") do rmdir "%%p" /s /q

del /s /q /f "%HomePath%\AppData\Local\Microsoft\Edge\User Data\*.*"
for /d %%p in ("%HomePath%\AppData\Local\Microsoft\Edge\User Data\*.*") do rmdir "%%p" /s /q

echo Deleted browser history

set /p Input=Delete Discord Cache? (y/n):
If /I "%Input%"=="y" goto discordyes
goto discordno

:browserno
set /p Input=Delete Discord Cache? (y/n):
If /I "%Input%"=="y" goto discordyes
goto discordno

:discordyes
del /s /q /f "%HomePath%\AppData\Roaming\Discord\Cache\*.*"
del /s /q /f "%HomePath%\AppData\Roaming\Discord\Code Cache\*.*"
del /s /q /f "%HomePath%\AppData\Roaming\Discord\GPUCache\*.*"

for /d %%p in ("%HomePath%\AppData\Roaming\Discord\Cache\*.*") do rmdir "%%p" /s /q
for /d %%p in ("%HomePath%\AppData\Roaming\Discord\Code Cache\*.*") do rmdir "%%p" /s /q
for /d %%p in ("%HomePath%\AppData\Roaming\Discord\GPUCache\*.*") do rmdir "%%p" /s /q

echo Deleted Discord cache

set /p Input=Delete Spotify Cache? (y/n):
If /I "%Input%"=="y" goto spotifyyes
goto spotifyno

:discordno
set /p Input=Delete Spotify Cache? (y/n):
If /I "%Input%"=="y" goto spotifyyes
goto spotifyno

:spotifyyes
del /s /q /f "%HomePath%\AppData\Local\Spotify\Data"
for /d %%p in ("%HomePath%\AppData\Local\Spotify\Data") do rmdir "%%p" /s /q

echo Deleted Spotify cache
echo .
echo It is recommended to restart your computer at this time
pause
exit

:spotifyno
echo .
echo It is recommended to restart your computer at this time
pause
exit
