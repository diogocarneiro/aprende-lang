# INSTALADORES MULTIPLATAFORMA - LINGUAGEM APRENDE

## 📦 Scripts de Instalação Disponíveis

A Linguagem Aprende oferece instalação automática em **todas as plataformas principais** com interfaces nativas e funcionamento otimizado para cada sistema operativo.

### 🪟 Windows
```batch
# Instalador original (recomendado)
INSTALADOR.bat

# Instalador alternativo
instalador-windows.bat
```

**Funcionalidades Windows:**
- **Interface gráfica colorida** em português
- **Verificação automática** de Python 3.8+
- **Instalação VS Code Extension** (aprende-lang-1.1.2.vsix)
- **Configuração de associações** de ficheiros .aprende
- **Registo no Windows Registry** para duplo-clique
- **Ícones personalizados** para ficheiros .aprende
- **Testes automáticos** completos

**Como usar:**
1. Duplo clique no `INSTALADOR.bat`
2. Escolha opção 1 - "Instalação Completa"
3. Siga as instruções na tela (modo administrador recomendado)

### 🐧 Linux
```bash
chmod +x instalador-linux.sh
./instalador-linux.sh
```

**Funcionalidades Linux:**
- **Menu interativo colorido** com ASCII art
- **Detecção automática** da distribuição Linux
- **Suporte nativo** para Ubuntu, Fedora, Arch, Debian
- **Configuração MIME types** para ficheiros .aprende
- **Desktop integration** completa com ícones
- **Instalação VS Code Extension** automática
- **Verificação de dependências** por distribuição

**Distribuições testadas:**
- **Ubuntu/Debian**: `apt install python3 python3-pip`
- **Fedora/CentOS/RHEL**: `dnf install python3 python3-pip`
- **Arch Linux**: `pacman -S python python-pip`
- **openSUSE**: `zypper install python3 python3-pip`

**Pré-requisitos Linux:**
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install python3 python3-pip git

# Fedora
sudo dnf install python3 python3-pip git

# Arch
sudo pacman -S python python-pip git
```

### 🍎 macOS
```bash
chmod +x instalador-macos.sh
./instalador-macos.sh
```

**Funcionalidades macOS:**
- **Menu interativo** nativo com cores
- **Integração completa com Homebrew** (opcional)
- **Criação de App Bundle** para associações de ficheiros
- **Suporte Python** do sistema ou Homebrew
- **LaunchServices registration** para .aprende files
- **VS Code Extension** instalação automática
- **Dock e Finder integration**

**Opções de Python macOS:**
```bash
# Opção 1: Python do sistema (macOS 12.3+)
python3 --version

# Opção 2: Homebrew (recomendado)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install python

# Opção 3: Download oficial
# https://www.python.org/downloads/macos/
```

**VS Code macOS:**
```bash
# Via Homebrew (recomendado)
brew install --cask visual-studio-code

# Via download direto
# https://code.visualstudio.com/Download
```

## 🚀 Funcionalidades Comuns

Todos os instaladores oferecem o mesmo conjunto completo de funcionalidades:

### ✅ Instalação Completa Automática
- **Verificação Python 3.8+** com sugestões de instalação
- **Instalação VS Code Extension** (aprende-lang-1.1.2.vsix)
- **Configuração de associações** de ficheiros .aprende
- **Ícones personalizados** (onde suportado pelo SO)
- **Testes automáticos** de funcionamento completo

### 🔍 Verificação Inteligente do Sistema
- **Status detalhado** do Python (versão, localização)
- **Status do VS Code** (instalado, no PATH, versão)
- **Verificação de dependências** específicas do SO
- **Diagnóstico de problemas** com sugestões de correção

### 🎨 Extensão VS Code Completa
- **Syntax highlighting** para palavras-chave portuguesas
- **3 temas coloridos**: Kids (crianças), Dark (escuro), Palenight
- **Snippets inteligentes** (`mostra` + Tab, `se` + Tab, etc.)
- **IntelliSense** para comandos da linguagem
- **Ícones .aprende** nos exploradores de ficheiros

### 📁 Integração do Sistema Operativo
- **Associações de ficheiros**: Duplo-clique executa automaticamente
- **Context menu** (botão direito) para executar ficheiros
- **Ícones nativos** para ficheiros .aprende
- **Terminal integration** para execução direta

### 🧪 Testes e Validação
- **Execução de `teste-simples.aprende`** (sem entrada do usuário)
- **Verificação do modo interativo** (`python aprende.py -i`)
- **Teste de syntax highlighting** no VS Code
- **Validação de associações** de ficheiros

## 📋 Requisitos Mínimos do Sistema

### 🔧 Todos os Sistemas Operativos
- **Python 3.8+** (obrigatório) - Python 3.11+ recomendado
- **VS Code** (recomendado) - Pode funcionar sem, mas perde funcionalidades
- **Git** (opcional) - Para clonar e atualizar o repositório
- **Internet** (durante instalação) - Para download de dependências

### 🐧 Linux Específico
- **Desktop Environment** (GNOME, KDE, XFCE, LXQt, etc.)
- **update-mime-database** (incluído na maioria das distribuições)
- **xdg-mime** (para associações de ficheiros)
- **curl/wget** (para downloads automáticos)

### 🍎 macOS Específico
- **macOS 10.14+** (Mojave ou superior)
- **Xcode Command Line Tools** (opcional, para desenvolvimento)
- **Homebrew** (opcional, mas recomendado)
- **Terminal** com permissões adequadas

### 🪟 Windows Específico
- **Windows 10+** (Windows 11 recomendado)
- **PowerShell 5.1+** ou **Command Prompt**
- **Permissões de administrador** (para registo e associações)
- **VS Code** no PATH (automático com instalação padrão)

## 🔧 Resolução de Problemas Comuns

### ❌ "Python não encontrado"
```bash
# 🐧 Linux
# Ubuntu/Debian
sudo apt update && sudo apt install python3 python3-pip python3-venv

