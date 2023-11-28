@echo off 
REM attrib -s -h -r %appdata%\Notepad++
taskkill /im notepad++.exe /f
rmdir %appdata%\Notepad++ /Q /S
MD %appdata%\Notepad++
timeout -t 1 /nobreak
xcopy .\appdata\ "%appdata%\Notepad++\" /E /Q /C /H /R /X /Y
copy .\ahk_fun_list\*.* "%programfiles%\Notepad++\functionList\" /Y
start notepad++.exe