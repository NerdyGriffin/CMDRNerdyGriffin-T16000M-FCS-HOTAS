@echo off
setlocal
REM Setup.bat - copy this repo's binding files into Elite Dangerous' Bindings folder.
REM Run from anywhere; files are taken from the folder this script lives in.

set "SRC=%~dp0"
set "DST=%LOCALAPPDATA%\Frontier Developments\Elite Dangerous\Options\Bindings"
set "BINDS=CMDRNerdyGriffin-T16000M-FCS-HOTAS-V1.0.4.0.binds"

echo Source:      %SRC%
echo Destination: %DST%
echo.

tasklist /FI "IMAGENAME eq EliteDangerous64.exe" 2>NUL | find /I "EliteDangerous64.exe" >NUL
if not errorlevel 1 (
    echo Elite Dangerous is running. Close the game first - it only reads StartPreset at launch
    echo and may overwrite these files on exit.
    goto :fail
)

if not exist "%DST%" (
    echo Bindings folder not found. Has the game been launched at least once on this machine?
    goto :fail
)

for %%F in ("%BINDS%" "StartPreset.4.start" "StartPreset.start") do (
    if not exist "%SRC%%%~F" (
        echo Missing from repo: %%~F
        goto :fail
    )
)

REM Keep whatever selectors were there before, so the previous scheme can be restored.
for %%F in ("StartPreset.4.start" "StartPreset.start") do (
    if exist "%DST%\%%~F" (
        copy /Y "%DST%\%%~F" "%DST%\%%~F.bak" >NUL && echo Backed up %%~F to %%~F.bak
    )
)

for %%F in ("%BINDS%" "StartPreset.4.start" "StartPreset.start") do (
    copy /Y "%SRC%%%~F" "%DST%\" >NUL || (
        echo Failed to copy %%~F
        goto :fail
    )
    echo Copied %%~F
)

echo.
echo Done. Start the game; the scheme should be selected in all four control contexts.
echo If BindingLoadingErrors.log reports "Missing devices", plug in the HOTAS and relaunch.
endlocal
pause
exit /b 0

:fail
echo.
echo Nothing was changed.
endlocal
pause
exit /b 1
