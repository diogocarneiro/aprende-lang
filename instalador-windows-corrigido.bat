@echo off
chcp 65001 >nul 2>&1
title Instalador da Linguagem Aprende 🚀

:: ====================================================================
::  INSTALADOR CORRIGIDO DA LINGUAGEM APRENDE - WINDOWS
::  Uma linguagem de programação em português para crianças
:: ====================================================================

:: Verificar se está executando como administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ⚠️  AVISO: Não está executando como Administrador
    echo.
    echo 💡 Para configurar associações de ficheiros completamente,
    echo    é recomendado executar como Administrador.
    echo.
    echo    Clique direito no ficheiro e escolha "Executar como administrador"
    echo.
    set /p continue=Continuar mesmo assim? (S/n): 
    if /i "%continue%"=="n" exit /b 1
    echo.
)

cls
echo.
echo ██████╗ ███████╗███╗   ███╗     ██╗   ██╗██╗███╗   ██╗██████╗  ██████╗ 
echo ██╔══██╗██╔════╝████╗ ████║     ██║   ██║██║████╗  ██║██╔══██╗██╔═══██╗
echo ██████╔╝█████╗  ██╔████╔██║     ██║   ██║██║██╔██╗ ██║██║  ██║██║   ██║
echo ██╔══██╗██╔══╝  ██║╚██╔╝██║     ╚██╗ ██╔╝██║██║╚██╗██║██║  ██║██║   ██║
echo ██████╔╝███████╗██║ ╚═╝ ██║      ╚████╔╝ ██║██║ ╚████║██████╔╝╚██████╔╝
echo ╚═════╝ ╚══════╝╚═╝     ╚═╝       ╚═══╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ 
echo.
echo            🎯 LINGUAGEM APRENDE - INSTALADOR CORRIGIDO 🎯
echo            📚 Programação em português para crianças e iniciantes
echo.
echo            👨 Autor:    Diogo Carneiro
echo            📧 Email:    diogocarneiro@outlook.com
echo            🐱 GitHub:   https://github.com/diogocarneiro
echo.
echo            📦 Projeto:  Aprende-lang
echo            📅 Versão:   1.1.2
echo            🐍           Python 3.8+ ^| 📦VS Code Extension
echo.

:MENU_PRINCIPAL
echo.
echo 🔧 INSTALADOR DA LINGUAGEM APRENDE
echo.
echo Escolha uma opção:
echo.
echo   [1] 🚀 Instalação Completa (Recomendado)
echo   [2] 🔍 Verificar Sistema
echo   [3] 🎨 Instalar apenas VS Code Extension
echo   [4] 📁 Configurar Associações de Ficheiros
echo   [5] 🧪 Testar Instalação
echo   [6] 📖 Mostrar Documentação
echo   [7] ❌ Sair
echo.
set /p opcao=Digite sua escolha (1-7): 

if "%opcao%"=="1" goto INSTALACAO_COMPLETA
if "%opcao%"=="2" goto VERIFICAR_SISTEMA
if "%opcao%"=="3" goto INSTALAR_VSCODE
if "%opcao%"=="4" goto ASSOCIAR_FICHEIROS
if "%opcao%"=="5" goto TESTAR_INSTALACAO
if "%opcao%"=="6" goto MOSTRAR_DOCS
if "%opcao%"=="7" goto SAIR

echo ❌ Opção inválida! Tente novamente.
goto MENU_PRINCIPAL

:INSTALACAO_COMPLETA
cls
echo.
echo 🚀 INSTALAÇÃO COMPLETA DA LINGUAGEM APRENDE
echo ==========================================
echo.
echo Esta instalação vai configurar:
echo   ✅ Verificar e instalar Python
echo   ✅ Instalar extensão do VS Code
echo   ✅ Configurar associações de ficheiros .aprende
echo   ✅ Testar a instalação
echo.
set /p confirm=Deseja continuar? (S/n): 
if /i "%confirm%"=="n" goto MENU_PRINCIPAL

echo.
echo 📋 Iniciando instalação...
echo.

:: Verificar Python
call :VERIFICAR_PYTHON
if %errorlevel% neq 0 goto ERRO_PYTHON

:: Instalar VS Code Extension
call :INSTALAR_EXTENSAO_VSCODE

:: Configurar associações
call :CONFIGURAR_ASSOCIACOES

:: Testar
call :TESTAR_LINGUAGEM

