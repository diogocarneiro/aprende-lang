# Instruções para Publicar no VS Code Marketplace

Este guia explica como publicar a extensão Aprende Language Support no Visual Studio Code Marketplace.

## Pré-requisitos

1. **Conta Microsoft/Azure**: Necessária para aceder ao marketplace
2. **Visual Studio Code Extensions**: Criar publisher em https://marketplace.visualstudio.com/manage
3. **vsce instalado**: `npm install -g vsce`

## Passos para Publicação

### 1. Preparar a Extensão
A extensão já está preparada com:
- ✅ `package.json` atualizado com metadados completos
- ✅ `README.md` profissional e detalhado
- ✅ `CHANGELOG.md` com histórico de versões
- ✅ Ícone personalizado (`aprende-icon.ico`)
- ✅ Licença MIT
- ✅ 3 temas incluídos
- ✅ Snippets e syntax highlighting

### 2. Criar Conta de Publisher

1. Vá para https://marketplace.visualstudio.com/manage
2. Entre com conta Microsoft
3. Crie um novo publisher com ID: `diogocarneiro`
4. Preencha informações do perfil

### 3. Autenticar vsce

```bash
# Obter Personal Access Token do Azure DevOps
# Vá para: https://dev.azure.com/[organization]/_usersSettings/tokens

# Fazer login
vsce login diogocarneiro
```

### 4. Publicar a Extensão

```bash
# Ir para pasta da extensão
cd "C:\Developer\Projects\Aprende-lang\vscode-extension"

# Publicar (incrementa versão automaticamente)
vsce publish

# Ou publicar versão específica
vsce publish 1.1.0

# Ou publicar minor/patch
vsce publish minor
vsce publish patch
```

### 5. Verificar Publicação

1. Vá para https://marketplace.visualstudio.com/items?itemName=diogocarneiro.aprende-lang
2. Verifique se:
   - ✅ Ícone aparece corretamente
   - ✅ Descrição está completa
   - ✅ Screenshots estão visíveis (se adicionadas)
   - ✅ README renderiza corretamente
   - ✅ Links funcionam

## Comandos Úteis

```bash
# Ver informações da extensão
vsce show diogocarneiro.aprende-lang

# Listar versões
vsce ls diogocarneiro.aprende-lang

# Unpublish (cuidado!)
vsce unpublish diogocarneiro.aprende-lang

# Gerar package local (já feito)
vsce package
```

## Atualizações Futuras

Para publicar novas versões:

1. Fazer as alterações no código
2. Atualizar `CHANGELOG.md`
3. Executar `vsce publish [major|minor|patch]`

## URLs Importantes

- **Marketplace**: https://marketplace.visualstudio.com/items?itemName=diogocarneiro.aprende-lang
- **Gestão**: https://marketplace.visualstudio.com/manage/publishers/diogocarneiro
- **Azure DevOps**: https://dev.azure.com/
- **Documentação**: https://code.visualstudio.com/api/working-with-extensions/publishing-extension

## Troubleshooting

### Erro de Autenticação
```bash
vsce logout
vsce login diogocarneiro
```

### Erro de Versão
- Verificar se versão em `package.json` é maior que a publicada
- Usar `vsce publish patch` para incrementar automaticamente

### Ícone não Aparece
- Verificar se `icon` está correto no `package.json`
- Usar formato PNG ou ICO
- Tamanho recomendado: 128x128px

## Notas

- A extensão está **100% pronta** para publicação
- Todos os metadados estão preenchidos
- Documentação está completa
- Apenas precisa de conta no marketplace e autenticação