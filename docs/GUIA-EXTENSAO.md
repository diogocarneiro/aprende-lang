# Como Instalar e Usar a Extensão Aprende no VS Code

## 🚀 Instalação Rápida

### Método Automático (Recomendado)
1. Executa o script: `instalar-extensao.bat`
2. Segue as instruções na tela
3. Pronto! 🎉

### Método Manual
1. Abre terminal na pasta do projeto
2. Navega para `vscode-extension/`
3. Executa: `vsce package`
4. Executa: `code --install-extension aprende-lang-1.0.0.vsix`

## ✅ Pré-requisitos

- **Node.js** (https://nodejs.org) - versão LTS
- **VS Code** (https://code.visualstudio.com)
- **vsce** (instalado automaticamente pelo script)

## 🎨 Funcionalidades da Extensão

### Realce de Sintaxe
```aprende
// Comentários em verde
mostra "Strings em verde"
definir numero 42        // Números em amarelo
se numero maior 10 entao // Palavras-chave em roxo
    mostra "Verdadeiro!" // Operadores destacados
```

### Snippets Inteligentes
Digite e pressiona **Tab**:

| Snippet | Resultado |
|---------|-----------|
| `mostra` | `mostra "texto"` |
| `def` | `definir nome valor` |
| `se` | Estrutura se/então/senão completa |
| `para` | Loop para...de...até |
| `calc` | `definir resultado calcular expressao` |
| `programa` | Template completo de programa |
| `jogo` | Template para jogos simples |

### Temas Aprende
Escolhe o tema perfeito para ti! Pressiona **Ctrl+K Ctrl+T** e seleciona:

#### 🌞 **Aprende Kids Theme** (Claro)
- Cores suaves e amigáveis para crianças
- Fundo branco com tons pastéis
- Ideal para uso diurno e aprendizagem

#### 🌙 **Aprende Dark Theme** (Escuro)
- Tema escuro com contraste equilibrado
- Cores vibrantes sobre fundo escuro
- Confortável para os olhos

#### 🌌 **Aprende Palenight Theme** (Escuro Premium)
- Inspirado no popular tema Palenight
- Contraste médio, cores suaves
- Ideal para programação prolongada

**Dica**: Podes alternar entre temas a qualquer momento! �

### Ícones Personalizados
- Ficheiros `.aprende` têm ícone exclusivo
- Diferentes ícones para tema claro/escuro
- Fácil identificação no explorador

## 🔧 Configuração Automática

A extensão configura automaticamente:
- **Indentação**: 4 espaços
- **Auto-indentação**: Ativada
- **Comentários**: `//` reconhecido
- **Parênteses**: Auto-fechamento ativado

## 📝 Como Testar

1. **Criar ficheiro**: `teste.aprende`
2. **Escrever código**:
   ```aprende
   // Meu primeiro programa
   mostra "Olá mundo!"
   
   definir nome ler "Como te chamas? "
   mostra "Olá " nome "!"
   
   para i de 1 ate 5
       mostra "Contagem: " i
   ```
3. **Verificar**: Código deve aparecer colorido!

## 🎯 Operadores Suportados

### Em Português
- `mais`, `menos`, `vezes`, `dividido`
- `igual`, `diferente`, `maior`, `menor`
- `se`, `entao`, `senao`, `para`, `enquanto`

### Com Símbolos
- `+`, `-`, `*`, `/`, `%`, `**`
- `==`, `!=`, `>`, `<`, `>=`, `<=`
- Ambas as formas são destacadas!

## 🐛 Resolução de Problemas

### Extensão não aparece
1. Reinicia VS Code
2. Verifica: **Ctrl+Shift+X** → procura "aprende"
3. Se não funcionar, executa `instalar-extensao.bat` novamente

### Sem realce de sintaxe
1. Verifica se o ficheiro tem extensão `.aprende`
2. Canto inferior direito do VS Code deve mostrar "Aprende"
3. Se mostrar "Plain Text", clica e seleciona "Aprende"

### Snippets não funcionam
1. Digita o snippet (ex: `mostra`)
2. Pressiona **Tab** (não Enter!)
3. Se não funcionar, verifica se a linguagem está definida como "Aprende"

## 🔄 Atualizar Extensão

Para instalar uma versão atualizada:
1. Executa `instalar-extensao.bat` novamente
2. A extensão será atualizada automaticamente
3. Reinicia VS Code se necessário

## 🎓 Próximos Passos

1. **Explora os snippets** - Digite `programa` + Tab
2. **Testa o tema** - Ctrl+K Ctrl+T → Aprende Kids Theme  
3. **Cria um jogo** - Digite `jogo` + Tab
4. **Partilha** - Mostra aos amigos como é fácil programar em Aprende!

---

**💡 Dica**: A extensão torna a programação em Aprende muito mais divertida e visual. Ideal para crianças aprenderem programação de forma colorida e intuitiva!