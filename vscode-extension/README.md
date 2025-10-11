# Aprende Language Support 🚀

[![Version](https://img.shields.io/badge/version-1.1.1-blue.svg)](https://github.com/diogocarneiro/aprende-lang)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE.md)
[![VS Code](https://img.shields.io/badge/VS%20Code-1.80+-orange.svg)](https://code.visualstudio.com/)

Uma extensão completa do VS Code para a linguagem de programação **Aprende** - uma linguagem em português desenvolvida especialmente para crianças e iniciantes aprenderem programação de forma intuitiva e divertida!

## ✨ Características Principais

- 🎨 **Realce de sintaxe** completo e colorido para palavras-chave em português
- 🌈 **3 Temas incluídos**: Kids Theme, Dark Theme e Palenight Theme
- 📝 **Snippets inteligentes** para código comum (se/entao/senao, para/de/ate, funcao, etc.)
- 🔧 **Configuração automática** de indentação e formatação
- 💡 **IntelliSense** para palavras-chave da linguagem Aprende
- 🎯 **Ícones personalizados** para ficheiros `.aprende`
- 📁 **Associação automática** de ficheiros com extensão `.aprende`
- ⚡ **Suporte para funções** personalizadas com `funcao` e `retorna`

## 🚀 Linguagem Aprende

A linguagem **Aprende** foi criada para tornar a programação acessível para crianças portuguesas, usando:

- **Palavras-chave em português**: `se`, `entao`, `senao`, `para`, `de`, `ate`
- **Operadores em português**: `mais`, `menos`, `vezes`, `dividido`
- **Sintaxe simples**: `mostra "Olá mundo!"`, `definir nome "João"`
- **Matemática intuitiva**: Suporta tanto operadores portugueses quanto símbolos (+, -, *, /)

### Exemplo de código Aprende:
```aprende
// Programa simples em Aprende
definir nome "Maria"
definir idade 10

mostra "Olá " nome "!"
mostra "Tens " idade " anos"

se idade maior 5 entao
    mostra "És uma criança inteligente!"
senao
    mostra "Continua a aprender!"

para i de 1 ate 5
    mostra "Contagem: " i

// Definir função personalizada
funcao saudar(nome)
    mostra "Olá " nome "! Bem-vindo à programação!"
fim

// Chamar a função
saudar "Pedro"
```

## 📦 Instalação

### Via Marketplace (Recomendado)
1. Abra o VS Code
2. Vá para a aba Extensions (Ctrl+Shift+X)
3. Procure por "Aprende Language Support"
4. Clique em "Install"

### Instalação Manual
```bash
# Clone o repositório
git clone https://github.com/diogocarneiro/aprende-lang.git

# Vá para a pasta da extensão
cd aprende-lang/vscode-extension

# Instale o vsce se necessário
npm install -g vsce

# Crie o package
vsce package

# Instale a extensão
code --install-extension aprende-lang-1.1.0.vsix
```
2. Reinicia o VS Code

## Palavras-chave suportadas

### Comandos Básicos
- `mostra` - Exibe texto ou valores
- `ler` - Lê entrada do utilizador  
- `definir` - Define variáveis
- `calcular` - Faz cálculos

### Estruturas de Controlo
- `se` / `entao` / `senao` - Condicionais
- `para` / `de` / `ate` - Loops for
- `enquanto` - Loops while
- `repetir` / `vezes` - Repetições simples

### Operadores (duas formas de usar!)

**Em português (mais fácil de ler):**
- `mais`, `menos`, `vezes`, `dividido`
- `igual`, `diferente`, `maior`, `menor`
- `e`, `ou`, `nao`

**Com símbolos (mais rápido de escrever):**
- `+`, `-`, `*`, `/`, `%`, `**`
- `==`, `!=`, `>`, `<`, `>=`, `<=`
- `verdadeiro`, `falso`, `nada`

## Snippets Disponíveis

Digite os seguintes prefixos e pressiona Tab:

- `mostra` → `mostra "texto"`
- `def` → `definir nome valor`
- `calc` → `definir resultado calcular expressao`
- `calc+` → `definir resultado calcular a + b` (com símbolos)
- `calcpt` → `definir resultado calcular a mais b` (em português)
- `se>` → Condição com símbolo >
- `semaior` → Condição com palavra "maior"
- `se` → Estrutura condicional completa
- `para` → Loop para...de...ate
- `programa` → Estrutura básica de programa
- `jogo` → Template para jogos simples

## Tema Aprende Kids

A extensão inclui um tema colorido especial pensado para crianças:
- Cores suaves e amigáveis
- Palavras-chave em destaque
- Comentários em verde claro
- Strings em verde
- Números em amarelo

Para ativar: `Ctrl+K Ctrl+T` → "Aprende Kids Theme"

## 🎨 Temas Incluídos

A extensão inclui 3 temas especialmente desenhados:

### 1. **Aprende Kids Theme** (Claro)
- Cores suaves e amigáveis
- Perfeito para crianças
- Fundo claro e texto escuro

### 2. **Aprende Dark Theme** (Escuro)
- Tema escuro moderno
- Ideal para longos períodos de programação
- Fácil para os olhos

### 3. **Aprende Palenight Theme** (Escuro Premium)
- Baseado no popular tema Palenight
- Cores roxas e azuis elegantes
- Para desenvolvedores mais avançados

**Para ativar:** `Ctrl+K Ctrl+T` → Escolher tema Aprende

## 📚 Snippets Disponíveis

Digite os seguintes prefixos e pressione Tab:

| Prefixo | Resultado | Descrição |
|---------|-----------|-----------|
| `mostra` | `mostra "texto"` | Comando de output |
| `def` | `definir nome valor` | Definir variável |
| `calc` | `definir resultado calcular expressao` | Cálculo |
| `se` | Estrutura condicional completa | If/then/else |
| `para` | Loop para...de...ate | For loop |
| `funcao` | Template de função simples | Define função |
| `funcaoret` | Template de função com retorno | Função com retorno |
| `retorna` | `retorna valor` | Retorna valor |
| `programa` | Estrutura básica de programa | Template inicial |
| `jogo` | Template para jogos simples | Jogo de adivinhação |

## 🛠️ Funcionalidades

- ✅ **Syntax Highlighting** completo
- ✅ **Auto-indentação** inteligente  
- ✅ **Snippets** para código comum
- ✅ **3 Temas** incluídos
- ✅ **Ícones** personalizados
- ✅ **IntelliSense** básico
- ✅ **Funções personalizadas** com `funcao` e `retorna`
- ✅ **Configuração** automática

## 💻 Requisitos

- Visual Studio Code 1.80.0 ou superior
- Nenhuma dependência externa necessária

## 🤝 Contribuir

Contribuições são bem-vindas! Por favor:

1. Faça fork do repositório
2. Crie uma branch para a sua funcionalidade
3. Commit as suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📝 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes.

## 🐛 Reportar Bugs

Encontrou um problema? [Abra uma issue](https://github.com/diogocarneiro/aprende-lang/issues) no GitHub.

## 📧 Contacto

- **Autor**: Diogo Carneiro
- **Email**: diogoncarneiro@outlook.com
- **GitHub**: [diogocarneiro](https://github.com/diogocarneiro)

---

**Aprende** - Tornando a programação acessível para crianças portuguesas! 🇵🇹 👶 💻aprende
// Meu primeiro programa em Aprende
mostra "Olá mundo!"

definir nome ler "Como te chamas? "
mostra "Olá " nome "!"

// Podes usar operadores em português...
para i de 1 ate 5
    definir quadrado calcular i vezes i
    mostra "Quadrado de " i " = " quadrado

// ...ou usar símbolos matemáticos!
para i de 1 ate 5
    definir cubo calcular i * i * i
    mostra "Cubo de " i " = " cubo

// Ambas as formas funcionam em condições
se nome igual "João" entao
    mostra "Que nome bonito!"
senao
    mostra "Prazer em conhecer-te!"

// Ou usando símbolos:
se nome == "Maria" entao
    mostra "Olá Maria!"
```

## Problemas conhecidos

- O IntelliSense ainda é básico
- Não há verificação de erros em tempo real (planeado para versão futura)

## Contribuir

Este projeto é open source! Contribuições são bem-vindas.

## Licença

MIT License - vê o ficheiro LICENSE para detalhes.