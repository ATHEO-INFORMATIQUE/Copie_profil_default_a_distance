@echo off
setlocal

:: Définir le chemin du script PowerShell
set "scriptPath=%~dp0Copie_profil_par_default.ps1"

:: Vérifier si le script PowerShell existe
if not exist "%scriptPath%" (
    echo Le script PowerShell n'a pas été trouvé.
    pause
    exit /b 1
)

:: Lancer le script PowerShell en tant qu'administrateur
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%scriptPath%""' -Verb RunAs"

endlocal