# Fedora/CentOS/RHEL
sudo dnf install python3 python3-pip

# Arch Linux
sudo pacman -S python python-pip

# 🍎 macOS
# Homebrew (recomendado)
brew install python

# Download oficial
# https://www.python.org/downloads/macos/

# 🪟 Windows
# Download oficial: https://www.python.org/downloads/windows/
# Certifique-se de marcar "Add Python to PATH" durante instalação
```

### ❌ "VS Code não encontrado"
```bash
# 🐧 Linux
# Snap (Ubuntu/Fedora/etc.)
sudo snap install code --classic

# Flatpak
flatpak install flathub com.visualstudio.code

# Debian/Ubuntu (repositório oficial)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && sudo apt install code

# 🍎 macOS
# Homebrew
brew install --cask visual-studio-code

# Download direto
# https://code.visualstudio.com/Download

# 🪟 Windows
# Download: https://code.visualstudio.com/Download
# Ou via winget: winget install Microsoft.VisualStudioCode
```

### ❌ "Extensão não instala"
**Diagnóstico:**
1. Verificar se VS Code está no PATH: `code --version`
2. Verificar localização do ficheiro: `vscode-extension/aprende-lang-1.1.2.vsix`
3. Instalar manualmente: `code --install-extension vscode-extension/aprende-lang-1.1.2.vsix`

**Soluções alternativas:**
```bash
# Instalação manual pela interface
# 1. Abrir VS Code
# 2. Ctrl+Shift+P (Cmd+Shift+P no Mac)
# 3. "Extensions: Install from VSIX..."
# 4. Selecionar aprende-lang-1.1.2.vsix
```

### ❌ "Associações de ficheiros não funcionam"
```bash
# 🐧 Linux
# Recarregar base de dados MIME
update-mime-database ~/.local/share/mime
xdg-mime default aprende.desktop application/x-aprende

# 🍎 macOS
# Recarregar LaunchServices
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# 🪟 Windows
# Execute o instalador como Administrador
# Ou execute manualmente: scripts/registar-aprende.bat
```

### ❌ "Permissões negadas"
```bash
# 🐧 Linux
chmod +x instalador-linux.sh
# Se persistir: sudo ./instalador-linux.sh

# 🍎 macOS
chmod +x instalador-macos.sh
# Se bloquear por segurança: System Preferences > Security & Privacy > Allow

