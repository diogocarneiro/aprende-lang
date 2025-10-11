@echo off
echo ========================================
echo    Configurador de Icone - Aprende
echo ========================================
echo.

REM Verificar se o ficheiro de icone existe
if not exist "aprende-icon.ico" (
    echo ERRO: aprende-icon.ico nao encontrado!
    echo.
    echo Se tens um icone diferente:
    echo 1. Converte para formato ICO
    echo 2. Renomeia para aprende-icon.ico
    echo 3. Executa este script novamente
    echo.
    pause
    exit /b 1
)

echo [1/3] Icone encontrado: aprende-icon.ico ✓
echo.

echo [2/3] A aplicar configuracoes do registo...
regedit /s registar.reg
if errorlevel 1 (
    echo ERRO: Falha ao aplicar registo!
    echo Executa como administrador se necessario.
    pause
    exit /b 1
)
echo Registo aplicado! ✓
echo.

echo [3/3] A atualizar cache de icones...
ie4uinit.exe -ClearIconCache >nul 2>&1
ie4uinit.exe -show >nul 2>&1
echo Cache atualizada! ✓
echo.

echo ========================================
echo      Icone Configurado! 🎉
echo ========================================
echo.
echo O icone personalizado foi aplicado aos ficheiros .aprende
echo.
echo Para verificar:
echo 1. Abre o Explorador de Ficheiros
echo 2. Navega para esta pasta
echo 3. Verifica se teste-icone.aprende tem o icone personalizado
echo.
echo Se o icone nao aparecer imediatamente:
echo - Pressiona F5 para atualizar
echo - Ou reinicia o Explorador de Ficheiros
echo.
pause