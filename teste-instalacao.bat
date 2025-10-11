@echo off
chcp 65001 >nul
title Teste Automatico - Linguagem Aprende

echo.
echo ===============================================
echo    TESTE AUTOMATICO - LINGUAGEM APRENDE
echo ===============================================
echo.

:: Teste 1: Python
echo [1/5] Testando Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo    FALHOU: Python nao encontrado!
    exit /b 1
) else (
    echo    OK: Python funcionando!
)

:: Teste 2: VS Code
echo [2/5] Testando VS Code...
code --version >nul 2>&1
if errorlevel 1 (
    echo    FALHOU: VS Code nao encontrado!
    exit /b 1
) else (
    echo    OK: VS Code funcionando!
)

:: Teste 3: Arquivo do interpretador
echo [3/5] Testando interpretador...
if not exist "aprende.py" (
    echo    FALHOU: aprende.py nao encontrado!
    exit /b 1
) else (
    echo    OK: Interpretador encontrado!
)

:: Teste 4: Extensao VS Code
echo [4/5] Testando extensao...
if not exist "vscode-extension\aprende-lang-1.1.2.vsix" (
    echo    FALHOU: Extensao nao encontrada!
    exit /b 1
) else (
    echo    OK: Extensao encontrada!
)

:: Teste 5: Executar programa de teste
echo [5/5] Testando execucao...
if not exist "teste-simples.aprende" (
    echo    FALHOU: Arquivo de teste nao encontrado!
    exit /b 1
)

python aprende.py teste-simples.aprende >nul 2>&1
if errorlevel 1 (
    echo    FALHOU: Erro na execucao!
    exit /b 1
) else (
    echo    OK: Execucao bem-sucedida!
)

echo.
echo ===============================================
echo     TODOS OS TESTES PASSARAM COM SUCESSO!
echo     A Linguagem Aprende esta pronta para usar!
echo ===============================================
echo.

echo Para comecar a programar:
echo 1. Abra VS Code
echo 2. Crie um arquivo .aprende
echo 3. Digite: mostra "Ola mundo!"
echo 4. Execute: python aprende.py seuarquivo.aprende
echo.

exit /b 0