# 🪟 Windows
# Clique direito no INSTALADOR.bat > "Executar como administrador"
```

## 📖 Guia Pós-Instalação

### 🎯 Primeiro Uso
Após instalação bem-sucedida, teste imediatamente:

1. **Abrir VS Code e criar ficheiro de teste:**
   ```bash
   code meu_primeiro_programa.aprende
   ```

2. **Digite o código de exemplo:**
   ```aprende
   // Meu primeiro programa em Aprende!
   mostra "🎉 Olá mundo!"
   definir nome "João"
   definir idade 10
   
   mostra "Olá " nome "!"
   mostra "Tens " idade " anos."
   
   se idade maior 5 entao
       mostra "És uma criança inteligente!"
   senao
       mostra "Continua a aprender!"
   ```

3. **Executar o programa:**
   ```bash
   # Método 1: Terminal
   python aprende.py meu_primeiro_programa.aprende
   
   # Método 2: Duplo clique no ficheiro (se associações funcionarem)
   
   # Método 3: VS Code (Ctrl+F5 ou F5)
   ```

4. **Testar modo interativo:**
   ```bash
   python aprende.py -i
   # Digite: mostra "Teste interativo!"
   # Digite: sair
   ```

### 🎨 Personalizar VS Code
1. **Escolher tema Aprende:**
   - `Ctrl+Shift+P` (Cmd+Shift+P no Mac)
   - "Preferences: Color Theme"
   - Escolher: "Aprende Kids", "Aprende Dark", ou "Aprende Palenight"

2. **Testar snippets:**
   - Digite `mostra` e pressione `Tab`
   - Digite `se` e pressione `Tab`
   - Digite `para` e pressione `Tab`

3. **Verificar syntax highlighting:**
   - Palavras como `mostra`, `definir`, `se` devem aparecer coloridas
   - Strings devem aparecer numa cor diferente
   - Comentários (`//`) devem aparecer em itálico

### 📚 Recursos de Aprendizagem
```bash
# Executar exemplos incluídos
python aprende.py examples/ola.aprende
python aprende.py examples/demo-final.aprende
python aprende.py examples/jogo-adivinhacao.aprende

# Ver sintaxe completa
python aprende.py sintaxe.aprende

# Teste simples de validação
python aprende.py teste-simples.aprende
```

### 🔄 Atualizações Futuras
Para atualizar a linguagem Aprende:

```bash
# 1. Fazer backup dos seus programas
cp *.aprende ~/backup/

# 2. Baixar nova versão
git pull origin main

# 3. Reinstalar (se necessário)
./instalador-linux.sh    # Linux
./instalador-macos.sh    # macOS
INSTALADOR.bat           # Windows
```

## 🎯 Links e Recursos Úteis

### 📂 Documentação Completa
- **📋 Sintaxe da Linguagem**: [`docs/sintaxe-aprende.md`](docs/sintaxe-aprende.md)
- **📖 Guia de Instalação**: [`docs/INSTALACAO.md`](docs/INSTALACAO.md)
- **🎨 Guia da Extensão**: [`docs/GUIA-EXTENSAO.md`](docs/GUIA-EXTENSAO.md)
- **⚙️ Instalação Manual**: [`docs/INSTALACAO-MANUAL-EXTENSAO.md`](docs/INSTALACAO-MANUAL-EXTENSAO.md)

### 💻 Exemplos e Testes
- **🎯 Sintaxe Completa**: [`sintaxe.aprende`](sintaxe.aprende)
- **🧪 Teste Simples**: [`teste-simples.aprende`](teste-simples.aprende)
- **📁 Pasta de Exemplos**: [`examples/`](examples/)
  - `ola.aprende` - Primeiro programa
  - `demo-final.aprende` - Operadores duplos
  - `jogo-adivinhacao.aprende` - Jogo interativo
  - `tabuada.aprende` - Loops e cálculos

### 🌐 Online
- **🐱 Repositório GitHub**: https://github.com/diogocarneiro/aprende-lang
- **📦 Releases**: https://github.com/diogocarneiro/aprende-lang/releases
- **🐛 Issues/Bugs**: https://github.com/diogocarneiro/aprende-lang/issues
- **💡 Discussões**: https://github.com/diogocarneiro/aprende-lang/discussions

### 👨‍💻 Autor e Contacto
- **👨 Autor**: Diogo Carneiro
- **📧 Email**: diogocarneiro@gmail.com
- **🐱 GitHub**: https://github.com/diogocarneiro
- **🐦 Twitter**: https://twitter.com/diogocarneiro

---

## 🎉 Instalação Completa!

**� Bem-vindo à Linguagem Aprende!**

*Uma linguagem de programação em português criada especialmente para crianças e iniciantes aprenderem programação de forma intuitiva e divertida.*

**🚀 Próximos passos:**
1. ✅ Criar o teu primeiro programa
2. 🎨 Personalizar VS Code com temas Aprende  
3. 📚 Explorar os exemplos incluídos
4. 🎮 Criar os teus próprios jogos e programas

**💡 Lembra-te:** 
- Usa `python aprende.py -i` para modo interativo
- Explora `examples/` para inspiração
- Consulta `sintaxe.aprende` para referência completa

**🎯 Happy coding in português! 🇵🇹**