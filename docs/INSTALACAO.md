# 🚀 Guia de Instalação da Linguagem Aprende

## 🎯 Instalação Automática (Recomendada)

### Passo 1: Baixar o Projeto
1. Baixe ou clone o projeto Aprende-lang
2. Extraia para uma pasta (ex: `C:\Aprende-lang\`)

### Passo 2: Executar o Instalador
1. **Clique duplo** em `INSTALADOR.bat`
2. Escolha **opção 1** - "Instalação Completa"
3. Siga as instruções na tela

### ⚡ O que o instalador faz automaticamente:
- ✅ Verifica se Python está instalado
- ✅ Instala a extensão VS Code
- ✅ Configura ícones para ficheiros .aprende
- ✅ Associa ficheiros .aprende ao programa
- ✅ Testa se tudo funciona

---

## 🔧 Instalação Manual

### Pré-requisitos
- **Python 3.8+**: [Baixar aqui](https://python.org/downloads)
- **VS Code**: [Baixar aqui](https://code.visualstudio.com)

### Passo a Passo Manual

#### 1. 🐍 Instalar Python
```bash
# Verificar se Python está instalado
python --version

# Se não estiver, baixe e instale em python.org
# ⚠️ IMPORTANTE: Marcar "Add Python to PATH"
```

#### 2. 🎨 Instalar Extensão VS Code
```bash
# Navegar para a pasta do projeto
cd C:\Aprende-lang

# Instalar extensão
code --install-extension vscode-extension\aprende-lang-1.1.1.vsix --force
```

#### 3. 📁 Configurar Associações de Ficheiros
```bash
# Executar como Administrador
regedit /s scripts\registar.reg

# Atualizar ícones
ie4uinit.exe -show
```

#### 4. 🧪 Testar Instalação
```bash
# Testar a linguagem
python aprende.py examples\teste-estrutura.aprende
```

---

## 🎮 Como Usar Após Instalação

### Método 1: VS Code (Recomendado)
1. Abrir VS Code
2. Criar novo ficheiro com extensão `.aprende`
3. Escrever código em português
4. Executar com `Ctrl+F5` ou terminal

### Método 2: Terminal
```bash
# Executar um programa
python aprende.py examples\nome_do_programa.aprende

# Exemplo
python aprende.py examples\ola.aprende
```

### Método 3: Duplo Clique
- Após instalação, duplo clique em qualquer ficheiro `.aprende`
- O programa executa automaticamente

---

## 🐛 Resolução de Problemas

### ❌ "Python não encontrado"
**Solução:**
1. Instalar Python em [python.org](https://python.org/downloads)
2. ⚠️ **CRUCIAL**: Marcar "Add Python to PATH" durante instalação
3. Reiniciar o computador
4. Executar instalador novamente

### ❌ "VS Code não encontrado"
**Solução:**
1. Instalar VS Code em [code.visualstudio.com](https://code.visualstudio.com)
2. Reiniciar terminal/prompt
3. Executar instalador novamente

### ❌ "Acesso negado" nas associações
**Solução:**
1. Clique direito em `INSTALADOR.bat`
2. Escolher "Executar como administrador"
3. Executar opção 4 (Configurar Associações)

### ❌ Extensão não funciona
**Solução:**
1. Abrir VS Code
2. `Ctrl+Shift+P` → "Extensions: Install from VSIX"
3. Selecionar `vscode-extension\aprende-lang-1.1.1.vsix`

---

## 🎯 Verificar se Tudo Funciona

### ✅ Lista de Verificação:
- [ ] Python responde no terminal
- [ ] VS Code abre ficheiros .aprende com cores
- [ ] Ficheiros .aprende têm ícone personalizado
- [ ] Duplo clique executa programas .aprende
- [ ] Snippets funcionam no VS Code (digite `mostra` + Tab)

### 🧪 Teste Rápido:
1. Criar ficheiro `teste.aprende`
2. Escrever:
   ```aprende
   mostra "Olá mundo!"
   definir nome "Aprende"
   mostra "Linguagem: " nome
   ```
3. Executar: `python aprende.py teste.aprende`
4. Deve mostrar:
   ```
   Olá mundo!
   Linguagem: Aprende
   ```

---

## 📞 Suporte

### 🆘 Precisa de Ajuda?
- **📧 Email**: diogoncarneiro@outlook.com
- **📖 Documentação**: Pasta `docs\`
- **📁 Exemplos**: Pasta `examples\`

### 🎓 Aprender a Programar:
1. Começar com `examples\programa-simples.aprende`
2. Ler `docs\sintaxe-aprende.md`
3. Experimentar criar seus próprios programas

---

## 🎉 Bem-vindo à Programação em Português!

🎯 **A Linguagem Aprende** torna a programação acessível para crianças e iniciantes portugueses!

📚 **Próximos Passos:**
1. Explorar exemplos na pasta `examples\`
2. Criar seu primeiro programa
3. Compartilhar com amigos e família!

**Boa programação! 🚀**