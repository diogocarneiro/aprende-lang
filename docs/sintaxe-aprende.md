# Sintaxe da Linguagem Aprende

## Palavras-chave Principais

### Comandos Básicos
- `mostra` - Exibe texto ou valores na tela (equivale a mostra)
- `ler` - Lê entrada do utilizador (equivale a input)
- `definir` - Define uma variável
- `calcular` - Realiza cálculos matemáticos

### Estruturas de Controlo
- `se` ... `entao` ... `senao` - Estrutura condicional
- `para` ... `de` ... `ate` - Loop for
- `enquanto` - Loop while
- `repetir` ... `vezes` - Repete uma ação X vezes

### Operadores Matemáticos (duas formas de usar)
**Forma em português:**
- `mais` (+)
- `menos` (-)
- `vezes` (*)
- `dividido` (/)
- `resto` (%)
- `potencia` (**)

**Forma com símbolos (também suportada):**
- `+` (mais)
- `-` (menos) 
- `*` (vezes)
- `/` (dividido)
- `%` (resto)
- `**` (potência)

### Operadores de Comparação (duas formas)
**Forma em português:**
- `igual` (==)
- `diferente` (!=)
- `maior` (>)
- `menor` (<)
- `maior_igual` (>=)
- `menor_igual` (<=)

**Forma com símbolos (também suportada):**
- `==` (igual)
- `!=` (diferente)
- `>` (maior)
- `<` (menor)
- `>=` (maior ou igual)
- `<=` (menor ou igual)

### Operadores Lógicos
- `e` (and)
- `ou` (or)
- `nao` (not)

### Valores Especiais
- `verdadeiro` (True)
- `falso` (False)
- `nada` (None)

### Comentários
- `//` - Comentário de linha

## Exemplos de Sintaxe

```aprende
// Definir variáveis
definir nome "João"
definir idade 10
definir altura 1.45

// Mostrar valores
mostra "Olá, " nome "!"
mostra "Tens " idade " anos"

// Cálculos - podes usar português ou símbolos!
definir anos_futuros calcular idade mais 5
definir anos_futuros2 calcular idade + 5      // Mesmo resultado!

definir area calcular largura vezes altura
definir area2 calcular largura * altura       // Também funciona!

definir media calcular soma dividido 2
definir media2 calcular soma / 2              // Equivalente!

// Estruturas condicionais - ambas as formas
se idade maior 12 entao
    mostra "És um adolescente!"
senao
    mostra "És uma criança!"

// Ou usando símbolos:
se idade > 12 entao
    mostra "És um adolescente!"
senao  
    mostra "És uma criança!"

// Loops
para i de 1 ate 5
    mostra "Contagem: " i

// Repetições simples
repetir 3 vezes
    mostra "Olá mundo!"

// Loop enquanto
definir contador 0
enquanto contador menor 5
    mostra "Contador: " contador
    definir contador calcular contador mais 1
```

## Tipos de Dados

### Números
- Inteiros: `42`, `-10`, `0`
- Decimais: `3.14`, `-2.5`, `0.0`

### Texto (Strings)
- `"Olá mundo"`
- `'Texto simples'`
- Concatenação: `"Olá " nome "!"`

### Lógicos
- `verdadeiro`
- `falso`

## Funções Integradas

### Entrada/Saída
- `mostra(valor)` - Exibe valor
- `ler(mensagem)` - Lê entrada do utilizador

### Matemática
- `calcular(expressao)` - Calcula expressão matemática
- `arredondar(numero)` - Arredonda número
- `absoluto(numero)` - Valor absoluto

### Utilidades
- `esperar(segundos)` - Pausa execução
- `limpar()` - Limpa ecrã
- `tamanho(texto)` - Comprimento do texto
- `maiuscula(texto)` - Converte para maiúsculas
- `minuscula(texto)` - Converte para minúsculas

## Estrutura de Ficheiros

Extensão: `.aprende`

Exemplo de ficheiro completo:
```aprende
// meu_programa.aprende
// Programa simples em Aprende

mostra "=== Calculadora Simples ==="

mostra "Digite o primeiro número:"
definir num1 ler

mostra "Digite o segundo número:"
definir num2 ler

definir soma calcular num1 mais num2
definir produto calcular num1 vezes num2

mostra "Soma: " soma
mostra "Produto: " produto

se soma maior 100 entao
    mostra "Resultado muito grande!"
senao
    mostra "Resultado normal"
```