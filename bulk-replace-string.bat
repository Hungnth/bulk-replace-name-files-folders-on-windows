@echo off
setlocal enabledelayedexpansion

:continue
cls
set /p old_string=Enter the string you want to replace: 
set /p new_string=Enter the string you want to replace it with: 

for %%a in (*%old_string%*) do (
  set file=%%a
  set new_name=!file:%old_string%=%new_string%!
  ren "!file!" "!new_name!"
)

echo Do you want to continue (Y/N)?
choice /C YN /N
set choice=%errorlevel%
if "%choice%"=="1" goto :continue
if "%choice%"=="2" goto :eof

exit