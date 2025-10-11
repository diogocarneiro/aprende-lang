@echo off
echo ========================================
echo  Atualizar Extensao com Temas Escuros
echo ========================================
echo.

echo Novos temas adicionados:
echo ✓ Aprende Kids Theme (claro)
echo ✓ Aprende Dark Theme (escuro)  
echo ✓ Aprende Palenight Theme (escuro premium)
echo.

cd vscode-extension

echo [1/2] A criar novo pacote da extensao...
vsce package --out aprende-lang-with-themes.vsix
if errorlevel 1 (
    echo ERRO: Falha ao criar pacote!
    cd ..
    pause
    exit /b 1
)

echo [2/2] A instalar extensao atualizada...
code --install-extension aprende-lang-with-themes.vsix --force
if errorlevel 1 (
    echo AVISO: Instalacao automatica falhou!
    echo.
    echo INSTALAR MANUALMENTE:
    echo 1. Abre VS Code
    echo 2. Ctrl+Shift+P → "Extensions: Install from VSIX"
    echo 3. Seleciona: aprende-lang-with-themes.vsix
    cd ..
    pause
    exit /b 0
)

cd ..

echo.
echo ========================================
echo     Temas Escuros Instalados! 🌙
echo ========================================
echo.
echo Para mudar tema:
echo 1. Abre VS Code
echo 2. Pressiona Ctrl+K Ctrl+T
echo 3. Escolhe o tema:
echo    • Aprende Kids Theme (claro)
echo    • Aprende Dark Theme (escuro)
echo    • Aprende Palenight Theme (escuro premium)
echo.
echo Recomendacao: Aprende Palenight Theme
echo (inspirado no tema Palenight com contraste medio)
echo.
pause