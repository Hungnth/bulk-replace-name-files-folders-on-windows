## Description:
This script is designed to facilitate the renaming of files and folders by replacing specified characters or strings within their names. It allows users to replace a single character or a sequence of characters within file and folder names in a specified directory.

## Usage Instructions:
1. Download the script file from the repository or copy the contents into a new file with a `.bat` extension.
2. Place the `.bat` file in the parent directory containing the files and folders you wish to rename (replace characters).
3. Run the `.bat` file.
4. Follow the prompts:
   - Enter the string you want to replace.
   - Enter the string you want to replace it with (leave blank if no replacement is needed).
5. Confirm if you want to continue renaming files and folders.
6. The script will execute the renaming process based on the provided inputs.

## Notes:
- This script is compatible with Windows operating systems only.
- It is recommended to backup files and folders before running the script, as there is no built-in undo functionality for name changes.
- **This script can modify multiple files and folders at once. Ensure that the replacement strings provided do not unintentionally affect other file or folder names.**

```batch
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
```