echo.
echo 🎉 INSTALAÇÃO COMPLETA COM SUCESSO! 🎉
echo.
echo 📚 Para começar a programar:
echo   1. Abra o VS Code
echo   2. Crie um ficheiro com extensão .aprende
echo   3. Comece a escrever código em português!
echo.
echo 📖 Exemplos disponíveis na pasta 'examples\'
echo.
pause
goto MENU_PRINCIPAL

:VERIFICAR_SISTEMA
cls
echo.
echo 🔍 VERIFICAÇÃO DO SISTEMA
echo =========================
echo.

:: Verificar Python
echo 🐍 Verificando Python...
python --version >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=2" %%v in ('python --version 2^>^&1') do echo ✅ Python %%v encontrado e funcionando!
) else (
    echo ❌ Python não encontrado
    echo 📥 É necessário instalar Python 3.8 ou superior
    echo 🌐 Baixe em: https://python.org/downloads
)

echo.

:: Verificar VS Code
echo 🎨 Verificando VS Code...
code --version >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=1" %%v in ('code --version 2^>^&1') do echo ✅ VS Code %%v encontrado e funcionando!
) else (
    echo ❌ VS Code não encontrado
    echo 📥 É necessário instalar Visual Studio Code
    echo 🌐 Baixe em: https://code.visualstudio.com
)

echo.

:: Verificar extensão Aprende
echo 🧩 Verificando extensão Aprende...
code --list-extensions 2>nul | findstr /i "aprende-lang" >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Extensão Aprende instalada e funcionando!
) else (
    echo ❌ Extensão Aprende não instalada
    echo 💡 Use a opção 3 do menu para instalar
)

echo.

:: Verificar ficheiros do projeto
echo 📁 Verificando ficheiros do projeto...
if exist "aprende.py" (
    echo ✅ Interpretador Aprende encontrado
) else (
    echo ❌ Interpretador Aprende não encontrado (aprende.py)
)

if exist "vscode-extension\aprende-lang-1.1.2.vsix" (
    echo ✅ Extensão VS Code encontrada
) else (
    echo ❌ Extensão VS Code não encontrada
)

if exist "teste-simples.aprende" (
    echo ✅ Ficheiro de teste encontrado
) else (
    echo ❌ Ficheiro de teste não encontrado
)

echo.
echo 📊 Verificação concluída!
echo.
pause
goto MENU_PRINCIPAL

:INSTALAR_VSCODE
cls
echo.
echo 🎨 INSTALANDO EXTENSÃO VS CODE
echo ==============================
echo.
call :INSTALAR_EXTENSAO_VSCODE
pause
goto MENU_PRINCIPAL

:ASSOCIAR_FICHEIROS
cls
echo.
echo 📁 CONFIGURANDO ASSOCIAÇÕES DE FICHEIROS
echo ========================================
echo.
call :CONFIGURAR_ASSOCIACOES
pause
goto MENU_PRINCIPAL

:TESTAR_INSTALACAO
cls
echo.
echo 🧪 TESTANDO INSTALAÇÃO
echo ======================
echo.
call :TESTAR_LINGUAGEM
pause
goto MENU_PRINCIPAL

:MOSTRAR_DOCS
cls
echo.
echo 📖 DOCUMENTAÇÃO DA LINGUAGEM APRENDE
echo ====================================
echo.
echo 🎯 A Linguagem Aprende é uma linguagem de programação criada
echo    especialmente para crianças e iniciantes portugueses.
echo.
echo 📝 COMANDOS BÁSICOS:
echo    mostra "texto"           - Exibe texto na tela
echo    definir nome valor       - Cria uma variável
echo    calcular expressão       - Faz cálculos matemáticos
echo    ler "pergunta"          - Lê entrada do utilizador
echo.
echo 🔄 ESTRUTURAS DE CONTROLO:
echo    se condicao entao...     - Condições
echo    para i de 1 ate 10...    - Loops
echo    enquanto condicao...     - Loops condicionais
echo    funcao nome^(^)...         - Funções personalizadas
echo.
echo 📁 EXEMPLOS:
echo    Veja a pasta 'examples\' para programas de exemplo
echo.
echo 🌐 DOCUMENTAÇÃO COMPLETA:
echo    Consulte a pasta 'docs\' para guias detalhados
echo.
pause
goto MENU_PRINCIPAL

:: ====================================================================
:: FUNÇÕES AUXILIARES
:: ====================================================================

