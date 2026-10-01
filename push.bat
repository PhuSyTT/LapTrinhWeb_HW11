@echo off
chcp 65001 >nul
set "PATH=%LOCALAPPDATA%\Programs\MinGit\cmd;%LOCALAPPDATA%\Programs\Git Credential Manager;%PATH%"
echo ========================================================
echo   AURA KICKS - Git Push to GitHub
echo   Repository: https://github.com/PhuSyTT/LapTrinhWeb_HW11.git
echo   Branch: main
echo ========================================================
echo.
git push -u origin main
echo.
pause
