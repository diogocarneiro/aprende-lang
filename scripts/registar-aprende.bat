@echo off
SETLOCAL

:: Caminhos personalizados
set ICON_PATH=%~dp0aprende-icon.ico
set PYTHON_PATH="C:\Program Files\Python313\python.exe"
set CLI_PATH=%~dp0cli.py

:: Criar arquivo .reg temporário
echo Windows Registry Editor Version 5.00 > registrar-aprende.reg
echo. >> registrar-aprende.reg
echo [HKEY_CLASSES_ROOT\.aprende] >> registrar-aprende.reg
echo @="AprendeLangFile" >> registrar-aprende.reg
echo. >> registrar-aprende.reg
echo [HKEY_CLASSES_ROOT\AprendeLangFile] >> registrar-aprende.reg
echo @="Arquivo Aprende" >> registrar-aprende.reg
echo. >> registrar-aprende.reg
echo [HKEY_CLASSES_ROOT\AprendeLangFile\DefaultIcon] >> registrar-aprende.reg
echo @="%ICON_PATH%" >> registrar-aprende.reg
echo. >> registrar-aprende.reg
echo [HKEY_CLASSES_ROOT\AprendeLangFile\shell\open\command] >> registrar-aprende.reg
echo @="%PYTHON_PATH% %CLI_PATH% \"%%1\"" >> registrar-aprende.reg

:: Aplicar registro
regedit /s registrar-aprende.reg

:: Limpar temporário
del registrar-aprende.reg

echo.
echo ✅ Instalação concluída! Arquivos .aprende agora têm ícone e podem ser executados com duplo clique.
pause
ENDLOCAL