import sys
import os
from interpretador import InterpretadorAprende

def main():
    if len(sys.argv) < 2:
        print("Como usar: python cli.py arquivo.aprende")
        print("Ou: python cli.py -i (modo interativo)")
        return
    
    if sys.argv[1] == "-i":
        modo_interativo()
    else:
        arquivo = sys.argv[1]
        if not os.path.exists(arquivo):
            print(f"Erro: Arquivo '{arquivo}' não encontrado!")
            return
        
        if not arquivo.endswith('.aprende'):
            print("Aviso: O arquivo não tem extensão .aprende")
        
        interpretador = InterpretadorAprende()
        interpretador.executar_arquivo(arquivo)

def modo_interativo():
    """Modo interativo para testar comandos"""
    interpretador = InterpretadorAprende()
    print("=== Aprende - Linguagem de Programação ===")
    print("Digite 'sair' para terminar")
    print("Digite 'ajuda' para ver comandos disponíveis")
    print()
    
    while True:
        try:
            linha = input("aprende> ")
            
            if linha.lower() in ['sair', 'exit', 'quit']:
                print("Tchau! 👋")
                break
            
            if linha.lower() == 'ajuda':
                mostrar_ajuda()
                continue
            
            if linha.strip():
                interpretador.executar_linha(linha)
                
        except KeyboardInterrupt:
            print("\nTchau! 👋")
            break
        except Exception as e:
            print(f"Erro: {e}")

def mostrar_ajuda():
    """Mostra comandos disponíveis"""
    print("""
=== Comandos Disponíveis ===

Básicos:
  mostra "texto"           - Mostra texto na tela
  ler "pergunta"          - Lê entrada do usuário
  definir nome valor      - Cria uma variável
  calcular 2 mais 3       - Faz cálculos matemáticos

Estruturas:
  se condicao entao acao  - Executa se condição for verdadeira
  para i 1 10             - Repete de 1 até 10
  repetir 5 acao          - Repete ação 5 vezes

Utilidades:
  esperar 2               - Para por 2 segundos
  limpar                  - Limpa a tela

Exemplos:
  mostra "Olá mundo!"
  definir idade 10
  calcular idade mais 5
  para i 1 5
    mostra i
""")

if __name__ == "__main__":
    main()