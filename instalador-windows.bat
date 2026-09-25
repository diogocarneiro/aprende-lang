@echo off
chcp 65001 >nul
title Instalador da Linguagem Aprende 🚀

:: ====================================================================
::  INSTALADOR DA LINGUAGEM APRENDE
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
    set /p continue=Continuar mesmo assim? ^(S/n^): 
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
echo            🎯 LINGUAGEM APRENDE - INSTALADOR AUTOMÁTICO 🎯
echo            📚 Programação em português para crianças e iniciantes
echo.
echo            👨 Autor:    Diogo Carneiro
echo            📧 Email:    diogocarneiro@outlook.com
echo            🐱 GitHub:   https://github.com/diogocarneiro
echo            🐦 Twitter:  https://twitter.com/diogoncarneiro
echo.
echo            📦 Projeto:  Aprende-lang
echo            📅 Versão:   1.1.2
echo            🐍           Python 3.8+ || 📦VS Code Extension
echo.
echo            🔗 Website:  https://aprende-lang.org
echo            📥 GitHub:   https://github.com/diogocarneiro/aprende-lang
echo            📖 Docs:     https://aprende-lang.org/docs
echo            📁 Exemplos: https://aprende-lang.org/examples
echo.
echo ====================================================================
echo.
:MENU_PRINCIPAL
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
set /p choice=Digite sua escolha (1-7): 

if "%choice%"=="1" goto INSTALACAO_COMPLETA
if "%choice%"=="2" goto VERIFICAR_SISTEMA
if "%choice%"=="3" goto INSTALAR_VSCODE
if "%choice%"=="4" goto ASSOCIAR_FICHEIROS
if "%choice%"=="5" goto TESTAR_INSTALACAO
if "%choice%"=="6" goto MOSTRAR_DOCS
if "%choice%"=="7" goto SAIR
echo ❌ Opção inválida! Tente novamente.
pause
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
echo   ✅ Adicionar ícones personalizados
echo   ✅ Testar a instalação
echo.
set /p confirm=Deseja continuar? (S/n): 
if /i "%confirm%"=="n" goto MENU_PRINCIPAL

echo.
echo 📋 Iniciando instalação...
echo.

:: Verificar Python
call :VERIFICAR_PYTHON
if errorlevel 1 goto ERRO_PYTHON

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
echo Verificando Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python não encontrado
    echo 📥 É necessário instalar Python 3.8 ou superior
    echo 🌐 Baixe em: https://python.org/downloads
) else (
    echo ✅ Python encontrado e funcionando!
)

echo.

:: Verificar VS Code
echo Verificando VS Code...
code --version >nul 2>&1
if errorlevel 1 (
    echo ❌ VS Code não encontrado
    echo 📥 É necessário instalar Visual Studio Code
    echo 🌐 Baixe em: https://code.visualstudio.com
) else (
    echo ✅ VS Code encontrado e funcionando!
)

echo.

:: Verificar extensão Aprende
echo Verificando extensão Aprende...
code --list-extensions 2>nul | findstr "diogocarneiro.aprende-lang" >nul 2>&1
if errorlevel 1 (
    echo ❌ Extensão Aprende não instalada
    echo 💡 Use a opção 3 do menu para instalar
) else (
    echo ✅ Extensão Aprende instalada e funcionando!
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
echo    funcao nome()...         - Funções personalizadas
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

if errorlevel 1 (
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
    echo ✅ Python encontrado e funcionando!
)
exit /b 0


:INSTALAR_EXTENSAO_VSCODE
echo 🎨 Instalando extensão VS Code...
if not exist "vscode-extension\aprende-lang-1.1.2.vsix" (
    echo ❌ Ficheiro da extensão não encontrado!
    echo 📁 Certifique-se que está na pasta raiz do projeto Aprende
    exit /b 1
)

code --install-extension "vscode-extension\aprende-lang-1.1.2.vsix" --force >nul 2>&1
if errorlevel 1 (
    echo ❌ Erro ao instalar extensão VS Code
    echo 💡 Certifique-se que o VS Code está instalado
) else (
    echo ✅ Extensão VS Code instalada com sucesso!
)
exit /b 0

:CONFIGURAR_ASSOCIACOES
echo 📁 Configurando associações de ficheiros...
if not exist "scripts\registar.reg" (
    echo ❌ Ficheiro de registro não encontrado!
    echo 📁 Verifique se está na pasta raiz do projeto
    exit /b 1
)

echo 🔧 Aplicando configurações do registro...
regedit /s "scripts\registar.reg" >nul 2>&1
if errorlevel 1 (
    echo ❌ Erro ao aplicar configurações
    echo 💡 Execute como Administrador para configurar associações
    echo 💡 Ou configure manualmente: clique direito > "Executar como admin"
) else (
    echo ✅ Associações de ficheiros configuradas!
    echo 🔄 Atualizando ícones do sistema...
    ie4uinit.exe -show >nul 2>&1
    echo ✅ Ícones atualizados!
)
exit /b 0

:TESTAR_LINGUAGEM
echo 🧪 Testando a linguagem Aprende...
if not exist "teste-simples.aprende" (
    echo ❌ Ficheiro de teste não encontrado!
    exit /b 1
)

echo 🚀 Executando programa de teste...
echo.
python aprende.py teste-simples.aprende
echo.
if errorlevel 1 (
    echo ❌ Erro na execução do teste
) else (
    echo ✅ Teste executado com sucesso!
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