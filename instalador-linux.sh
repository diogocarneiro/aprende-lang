#!/bin/bash

# ====================================================================
#  INSTALADOR DA LINGUAGEM APRENDE - LINUX
#  Uma linguagem de programação em português para crianças
# ====================================================================

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Função para imprimir header
print_header() {
    clear
    echo -e "${BLUE}"
    echo "██████╗ ███████╗███╗   ███╗     ██╗   ██╗██╗███╗   ██╗██████╗  ██████╗"
    echo "██╔══██╗██╔════╝████╗ ████║     ██║   ██║██║████╗  ██║██╔══██╗██╔═══██╗"
    echo "██████╔╝█████╗  ██╔████╔██║     ██║   ██║██║██╔██╗ ██║██║  ██║██║   ██║"
    echo "██╔══██╗██╔══╝  ██║╚██╔╝██║     ╚██╗ ██╔╝██║██║╚██╗██║██║  ██║██║   ██║"
    echo "██████╔╝███████╗██║ ╚═╝ ██║      ╚████╔╝ ██║██║ ╚████║██████╔╝╚██████╔╝"
    echo "╚═════╝ ╚══════╝╚═╝     ╚═╝       ╚═══╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝"
    echo -e "${NC}"
    echo ""
    echo -e "${CYAN}            🎯 LINGUAGEM APRENDE - INSTALADOR LINUX 🎯${NC}"
    echo -e "${WHITE}            📚 Programação em português para crianças e iniciantes${NC}"
    echo ""
    echo -e "${YELLOW}            👨 Autor:    Diogo Carneiro${NC}"
    echo -e "${YELLOW}            📧 Email:    diogocarneiro@gmail.com${NC}"
    echo -e "${YELLOW}            🐱 GitHub:   https://github.com/diogocarneiro${NC}"
    echo ""
    echo -e "${GREEN}            📦 Projeto:  Aprende-lang${NC}"
    echo -e "${GREEN}            📅 Versão:   1.1.1${NC}"
    echo -e "${GREEN}            🐍           Python 3.8+ || 📦VS Code Extension${NC}"
    echo ""
    echo "===================================================================="
    echo ""
}

# Função para verificar se comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Função para verificar Python
verificar_python() {
    echo -e "${BLUE}🔍 Verificando Python...${NC}"
    
    if command_exists python3; then
        PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
        echo -e "${GREEN}✅ Python encontrado: $PYTHON_VERSION${NC}"
        
        # Verificar se é versão 3.8+
        PYTHON_MAJOR=$(echo $PYTHON_VERSION | cut -d'.' -f1)
        PYTHON_MINOR=$(echo $PYTHON_VERSION | cut -d'.' -f2)
        
        if [ "$PYTHON_MAJOR" -ge 3 ] && [ "$PYTHON_MINOR" -ge 8 ]; then
            echo -e "${GREEN}✅ Versão do Python é compatível (3.8+)${NC}"
            return 0
        else
            echo -e "${RED}❌ Python 3.8+ necessário. Versão atual: $PYTHON_VERSION${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ Python não encontrado!${NC}"
        echo -e "${YELLOW}📥 Para instalar Python no Ubuntu/Debian:${NC}"
        echo "   sudo apt update && sudo apt install python3 python3-pip"
        echo -e "${YELLOW}📥 Para instalar Python no Fedora/CentOS:${NC}"
        echo "   sudo dnf install python3 python3-pip"
        echo -e "${YELLOW}📥 Para instalar Python no Arch:${NC}"
        echo "   sudo pacman -S python python-pip"
        return 1
    fi
}

# Função para verificar VS Code
verificar_vscode() {
    echo -e "${BLUE}🔍 Verificando VS Code...${NC}"
    
    if command_exists code; then
        echo -e "${GREEN}✅ VS Code encontrado${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠️  VS Code não encontrado${NC}"
        echo -e "${CYAN}📥 Para instalar VS Code:${NC}"
        echo "   - Baixe de: https://code.visualstudio.com/"
        echo "   - Ou use snap: sudo snap install code --classic"
        return 1
    fi
}

# Função para instalar extensão VS Code
instalar_extensao_vscode() {
    echo -e "${BLUE}🎨 Instalando extensão VS Code...${NC}"
    
    if ! command_exists code; then
        echo -e "${RED}❌ VS Code não encontrado! Instale primeiro.${NC}"
        return 1
    fi
    
    # Verificar se extensão existe
    if [ -f "vscode-extension/aprende-lang-1.1.2.vsix" ]; then
        echo -e "${CYAN}📦 Instalando extensão...${NC}"
        code --install-extension vscode-extension/aprende-lang-1.1.2.vsix
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Extensão instalada com sucesso!${NC}"
        else
            echo -e "${RED}❌ Erro ao instalar extensão${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ Arquivo da extensão não encontrado!${NC}"
        echo "   Procurado: vscode-extension/aprende-lang-1.1.2.vsix"
        return 1
    fi
}

