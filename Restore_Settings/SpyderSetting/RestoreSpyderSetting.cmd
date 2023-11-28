@echo off 
rmdir "%USERPROFILE%\.spyder-py3" /Q /S
MD "%USERPROFILE%\.spyder-py3"
timeout -t 1 /nobreak
xcopy .\SpyderPref\ "%USERPROFILE%\.spyder-py3\" /E /Q /C /H /R /X /Y