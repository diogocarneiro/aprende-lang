# Aprende Language - AI Coding Assistant Instructions

## Project Overview
Aprende is a Portuguese-language programming language designed for children and beginners. It consists of a Python interpreter, VS Code extension, and automated installer - all with Portuguese syntax and educational focus.

## Architecture & Components

### Core Interpreter (`src/`)
- **`interpretador.py`**: Main language interpreter with Portuguese keywords (`mostra`, `definir`, `calcular`, `se/entao/senao`)
- **`cli.py`**: Command-line interface with interactive mode (`python aprende.py -i`)  
- **`aprende.py`**: Entry point that imports from `src/` directory

### VS Code Extension (`vscode-extension/`)
- **Complete extension package** with syntax highlighting, themes, and snippets
- **Three custom themes**: Kids, Dark, Palenight in `themes/`
- **Syntax definitions**: `syntaxes/aprende.tmLanguage.json` defines Portuguese keywords
- **Extension logic**: `extension.js` provides function definition support

### Installation System
- **`INSTALADOR.bat`**: Windows-based automated installer with menu system
- **`scripts/`**: Individual configuration scripts for components
- **File associations**: `.aprende` files execute with Python interpreter

## Language Syntax Patterns

### Dual Operator System
Aprende supports **both Portuguese and symbolic operators**:
```aprende
// Portuguese operators (educational)
definir soma calcular 5 mais 3
definir produto calcular 4 vezes 2

// Symbolic operators (faster)  
definir soma calcular 5 + 3
definir produto calcular 4 * 2
```

### Portuguese Keywords
- **Variables**: `definir nome "João"` 
- **Output**: `mostra "Olá " nome`
- **Input**: `definir idade ler "Idade: "`
- **Conditionals**: `se idade maior 10 entao ... senao ...`
- **Loops**: `para i de 1 ate 5`, `enquanto x menor 10`
- **Functions**: `funcao minha_funcao ... fim`

## Development Workflows

### Testing Programs
```bash
# Run single file
python aprende.py examples/demo-final.aprende

# Interactive mode for testing
python aprende.py -i
```

### VS Code Extension Development
- Extension auto-activates on `.aprende` files
- Use F5 to run extension in development mode
- Package with `vsce package` (not automated in this project)

### File Structure Conventions
- **Examples in `examples/`**: Working code samples, extensively commented
- **Tests in `tests/`**: Python unittest files testing interpreter functions
- **Documentation in `docs/`**: Installation guides, syntax reference

## Critical Integration Points

### Python Path Management
The main `aprende.py` adds `src/` to Python path:
```python
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))
```

### Extension-Interpreter Coordination
- VS Code extension recognizes `.aprende` files via `package.json` configuration
- File associations in Windows registry allow double-click execution
- Syntax highlighting matches interpreter's exact keyword patterns

### Installer Dependencies
- Requires Python 3.8+ installation
- VS Code installation for extension features
- Windows-specific batch scripts for automation

## Testing & Validation

### Running Tests
```bash
python -m pytest tests/
python -m unittest tests.test_control_structures
```

### Example Validation
- All files in `examples/` should execute without errors
- Use `teste-simples.aprende` for basic functionality verification
- `demo-final.aprende` demonstrates dual operator system

## Project-Specific Conventions

### Portuguese-First Design
- All user-facing text in Portuguese (error messages, documentation)
- Variable names in Portuguese in examples: `numero1`, `linha`, `coluna`
- Comments use `//` syntax, always in Portuguese

### Educational Focus
- Extensive commenting in example files
- Progressive complexity from `ola.aprende` to `jogo-adivinhacao.aprende`
- Error messages designed for beginners learning programming concepts

### Windows-Centric Deployment
- Primary installation via Windows batch files
- Registry modifications for file associations
- VS Code extension distributed as packaged `.vsix` file

When working with this codebase, prioritize maintaining the educational Portuguese-language experience while ensuring all components (interpreter, extension, installer) remain synchronized.