# Função para configurar associações de ficheiros
configurar_associacoes() {
    echo -e "${BLUE}📁 Configurando associações de ficheiros...${NC}"
    
    # Criar diretório para aplicações locais
    mkdir -p ~/.local/share/applications
    mkdir -p ~/.local/share/mime/packages
    
    # Criar arquivo MIME type
    cat > ~/.local/share/mime/packages/aprende.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-aprende">
        <comment>Ficheiro Aprende</comment>
        <comment xml:lang="pt">Ficheiro da Linguagem Aprende</comment>
        <glob pattern="*.aprende"/>
        <icon name="text-x-script"/>
    </mime-type>
</mime-info>
EOF
    
    # Criar arquivo .desktop
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cat > ~/.local/share/applications/aprende.desktop << EOF
[Desktop Entry]
Type=Application
Name=Linguagem Aprende
Comment=Executar ficheiros da Linguagem Aprende
Exec=python3 "$SCRIPT_DIR/aprende.py" %f
Icon=text-x-script
MimeType=application/x-aprende;
Categories=Development;Education;
NoDisplay=true
EOF
    
    # Atualizar base de dados MIME
    if command_exists update-mime-database; then
        update-mime-database ~/.local/share/mime
    fi
    
    if command_exists update-desktop-database; then
        update-desktop-database ~/.local/share/applications
    fi
    
    echo -e "${GREEN}✅ Associações configuradas${NC}"
    echo -e "${CYAN}ℹ️  Ficheiros .aprende agora abrem com a Linguagem Aprende${NC}"
}

# Função para testar instalação
testar_instalacao() {
    echo -e "${BLUE}🧪 Testando instalação...${NC}"
    
    # Testar se o interpretador funciona
    if [ -f "teste-simples.aprende" ]; then
        echo -e "${CYAN}🔄 Executando teste simples...${NC}"
        python3 aprende.py teste-simples.aprende
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Teste executado com sucesso!${NC}"
        else
            echo -e "${RED}❌ Erro no teste${NC}"
            return 1
        fi
    else
        echo -e "${YELLOW}⚠️  Arquivo de teste não encontrado${NC}"
    fi
    
    # Testar modo interativo
    echo -e "${CYAN}ℹ️  Para testar modo interativo: python3 aprende.py -i${NC}"
}

# Função para mostrar menu principal
mostrar_menu() {
    print_header
    echo -e "${WHITE}🔧 INSTALADOR DA LINGUAGEM APRENDE${NC}"
    echo ""
    echo "Escolha uma opção:"
    echo ""
    echo -e "${GREEN}  [1] 🚀 Instalação Completa (Recomendado)${NC}"
    echo -e "${BLUE}  [2] 🔍 Verificar Sistema${NC}"
    echo -e "${PURPLE}  [3] 🎨 Instalar apenas VS Code Extension${NC}"
    echo -e "${CYAN}  [4] 📁 Configurar Associações de Ficheiros${NC}"
    echo -e "${YELLOW}  [5] 🧪 Testar Instalação${NC}"
    echo -e "${WHITE}  [6] 📖 Mostrar Documentação${NC}"
    echo -e "${RED}  [7] ❌ Sair${NC}"
    echo ""
}

# Função de instalação completa
instalacao_completa() {
    print_header
    echo -e "${GREEN}🚀 INSTALAÇÃO COMPLETA DA LINGUAGEM APRENDE${NC}"
    echo "=========================================="
    echo ""
    echo "Esta instalação vai configurar:"
    echo -e "${GREEN}  ✅ Verificar e instalar Python${NC}"
    echo -e "${GREEN}  ✅ Instalar extensão do VS Code${NC}"
    echo -e "${GREEN}  ✅ Configurar associações de ficheiros .aprende${NC}"
    echo -e "${GREEN}  ✅ Testar a instalação${NC}"
    echo ""
    read -p "Deseja continuar? (S/n): " confirm
    if [[ $confirm =~ ^[Nn]$ ]]; then
        return
    fi
    
    echo ""
    echo -e "${BLUE}📋 Iniciando instalação...${NC}"
    echo ""
    
    # Verificar Python
    if ! verificar_python; then
        echo -e "${RED}❌ Erro: Python 3.8+ necessário para continuar${NC}"
        read -p "Pressione Enter para continuar..."
        return
    fi
    
    # Instalar extensão VS Code
    instalar_extensao_vscode
    
    # Configurar associações
    configurar_associacoes
    
    # Testar
    testar_instalacao
    
    echo ""
    echo -e "${GREEN}🎉 INSTALAÇÃO COMPLETA COM SUCESSO! 🎉${NC}"
    echo ""
    echo -e "${CYAN}📚 Para começar a programar:${NC}"
    echo -e "${WHITE}  1. Abra VS Code${NC}"
    echo -e "${WHITE}  2. Crie um ficheiro .aprende${NC}"
    echo -e "${WHITE}  3. Digite: mostra \"Olá mundo!\"${NC}"
    echo -e "${WHITE}  4. Execute: python3 aprende.py meu_programa.aprende${NC}"
    echo ""
    read -p "Pressione Enter para continuar..."
}

