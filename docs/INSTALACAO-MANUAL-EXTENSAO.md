# Guia de Instalação Manual da Extensão Aprende

## 🎯 Método que Funciona 100%

Se o script automático não funcionar, usa este método manual que é garantido:

### Passo 1: Criar o Pacote da Extensão
1. Abre terminal na pasta do projeto
2. Navega para `vscode-extension/`
3. Executa: `vsce package`
4. Isto cria o ficheiro `aprende-lang-1.0.0.vsix`

### Passo 2: Instalação Manual no VS Code
1. **Abre VS Code**
2. **Pressiona**: `Ctrl+Shift+P` (Command Palette)
3. **Escreve**: `Extensions: Install from VSIX`
4. **Seleciona**: o ficheiro `aprende-lang-1.0.0.vsix`
5. **Clica**: "Install"
6. **Reinicia VS Code** se pedido

### Passo 3: Verificação
1. **Abre**: `Ctrl+Shift+X` (Extensions panel)
2. **Procura**: "aprende" ou "Aprende Language"
3. **Deve aparecer**: extensão instalada como `aprende-dev.aprende-lang`

## ✅ Como Verificar se Funciona

### Teste Rápido
1. Cria ficheiro: `teste.aprende`
2. Escreve:
   ```aprende
   // Este comentário deve estar verde
   mostra "Olá mundo"
   definir idade 25
   se idade > 18 entao
       mostra "És adulto!"
   ```
3. **Verifica**: Código deve estar colorido!

### Verificações
- **Canto inferior direito**: deve mostrar "Aprende" (não "Plain Text")
- **Palavras-chave**: `mostra`, `definir`, `se` devem estar coloridas
- **Comentários**: `//` deve estar verde
- **Strings**: `"texto"` deve estar verde

## 🔧 Resolução de Problemas

### Sintaxe não aparece
1. **Verifica extensão**: `Ctrl+Shift+X` → procura "aprende"
2. **Força linguagem**: Clica no canto inferior direito onde diz a linguagem
3. **Seleciona**: "Aprende" na lista

### Extensão não aparece nas instaladas
1. **Verifica**: O ficheiro .vsix foi instalado na pasta correta?
2. **Reinstala**: Repete o processo de instalação manual
3. **Terminal**: `code --list-extensions | findstr aprende`

### Snippets não funcionam
1. **Verifica linguagem**: Deve ser "Aprende", não "Plain Text"
2. **Testa snippet**: Digite `mostra` + Tab
3. **Se não funcionar**: Reinicia VS Code

## 🎨 Funcionalidades após Instalação

### Realce de Sintaxe
- **Comentários**: Verde claro (`// comentário`)
- **Palavras-chave**: Roxo (`mostra`, `se`, `para`)
- **Strings**: Verde (`"texto"`)
- **Números**: Amarelo (`42`, `3.14`)
- **Operadores**: Roxo (`mais`, `+`, `==`)

### Snippets Disponíveis
| Digite + Tab | Resultado |
|--------------|-----------|
| `mostra` | `mostra "texto"` |
| `def` | `definir nome valor` |
| `se` | Estrutura condicional completa |
| `para` | Loop para...de...até |
| `programa` | Template de programa |

### Tema Especial
1. **Ativa**: `Ctrl+K Ctrl+T`
2. **Escolhe**: "Aprende Kids Theme"
3. **Resultado**: Cores suaves para crianças

## 📱 Comandos de Terminal Úteis

```bash
# Verificar extensões instaladas
code --list-extensions

# Verificar se Aprende está instalada
code --list-extensions | findstr aprende

# Reinstalar extensão
code --install-extension caminho/para/aprende-lang-1.0.0.vsix --force

# Abrir VS Code com ficheiro Aprende
code ficheiro.aprende
```

## 🎯 Dicas Pro

1. **Backup da extensão**: Guarda o ficheiro `.vsix` para futuras instalações
2. **Partilha**: Podes dar o ficheiro `.vsix` a outros para instalarem
3. **Atualizações**: Quando houver nova versão, repete o processo
4. **Múltiplas máquinas**: Usa o mesmo `.vsix` em diferentes computadores

---

**💡 Nota**: A instalação manual é muitas vezes mais confiável que scripts automáticos, especialmente em ambientes corporativos ou com configurações especiais do VS Code.