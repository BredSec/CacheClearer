@echo off

set /p Input=Delete standard Windows cache? (y/n):
If /I "%Input%"=="y" goto normalyes
goto normalno

:normalyes
del /s /q "C:\Users\%username%\AppData\Local\Temp\*.*"
for /d %%p in ("C:\Users\%username%\AppData\Local\Temp\*.*") do rmdir "%%p" /s /q

del /s /q "C:\Users\%username%\AppData\LocalLow\Temp\*.*"
for /d %%p in ("C:\Users\%username%\AppData\LocalLow\Temp\*.*") do rmdir "%%p" /s /q

del /s /q "C:\Windows\Temp\*.*"
for /d %%p in ("C:\Windows\Temp\*.*") do rmdir "%%p" /s /q

del /s /q "C:\Windows\SoftwareDistribution\Download\*.*"
for /d %%p in ("C:\Windows\SoftwareDistribution\Download\*.*") do rmdir "%%p" /s /q

del /s /q "%WinDir%\Prefetch\*.*"
for /d %%p in ("%WinDir%\Prefetch\*.*") do rmdir "%%p" /s /q

del /s /q "%SYSTEMDRIVE%\AMD\*.*"
for /d %%p in ("%SYSTEMDRIVE%\AMD\*.*") do rmdir "%%p" /s /q

del /s /q "%SYSTEMDRIVE%\NVIDIA\*.*"
for /d %%p in ("%SYSTEMDRIVE%\NVIDIA\*.*") do rmdir "%%p" /s /q

del /s /q "%SYSTEMDRIVE%\INTEL\*.*"
for /d %%p in ("%SYSTEMDRIVE%\INTEL\*.*") do rmdir "%%p" /s /q

cd "C:\Windows\system32\"
cleanmgr.exe
WSReset.exe

ipconfig /flushdns

set /p Input=Delete old Windows update folder? (y/n):
If /I "%Input%"=="y" goto windowsoldyes
goto windowsoldno

:normalno
set /p Input=Delete old Windows update folder? (y/n):
If /I "%Input%"=="y" goto windowsoldyes
goto windowsoldno

:windowsoldyes
if not exist "C:\Windows.old" goto nowinold
del /s /q "C:\Windows.old\*.*"
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
del /s /q "C:\Windows10Upgrade\*.*"
for /d %%p in ("C:\Windows10Upgrade\*.*") do rmdir "%%p" /s /q

echo Windows ten update folder deleted

set /p Input=Delete Discord Cache? (y/n):
If /I "%Input%"=="y" goto discordyes
goto discordno

:nowinnew
echo No Windows ten update folder

set /p Input=Delete Discord Cache? (y/n):
If /I "%Input%"=="y" goto discordyes
goto discordno

:windowsnewno
set /p Input=Delete Discord Cache? (y/n):
If /I "%Input%"=="y" goto discordyes
goto discordno

:discordyes
del /s /q "C:\Users\%username%\AppData\Roaming\Discord\Cache\*.*"
del /s /q "C:\Users\%username%\AppData\Roaming\Discord\Code Cache\*.*"
del /s /q "C:\Users\%username%\AppData\Roaming\Discord\GPUCache\*.*"

for /d %%p in ("C:\Users\%username%\AppData\Roaming\Discord\Cache\*.*") do rmdir "%%p" /s /q
for /d %%p in ("C:\Users\%username%\AppData\Roaming\Discord\Code Cache\*.*") do rmdir "%%p" /s /q
for /d %%p in ("C:\Users\%username%\AppData\Roaming\Discord\GPUCache\*.*") do rmdir "%%p" /s /q

echo Deleted Discord cache

set /p Input=Delete Spotify Cache? (y/n):
If /I "%Input%"=="y" goto spotifyyes
goto spotifyno

:discordno
set /p Input=Delete Spotify Cache? (y/n):
If /I "%Input%"=="y" goto spotifyyes
goto spotifyno

:spotifyyes
del /s /q "C:\Users\%username%\AppData\Local\Spotify\Data"
for /d %%p in ("C:\Users\%username%\AppData\Local\Spotify\Data") do rmdir "%%p" /s /q

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
