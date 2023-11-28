@echo off
taskkill /im notepad++.exe /f
FOR /F "tokens=1-3 delims=:." %%a IN ("%TIME: =0%") DO (SET _Time=%%a%%b%%c)
set DT=Backup_%date:~0,4%-%date:~5,2%-%date:~8,2%_%_Time%
MD .\%DT%

for /D %%i in (*) do (
    if not "%%i"=="%DT%" move "%%i" .\%DT%
)
for /D %%i in (.\%DT%\Backup_*) do (
    move "%%i" "%~dp0"
)
for %%i in (*) do (
    if not "%%i"=="%~nx0" if not "%%i"=="RestoreNppSetting.cmd" move "%%i" .\%DT%
)


MD .\appdata
MD .\ahk_fun_list

xcopy %appdata%\Notepad++\ .\appdata\ /E /Q /C /H /R /Y
del .\appdata\session.xml
xcopy "%programfiles%\Notepad++\functionList\" .\ahk_fun_list\ /E /Q /C /H /R /Y
start notepad++.exe
