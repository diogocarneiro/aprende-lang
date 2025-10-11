@echo off
echo ========================================
echo   Conversor PNG para ICO - Aprende
echo ========================================
echo.

if not exist "icon.png" (
    echo ERRO: icon.png nao encontrado!
    pause
    exit /b 1
)

echo Ficheiro icon.png encontrado!
echo.

echo Para converter PNG para ICO, podes usar:
echo.
echo OPCAO 1 - Online (recomendado):
echo https://convertio.co/png-ico/
echo https://cloudconvert.com/png-to-ico
echo.
echo OPCAO 2 - ImageMagick (se instalado):
echo magick icon.png -resize 256x256 aprende-icon-novo.ico
echo.
echo OPCAO 3 - PowerShell (Windows 10+):
echo Add-Type -AssemblyName System.Drawing
echo $img = [System.Drawing.Image]::FromFile("icon.png")
echo $ico = [System.Drawing.Icon]::FromHandle($img.GetHicon())
echo.

echo Depois de converter:
echo 1. Renomeia o ficheiro para aprende-icon.ico
echo 2. Substitui o ficheiro atual
echo 3. Executa configurar-icone.bat
echo.
pause