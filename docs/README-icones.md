# Configuração de Ícones - Linguagem Aprende

## Ícones Disponíveis

O projeto inclui diferentes formatos de ícones:

- **`aprende-icon.ico`** - Ícone principal em formato ICO para Windows
- **`icon.png`** - Ícone em formato PNG (alta resolução)
- **`vscode-extension/icons/`** - Ícones SVG para VS Code

## Como Configurar o Ícone

### Automático
Execute o script de configuração:
```bash
configurar-icone.bat
```

### Manual
1. Certifica-te que tens `aprende-icon.ico` na pasta raiz
2. Executa `registar.reg` para aplicar as configurações
3. Atualiza a cache de ícones:
   ```bash
   ie4uinit.exe -ClearIconCache
   ie4uinit.exe -show
   ```

## Mudar o Ícone

### Se tens um ícone PNG
1. Usa `converter-icone.bat` para instruções de conversão
2. Ou converte online: [convertio.co/png-ico](https://convertio.co/png-ico/)
3. Substitui `aprende-icon.ico`
4. Executa `configurar-icone.bat`

### Se tens um ícone personalizado
1. Converte para formato ICO (256x256 recomendado)
2. Substitui `aprende-icon.ico`
3. Executa `configurar-icone.bat`

## Formatos Suportados

### Para Windows (Explorador de Ficheiros)
- **ICO** - Formato nativo (recomendado)
- Resoluções: 16x16, 32x32, 48x48, 256x256

### Para VS Code
- **SVG** - Formato vetorial (ideal)
- **PNG** - Formato bitmap (alternativo)

## Troubleshooting

### Ícone não aparece
1. Pressiona F5 no Explorador de Ficheiros
2. Reinicia o `explorer.exe`:
   ```bash
   taskkill /f /im explorer.exe
   start explorer.exe
   ```
3. Executa novamente `configurar-icone.bat`

### Ícone aparece genérico
1. Verifica se `aprende-icon.ico` existe
2. Executa como administrador:
   ```bash
   regedit /s registar.reg
   ```
3. Limpa cache: `ie4uinit.exe -ClearIconCache`

### Ícone de baixa qualidade
1. Usa ícone ICO com múltiplas resoluções
2. Inclui pelo menos: 16x16, 32x32, 48x48, 256x256
3. Usa ferramenta profissional como IcoFX ou online

## Scripts Disponíveis

- **`configurar-icone.bat`** - Configura o ícone automaticamente
- **`converter-icone.bat`** - Ajuda a converter PNG para ICO
- **`registar.reg`** - Configurações do registo Windows
- **`instalar.bat`** - Instalação completa (inclui ícone)

## Personalização Avançada

### Diferentes ícones por estado
Podes configurar ícones diferentes para:
- Ficheiro normal: `aprende-icon.ico`
- Ficheiro em execução: `aprende-running.ico`
- Ficheiro com erro: `aprende-error.ico`

### Integração com VS Code
Os ícones SVG em `vscode-extension/icons/` são usados para:
- Ficheiros `.aprende` no explorador
- Temas claro e escuro
- Ícone da extensão

## Exemplo de Uso

Depois de configurado, todos os ficheiros `.aprende` terão o ícone personalizado no Explorador de Ficheiros, facilitando a identificação visual dos programas da linguagem Aprende.