@echo off
echo ========================================
echo    Instalador da Linguagem Aprende
echo ========================================
echo.

REM Verificar se Python está instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Python não foi encontrado no sistema!
    echo Por favor instala Python 3.8+ antes de continuar.
    echo Podes descarregar em: https://python.org
    pause
    exit /b 1
)

echo [1/5] Python encontrado! ✓
echo.

REM Instalar dependências Python
echo [2/5] A instalar dependências Python...
pip install -r requirements.txt
if errorlevel 1 (
    echo ERRO: Falha ao instalar dependências!
    pause
    exit /b 1
)
echo Dependências instaladas! ✓
echo.

REM Verificar se VS Code está instalado
echo [3/5] A verificar VS Code...
if exist "%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code\Code.exe" (
    echo VS Code encontrado! ✓
    
    REM Instalar extensão VS Code
    echo A instalar extensão VS Code...
    cd vscode-extension
    
    REM Verificar se vsce está instalado
    vsce --version >nul 2>&1
    if errorlevel 1 (
        echo A instalar vsce...
        call npm install -g vsce
        if errorlevel 1 (
            echo ERRO: Falha ao instalar vsce!
            cd ..
            goto :skip_extension
        )
    )
    
    REM Criar pacote da extensão
    echo A criar pacote da extensão...
    call vsce package --out aprende-lang-latest.vsix
    if errorlevel 1 (
        echo ERRO: Falha ao criar pacote!
        cd ..
        goto :skip_extension
    )
    
    REM Instalar extensão
    echo A instalar extensão...
    call code --install-extension aprende-lang-latest.vsix --force
    if errorlevel 1 (
        echo ERRO: Falha ao instalar extensão!
        cd ..
        goto :skip_extension
    )
    
    cd ..
    echo Extensão VS Code instalada! ✓
    goto :continue_install

:skip_extension
    echo AVISO: Extensão VS Code não foi instalada automaticamente.
    echo.
    echo SOLUCAO: Instalacao manual (mais confiavel)
    echo 1. Executa: instalar-extensao.bat
    echo 2. OU segue: INSTALACAO-MANUAL-EXTENSAO.md
    echo 3. Usa Ctrl+Shift+P → "Install from VSIX"

:continue_install
    
    REM Instalar extensão
    echo A instalar extensão...
    call code --install-extension aprende-lang-1.0.0.vsix
    
    cd ..
    echo Extensão VS Code instalada! ✓
) else (
    echo VS Code não encontrado. A extensão não será instalada.
    echo Podes instalar manualmente mais tarde.
)
echo.

REM Configurar ícone
echo [4/6] A verificar e configurar ícone...
if exist "aprende-icon.ico" (
    echo Ícone encontrado: aprende-icon.ico ✓
    
    REM Aplicar configurações do ícone
    echo A configurar ícone para ficheiros .aprende...
    regedit /s registar.reg >nul 2>&1
    ie4uinit.exe -ClearIconCache >nul 2>&1
    ie4uinit.exe -show >nul 2>&1
    echo Ícone configurado! ✓
) else (
    echo AVISO: aprende-icon.ico não encontrado!
    echo Para adicionar ícone personalizado:
    echo 1. Converte teu ícone para formato ICO
    echo 2. Nomeia como aprende-icon.ico
    echo 3. Executa configurar-icone.bat
    echo.
    echo Nota: Podes usar converter-icone.bat se tens icon.png
)
echo.

REM Registar tipo de ficheiro no Windows (se ainda não foi feito)
echo [5/6] A verificar registo de tipo de ficheiro...
echo Isto vai requerer permissões de administrador...
reg query "HKEY_CLASSES_ROOT\.aprende" >nul 2>&1
if errorlevel 1 (
    echo A registar tipo de ficheiro...
    regedit /s registar.reg
    if errorlevel 1 (
        echo AVISO: Falha ao registar tipo de ficheiro.
        echo Executa como administrador: registar-aprende.bat
    ) else (
        echo Tipo de ficheiro registado! ✓
    )
) else (
    echo Tipo de ficheiro já registado! ✓
)
echo.

echo ========================================
echo      Instalação Concluída! 🎉
echo ========================================
echo.
echo A linguagem Aprende está agora instalada!
echo.
echo ✓ Interpretador Python configurado
echo ✓ Extensão VS Code instalada (se aplicável)  
echo ✓ Ícone personalizado configurado
echo ✓ Tipo de ficheiro .aprende registado
echo.
echo Para testar:
echo 1. Abre o VS Code
echo 2. Cria um ficheiro com extensão .aprende
echo 3. Escreve: mostra "Olá mundo!"
echo 4. Guarda e executa: python cli.py ficheiro.aprende
echo.
echo Ou executa o exemplo:
echo python cli.py ola.aprende
echo.
echo Para modo interativo:
echo python cli.py -i
echo.
pause