# Menu principal
main() {
    while true; do
        mostrar_menu
        read -p "Digite sua escolha (1-7): " choice
        
        case $choice in
            1)
                instalacao_completa
                ;;
            2)
                print_header
                echo -e "${BLUE}🔍 VERIFICANDO SISTEMA${NC}"
                echo "====================="
                echo ""
                verificar_python
                echo ""
                verificar_vscode
                echo ""
                echo -e "${CYAN}📊 Verificação concluída!${NC}"
                read -p "Pressione Enter para continuar..."
                ;;
            3)
                print_header
                echo -e "${PURPLE}🎨 INSTALANDO EXTENSÃO VS CODE${NC}"
                echo "=============================="
                echo ""
                instalar_extensao_vscode
                read -p "Pressione Enter para continuar..."
                ;;
            4)
                print_header
                echo -e "${CYAN}📁 CONFIGURANDO ASSOCIAÇÕES DE FICHEIROS${NC}"
                echo "========================================"
                echo ""
                configurar_associacoes
                read -p "Pressione Enter para continuar..."
                ;;
            5)
                print_header
                echo -e "${YELLOW}🧪 TESTANDO INSTALAÇÃO${NC}"
                echo "===================="
                echo ""
                testar_instalacao
                read -p "Pressione Enter para continuar..."
                ;;
            6)
                print_header
                echo -e "${WHITE}📖 DOCUMENTAÇÃO DA LINGUAGEM APRENDE${NC}"
                echo "===================================="
                echo ""
                echo -e "${CYAN}🎯 A Linguagem Aprende é uma linguagem de programação criada${NC}"
                echo -e "${CYAN}   especialmente para crianças e iniciantes portugueses.${NC}"
                echo ""
                echo -e "${WHITE}📝 COMANDOS BÁSICOS:${NC}"
                echo -e "${GREEN}   mostra \"texto\"           - Exibe texto na tela${NC}"
                echo -e "${GREEN}   definir nome valor       - Cria uma variável${NC}"
                echo -e "${GREEN}   calcular expressão       - Faz cálculos matemáticos${NC}"
                echo -e "${GREEN}   ler \"mensagem\"           - Lê entrada do utilizador${NC}"
                echo ""
                echo -e "${WHITE}🔄 ESTRUTURAS DE CONTROLO:${NC}"
                echo -e "${BLUE}   se ... entao ... senao   - Condições${NC}"
                echo -e "${BLUE}   para i de 1 ate 10       - Loop for${NC}"
                echo -e "${BLUE}   enquanto condicao        - Loop while${NC}"
                echo ""
                echo -e "${PURPLE}🔢 OPERADORES (duas formas):${NC}"
                echo -e "${YELLOW}   mais / +     menos / -     vezes / *     dividido / /${NC}"
                echo ""
                echo -e "${WHITE}📁 EXEMPLOS:${NC}"
                echo -e "${CYAN}   examples/ola.aprende              - Primeiro programa${NC}"
                echo -e "${CYAN}   examples/demo-final.aprende       - Funcionalidades completas${NC}"
                echo -e "${CYAN}   examples/jogo-adivinhacao.aprende - Jogo interativo${NC}"
                echo ""
                read -p "Pressione Enter para continuar..."
                ;;
            7)
                echo -e "${GREEN}Obrigado por usar a Linguagem Aprende! 🎉${NC}"
                echo -e "${CYAN}Visite: https://github.com/diogocarneiro/aprende-lang${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}❌ Opção inválida! Tente novamente.${NC}"
                sleep 2
                ;;
        esac
    done
}

# Verificar se está no diretório correto
if [ ! -f "aprende.py" ]; then
    echo -e "${RED}❌ Erro: Execute este script no diretório da Linguagem Aprende${NC}"
    echo -e "${CYAN}ℹ️  Certifique-se que o arquivo aprende.py está presente${NC}"
    exit 1
fi

# Iniciar instalador
main