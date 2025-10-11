# 🚀 Linguagem Aprende

[![Version](https://img.shields.io/badge/version-1.1.1-blue.svg)](https://github.com/diogocarneiro/aprende-lang)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE.md)
[![Python](https://img.shields.io/badge/python-3.8+-green.svg)](https://python.org)
[![VS Code](https://img.shields.io/badge/VS%20Code-extension-orange.svg)](vscode-extension/)

> 🎯 **Uma linguagem de programação em português criada especialmente para crianças e iniciantes!**

A **Linguagem Aprende** torna a programação acessível usando palavras em português, syntax highlighting colorido e uma experiência de desenvolvimento completa no VS Code.

---

## ⚡ Instalação Rápida

### 🔥 Instalação Automática (1 clique)
1. **Baixe** o projeto
2. **Execute** `INSTALADOR.bat`
3. **Escolha** opção 1 - "Instalação Completa"
4. **Pronto!** 🎉

### 📖 Guia Detalhado
👉 **[Guia Completo de Instalação](docs/INSTALACAO.md)**

---

## 🎮 Como Usar

### 💻 Primeiro Programa
```aprende
// Meu primeiro programa em Aprende!
mostra "Olá mundo!"
definir nome "João"
definir idade 10

mostra "Olá " nome "!"
mostra "Tens " idade " anos"

se idade maior 5 entao
    mostra "És uma criança inteligente!"
senao
    mostra "Continua a aprender!"
```

### 🚀 Executar Programas
```bash
# Método 1: Terminal
python aprende.py examples/meu_programa.aprende

# Método 2: VS Code (Ctrl+F5)
# Método 3: Duplo clique no ficheiro .aprende
```

---

## ✨ Funcionalidades

### 🎨 **VS Code Extension Incluída**
- **Syntax highlighting** colorido
- **3 temas** especiais (Kids, Dark, Palenight)
- **Snippets inteligentes** (`mostra` + Tab)
- **Ícones personalizados** para ficheiros .aprende
- **IntelliSense** para palavras-chave

### 🇵🇹 **Comandos em Português**
- `mostra` - Exibir texto
- `definir` - Criar variáveis  
- `calcular` - Fazer cálculos
- `ler` - Ler entrada do utilizador
- `se/entao/senao` - Condições
- `para/de/ate` - Loops
- `funcao` - Criar funções

### ⚡ **Operadores Duplos**
```aprende
// Em português (mais fácil de ler)
definir soma calcular 5 mais 3
definir produto calcular 4 vezes 2

// Com símbolos (mais rápido)
definir soma calcular 5 + 3  
definir produto calcular 4 * 2
```

---

## 📁 Estrutura do Projeto

```
📦 Aprende-lang/
├── 🚀 INSTALADOR.bat      # ← Instalador automático
├── 🐍 aprende.py          # ← Executar programas
├── 📄 README.md           # ← Este ficheiro
│
├── 📂 src/                # Código fonte
│   ├── 🧠 interpretador.py
│   └── 💻 cli.py
│
├── 📂 examples/           # 15+ programas de exemplo
│   ├── 👋 ola.aprende
│   ├── 🎮 jogo-adivinhacao.aprende
│   ├── ⚡ funcao.aprende
│   └── 📚 ...
│
├── 📂 docs/               # Documentação completa
│   ├── 📖 INSTALACAO.md
│   ├── 📝 sintaxe-aprende.md
│   └── 📚 ...
│
├── 📂 vscode-extension/   # Extensão VS Code
│   └── 📦 aprende-lang-1.1.1.vsix
│
├── 📂 scripts/            # Scripts de instalação
└── 📂 assets/             # Ícones e recursos
```

---

## 🎓 Aprender a Programar

### 🚀 Para Iniciantes
1. **Comece** com `examples/programa-simples.aprende`
2. **Leia** a [documentação de sintaxe](docs/sintaxe-aprende.md)
3. **Experimente** criar seus próprios programas!

### 👩‍🏫 Para Professores
- **📚 Exemplos prontos** na pasta `examples/`
- **🎨 Interface amigável** para crianças
- **📖 Documentação completa** em português
- **🔧 Instalação simples** em 1 clique

### 👨‍💻 Para Desenvolvedores
- **🐍 Python** como base
- **📝 Código aberto** e extensível
- **🔧 API simples** para adicionar comandos
- **📦 Empacotamento** profissional

---

## 🎯 Exemplos Rápidos

### 🧮 Calculadora
```aprende
mostra "=== Calculadora Aprende ==="
definir a ler "Digite o primeiro número: "
definir b ler "Digite o segundo número: "

definir soma calcular a + b
definir produto calcular a * b

mostra a " + " b " = " soma
mostra a " × " b " = " produto
```

### 🎮 Jogo Simples
```aprende
mostra "=== Jogo de Adivinhação ==="
definir numero_secreto 7
definir tentativa ler "Adivinhe o número (1-10): "

se tentativa igual numero_secreto entao
    mostra "🎉 Parabéns! Acertaste!"
senao
    mostra "❌ Tenta novamente!"
```

### ⚡ Função Personalizada
```aprende
funcao saudar(nome, idade)
    mostra "Olá " nome "!"
    mostra "Tens " idade " anos"
    
    se idade maior_igual 18 entao
        mostra "És adulto!"
    senao
        mostra "És jovem!"
fim

saudar "Maria" 15
saudar "João" 20
```

---

## 🛠️ Desenvolvimento

### 🔧 Requisitos
- **Python 3.8+**
- **VS Code** (opcional, mas recomendado)

### 🚀 Execução
```bash
# Clonar repositório
git clone https://github.com/diogocarneiro/aprende-lang.git
cd aprende-lang

# Executar programa
python aprende.py examples/nome_programa.aprende

# Modo interativo
python src/cli.py -i
```

### 🧪 Testes
```bash
# Testar exemplos
python aprende.py examples/teste-estrutura.aprende

# Testar todas as funcionalidades
python aprende.py examples/exemplo-sintaxe-completa.aprende
```

---

## 🤝 Contribuir

Contribuições são bem-vindas! 

### 🔀 Como Contribuir
1. **Fork** do repositório
2. **Criar** branch para a funcionalidade
3. **Commit** das mudanças
4. **Push** para a branch
5. **Abrir** Pull Request

### 🐛 Reportar Bugs
- [Abrir issue](https://github.com/diogocarneiro/aprende-lang/issues) no GitHub
- Incluir detalhes e exemplo de código

---

## 📞 Suporte

### 🆘 Precisa de Ajuda?
- **📧 Email**: diogoncarneiro@outlook.com
- **🐛 Issues**: [GitHub Issues](https://github.com/diogocarneiro/aprende-lang/issues)
- **📖 Docs**: Pasta `docs/` com guias completos

### 🎓 Recursos de Aprendizagem
- **📁 Exemplos**: 15+ programas na pasta `examples/`
- **📚 Sintaxe**: [Guia completo](docs/sintaxe-aprende.md)
- **🎮 Projetos**: Jogos e exercícios práticos

---

## 📜 Licença

Este projeto está licenciado sob a **Licença MIT** - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes.

---

## 🎉 Sobre o Projeto

A **Linguagem Aprende** foi criada com o objetivo de tornar a programação acessível para crianças e iniciantes portugueses, removendo as barreiras linguísticas e oferecendo uma experiência de desenvolvimento moderna e intuitiva.

### 🎯 Objetivos
- 🇵🇹 **Programação em português** sem acentos
- 👶 **Interface amigável** para crianças
- 🎨 **Experiência visual** atrativa
- 📚 **Aprendizagem gradual** com exemplos
- 🚀 **Ferramentas profissionais** (VS Code)

### 💝 Agradecimentos
Obrigado a todos que tornam a programação mais acessível para a próxima geração!

---

**🚀 Aprende - Tornando a programação acessível para todos! 🇵🇹**