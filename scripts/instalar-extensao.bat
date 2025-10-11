@echo off
echo ========================================
echo  Instalador Extensao VS Code - Aprende
echo ========================================
echo.

REM Verificar se Node.js está instalado
node --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Node.js nao encontrado!
    echo.
    echo Para instalar a extensao precisas de Node.js:
    echo 1. Vai a https://nodejs.org
    echo 2. Descarrega e instala a versao LTS
    echo 3. Reinicia o terminal
    echo 4. Executa este script novamente
    echo.
    pause
    exit /b 1
)

echo [1/4] Node.js encontrado! ✓

REM Verificar se vsce está instalado
vsce --version >nul 2>&1
if errorlevel 1 (
    echo [2/4] A instalar vsce...
    npm install -g vsce
    if errorlevel 1 (
        echo ERRO: Falha ao instalar vsce!
        pause
        exit /b 1
    )
) else (
    echo [2/4] vsce já instalado! ✓
)

REM Verificar se VS Code está instalado
code --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: VS Code nao encontrado!
    echo.
    echo Para instalar a extensao precisas do VS Code:
    echo 1. Vai a https://code.visualstudio.com
    echo 2. Descarrega e instala
    echo 3. Executa este script novamente
    echo.
    pause
    exit /b 1
)

echo [3/4] VS Code encontrado! ✓

REM Criar e instalar a extensão
echo [4/4] A criar e instalar extensao...
cd vscode-extension

echo A criar pacote da extensao...
vsce package --out aprende-lang-latest.vsix
if errorlevel 1 (
    echo ERRO: Falha ao criar pacote da extensao!
    echo.
    echo SOLUCAO MANUAL:
    echo 1. Abre VS Code
    echo 2. Pressiona Ctrl+Shift+P
    echo 3. Escreve "Extensions: Install from VSIX"
    echo 4. Seleciona o ficheiro aprende-lang-latest.vsix
    echo.
    cd ..
    pause
    exit /b 1
)

echo A instalar extensao no VS Code...
code --install-extension aprende-lang-latest.vsix --force
if errorlevel 1 (
    echo AVISO: Instalacao automatica falhou!
    echo.
    echo INSTALAR MANUALMENTE:
    echo 1. Abre VS Code
    echo 2. Pressiona Ctrl+Shift+P  
    echo 3. Escreve "Extensions: Install from VSIX"
    echo 4. Seleciona o ficheiro: aprende-lang-latest.vsix
    echo 5. Reinicia VS Code
    echo.
    echo O ficheiro aprende-lang-latest.vsix foi criado na pasta vscode-extension
    cd ..
    pause
    exit /b 0
)

cd ..

echo.
echo ========================================
echo    Extensao Instalada com Sucesso! 🎉
echo ========================================
echo.
echo A extensao da linguagem Aprende foi instalada no VS Code!
echo.
echo Funcionalidades incluidas:
echo ✓ Realce de sintaxe colorido
echo ✓ Snippets de codigo
echo ✓ Tema "Aprende Kids Theme"
echo ✓ Icones personalizados para ficheiros .aprende
echo ✓ Configuracao automatica de indentacao
echo.
echo Para testar:
echo 1. Abre o VS Code
echo 2. Cria um novo ficheiro com extensao .aprende
echo 3. Escreve codigo Aprende e ve o realce de sintaxe!
echo.
echo Snippets disponiveis (digite e pressiona Tab):
echo - mostra    → mostra "texto"
echo - def       → definir nome valor
echo - se        → estrutura se/entao/senao
echo - para      → loop para...de...ate
echo - calc      → calcular expressao
echo.
echo Para ativar o tema:
echo Ctrl+K Ctrl+T → "Aprende Kids Theme"
echo.
pause