@echo off
chcp 65001 >nul
title Instalador da Linguagem Aprende

echo.
echo ████████████████████████████████████████████████████████
echo          LINGUAGEM APRENDE - INSTALADOR WINDOWS
echo          Programacao em portugues para criancas
echo ████████████████████████████████████████████████████████
echo.

:MENU
echo.
echo Escolha uma opcao:
echo.
echo   [1] Instalacao Completa
echo   [2] Verificar Sistema  
echo   [3] Instalar Extensao VS Code
echo   [4] Testar Linguagem
echo   [5] Sair
echo.
set /p opcao="Digite sua escolha (1-5): "

if "%opcao%"=="1" goto INSTALAR_TUDO
if "%opcao%"=="2" goto VERIFICAR
if "%opcao%"=="3" goto INSTALAR_EXT
if "%opcao%"=="4" goto TESTAR
if "%opcao%"=="5" goto SAIR

echo Opcao invalida!
goto MENU

:INSTALAR_TUDO
echo.
echo == INSTALACAO COMPLETA ==
echo.

echo 1. Verificando Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Python nao encontrado!
    echo Instale Python 3.8+ de: https://python.org/downloads
    pause
    goto MENU
) else (
    echo OK: Python encontrado!
)

echo.
echo 2. Verificando VS Code...
code --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: VS Code nao encontrado!
    echo Instale VS Code de: https://code.visualstudio.com
    pause
    goto MENU
) else (
    echo OK: VS Code encontrado!
)

echo.
echo 3. Instalando extensao...
if not exist "vscode-extension\aprende-lang-1.1.2.vsix" (
    echo ERRO: Arquivo da extensao nao encontrado!
    pause
    goto MENU
)

code --install-extension "vscode-extension\aprende-lang-1.1.2.vsix" --force >nul 2>&1
if errorlevel 1 (
    echo ERRO: Falha ao instalar extensao!
) else (
    echo OK: Extensao instalada!
)

echo.
echo 4. Testando interpretador...
if not exist "teste-simples.aprende" (
    echo ERRO: Arquivo de teste nao encontrado!
    pause
    goto MENU
)

python aprende.py teste-simples.aprende >nul 2>&1
if errorlevel 1 (
    echo ERRO: Teste falhou!
) else (
    echo OK: Teste passou!
)

echo.
echo INSTALACAO CONCLUIDA COM SUCESSO!
echo.
echo Para comecar:
echo 1. Abra VS Code
echo 2. Crie arquivo .aprende
echo 3. Digite: mostra "Ola mundo!"
echo 4. Execute: python aprende.py meuarquivo.aprende
echo.
pause
goto MENU

:VERIFICAR
echo.
echo == VERIFICACAO DO SISTEMA ==
echo.

echo Verificando Python...
python --version 2>&1
if errorlevel 1 (
    echo ERRO: Python nao encontrado!
) else (
    echo OK: Python funcionando!
)

echo.
echo Verificando VS Code...
code --version 2>&1
if errorlevel 1 (
    echo ERRO: VS Code nao encontrado!
) else (
    echo OK: VS Code funcionando!
)

echo.
echo Verificando extensao Aprende...
code --list-extensions | findstr "aprende-lang" >nul 2>&1
if errorlevel 1 (
    echo ERRO: Extensao nao instalada!
) else (
    echo OK: Extensao instalada!
)

echo.
echo Verificando arquivos do projeto...
if exist "aprende.py" (
    echo OK: Interpretador encontrado!
) else (
    echo ERRO: aprende.py nao encontrado!
)

if exist "teste-simples.aprende" (
    echo OK: Arquivo de teste encontrado!
) else (
    echo ERRO: teste-simples.aprende nao encontrado!
)

echo.
pause
goto MENU

:INSTALAR_EXT
echo.
echo == INSTALANDO EXTENSAO VS CODE ==
echo.

echo Verificando VS Code...
code --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: VS Code nao encontrado!
    echo Instale de: https://code.visualstudio.com
    pause
    goto MENU
)

echo VS Code OK!
echo.
echo Instalando extensao...

if not exist "vscode-extension\aprende-lang-1.1.2.vsix" (
    echo ERRO: Arquivo da extensao nao encontrado!
    echo Esperado: vscode-extension\aprende-lang-1.1.2.vsix
    pause
    goto MENU
)

code --install-extension "vscode-extension\aprende-lang-1.1.2.vsix" --force
if errorlevel 1 (
    echo ERRO: Falha na instalacao!
    echo.
    echo Tente instalar manualmente:
    echo 1. Abra VS Code
    echo 2. Ctrl+Shift+P
    echo 3. Digite: Extensions: Install from VSIX
    echo 4. Selecione: vscode-extension\aprende-lang-1.1.2.vsix
) else (
    echo SUCESSO: Extensao instalada!
)

echo.
pause
goto MENU

:TESTAR
echo.
echo == TESTANDO LINGUAGEM APRENDE ==
echo.

echo Verificando interpretador...
if not exist "aprende.py" (
    echo ERRO: aprende.py nao encontrado!
    pause
    goto MENU
)

if not exist "teste-simples.aprende" (
    echo ERRO: teste-simples.aprende nao encontrado!
    pause
    goto MENU
)

echo Executando teste...
echo.
echo ==========================================
python aprende.py teste-simples.aprende
echo ==========================================
echo.

if errorlevel 1 (
    echo ERRO: Teste falhou!
) else (
    echo SUCESSO: Teste passou!
)

echo.
pause
goto MENU

:SAIR
echo.
echo Obrigado por usar a Linguagem Aprende!
echo.
echo Para programar:
echo - Abra VS Code
echo - Crie arquivo .aprende  
echo - Digite codigo em portugues
echo - Execute: python aprende.py seuarquivo.aprende
echo.
pause
exit