:VERIFICAR_PYTHON
echo 🐍 Verificando Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ❌ Python não encontrado no sistema!
    echo.
    echo 📥 Para usar a Linguagem Aprende, precisa de Python 3.8 ou superior.
    echo 🌐 Baixe e instale Python em: https://python.org/downloads
    echo.
    echo 💡 DICA: Durante a instalação do Python, marque:
    echo    ✅ "Add Python to PATH"
    echo    ✅ "Install for all users"
    echo.
    set /p open_python=Abrir página de download do Python? (S/n): 
    if /i not "%open_python%"=="n" start https://python.org/downloads
    echo.
    echo Reinstale após instalar o Python.
    exit /b 1
) else (
    for /f "tokens=2" %%v in ('python --version 2^>^&1') do echo ✅ Python %%v encontrado e funcionando!
)
exit /b 0

:INSTALAR_EXTENSAO_VSCODE
echo 🎨 Verificando VS Code...
code --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ VS Code não encontrado no sistema!
    echo 📥 Instale o Visual Studio Code primeiro
    echo 🌐 Baixe em: https://code.visualstudio.com
    exit /b 1
)

echo ✅ VS Code encontrado!
echo.
echo 🧩 Instalando extensão Aprende...

if not exist "vscode-extension\aprende-lang-1.1.2.vsix" (
    echo ❌ Ficheiro da extensão não encontrado!
    echo 📁 Esperado: vscode-extension\aprende-lang-1.1.2.vsix
    echo 💡 Certifique-se que está na pasta raiz do projeto Aprende
    exit /b 1
)

code --install-extension "vscode-extension\aprende-lang-1.1.2.vsix" --force
if %errorlevel% neq 0 (
    echo ❌ Erro ao instalar extensão VS Code
    echo 💡 Tente instalar manualmente:
    echo    1. Abra VS Code
    echo    2. Ctrl+Shift+P
    echo    3. Digite "Extensions: Install from VSIX..."
    echo    4. Selecione: vscode-extension\aprende-lang-1.1.2.vsix
) else (
    echo ✅ Extensão VS Code instalada com sucesso!
)
exit /b 0

:CONFIGURAR_ASSOCIACOES
echo 📁 Configurando associações de ficheiros...

:: Verificar se está executando como admin para registro
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Aviso: Precisa de permissões de administrador para configurar associações
    echo 💡 Execute este script como administrador para configurar completamente
    echo.
    exit /b 1
)

if not exist "scripts\registar.reg" (
    echo ❌ Ficheiro de registro não encontrado!
    echo 📁 Esperado: scripts\registar.reg
    echo 💡 Verifique se está na pasta raiz do projeto
    exit /b 1
)

echo 🔧 Aplicando configurações do registro...
regedit /s "scripts\registar.reg"
if %errorlevel% neq 0 (
    echo ❌ Erro ao aplicar configurações do registro
    echo 💡 Tente executar como Administrador
) else (
    echo ✅ Associações de ficheiros configuradas!
    echo 🔄 Atualizando ícones do sistema...
    ie4uinit.exe -show >nul 2>&1
    echo ✅ Ícones atualizados! (pode demorar alguns segundos para aparecer)
)
exit /b 0

:TESTAR_LINGUAGEM
echo 🧪 Testando o interpretador Aprende...

if not exist "aprende.py" (
    echo ❌ Interpretador não encontrado (aprende.py)!
    echo 📁 Certifique-se que está na pasta raiz do projeto
    exit /b 1
)

if not exist "teste-simples.aprende" (
    echo ❌ Ficheiro de teste não encontrado (teste-simples.aprende)!
    echo 📁 Certifique-se que está na pasta raiz do projeto
    exit /b 1
)

echo 🚀 Executando programa de teste...
echo.
echo ==========================================
python aprende.py teste-simples.aprende
echo ==========================================
echo.

if %errorlevel% neq 0 (
    echo ❌ Erro na execução do teste
    echo 💡 Verifique se Python e o interpretador estão funcionando
) else (
    echo ✅ Teste executado com sucesso!
    echo 🎉 A Linguagem Aprende está funcionando perfeitamente!
)
exit /b 0

:ERRO_PYTHON
echo.
echo ❌ INSTALAÇÃO CANCELADA
echo Instale o Python primeiro e execute novamente este instalador.
echo.
pause
goto MENU_PRINCIPAL

:SAIR
cls
echo.
echo 👋 Obrigado por usar a Linguagem Aprende!
echo.
echo 📚 Para começar a programar:
echo   • Abra o VS Code
echo   • Crie um ficheiro .aprende
echo   • Comece a escrever código em português!
echo.
echo 🌐 Documentação: pasta 'docs\'
echo 📁 Exemplos: pasta 'examples\'
echo.
echo 🎯 Boa programação! 🚀
echo.
pause
exit /b 0