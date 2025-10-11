import re
import time
import os

def mostra(*args):
    """Função global para imprimir na tela"""
    if args:
        print(' '.join(str(arg) for arg in args))
    else:
        print()

class InterpretadorAprende:
    def __init__(self):
        self.variaveis = {}
        self.funcoes_usuario = {}  # Armazena funções definidas pelo usuário
        self.funcoes_builtin = {
            'mostra': self._mostra,
            'ler': self._ler,
            'definir': self._definir,
            'calcular': self._calcular,
            'esperar': self._esperar,
            'limpar': self._limpar,
            'se': self._se,
            'para': self._para,
            'enquanto': self._enquanto,
            'repetir': self._repetir,
            'funcao': self._funcao  # Nova função para definir funções
        }
    
    def _mostra(self, *args):
        """Imprime na tela"""
        if args:
            texto = ' '.join(str(arg) for arg in args)
            # Remove aspas se for uma string literal
            if texto.startswith('"') and texto.endswith('"'):
                texto = texto[1:-1]
            elif texto.startswith("'") and texto.endswith("'"):
                texto = texto[1:-1]
            mostra(texto)
        else:
            mostra()
    
    def _ler(self, mensagem=""):
        """Lê entrada do usuário"""
        if mensagem.startswith('"') and mensagem.endswith('"'):
            mensagem = mensagem[1:-1]
        elif mensagem.startswith("'") and mensagem.endswith("'"):
            mensagem = mensagem[1:-1]
        entrada = input(mensagem)
        # Tenta converter para número se possível
        try:
            if '.' in entrada:
                return float(entrada)
            else:
                return int(entrada)
        except ValueError:
            return entrada
    
    def _definir(self, nome, valor):
        """Define uma variável"""
        # Processa o valor
        if isinstance(valor, str):
            if valor.startswith('"') and valor.endswith('"'):
                valor = valor[1:-1]
            elif valor.startswith("'") and valor.endswith("'"):
                valor = valor[1:-1]
            elif valor.startswith('calcular '):
                valor = self._calcular(valor[9:])
            elif valor == 'ler':
                valor = self._ler()
            elif valor.startswith('ler '):
                valor = self._ler(valor[4:])
            else:
                # Tenta converter para número
                try:
                    if '.' in valor:
                        valor = float(valor)
                    else:
                        valor = int(valor)
                except ValueError:
                    # Verifica se é uma variável existente
                    if valor in self.variaveis:
                        valor = self.variaveis[valor]
        
        self.variaveis[nome] = valor
        return valor
    
    def _calcular(self, expressao):
        """Calcula expressões matemáticas simples"""
        try:
            # Converte para string se necessário
            expressao = str(expressao)
            
            # Substitui variáveis pelos seus valores
            for var, valor in self.variaveis.items():
                if isinstance(valor, (int, float)):
                    expressao = re.sub(r'\b' + re.escape(var) + r'\b', str(valor), expressao)
            
            # Substitui operadores em português (mantém compatibilidade)
            expressao = re.sub(r'\bmais\b', '+', expressao)
            expressao = re.sub(r'\bmenos\b', '-', expressao)
            expressao = re.sub(r'\bvezes\b', '*', expressao)
            expressao = re.sub(r'\bdividido\b', '/', expressao)
            expressao = re.sub(r'\bresto\b', '%', expressao)
            expressao = re.sub(r'\bpotencia\b', '**', expressao)
            
            # Substitui comparadores
            expressao = re.sub(r'\bigual\b', '==', expressao)
            expressao = re.sub(r'\bdiferente\b', '!=', expressao)
            expressao = re.sub(r'\bmaior_igual\b', '>=', expressao)
            expressao = re.sub(r'\bmenor_igual\b', '<=', expressao)
            expressao = re.sub(r'\bmaior\b', '>', expressao)
            expressao = re.sub(r'\bmenor\b', '<', expressao)
            
            # Substitui lógicos
            expressao = re.sub(r'\be\b', 'and', expressao)
            expressao = re.sub(r'\bou\b', 'or', expressao)
            expressao = re.sub(r'\bnao\b', 'not', expressao)
            
            # Substitui valores especiais
            expressao = re.sub(r'\bverdadeiro\b', 'True', expressao)
            expressao = re.sub(r'\bfalso\b', 'False', expressao)
            expressao = re.sub(r'\bnada\b', 'None', expressao)
            
            # Avalia a expressão
            resultado = eval(expressao, {"__builtins__": {}}, {})
            return resultado
        except Exception as e:
            return f"Erro no calculo: {e}"
    
    def _se(self, condicao, bloco_entao, bloco_senao=None):
        """Estrutura condicional se/entao/senao"""
        resultado_condicao = self._calcular(condicao)
        if resultado_condicao:
            return self.executar_bloco(bloco_entao)
        elif bloco_senao:
            return self.executar_bloco(bloco_senao)
        return None
    
    def _para(self, variavel, inicio, fim, bloco):
        """Loop para variável de inicio ate fim"""
        inicio_val = self._calcular(inicio) if isinstance(inicio, str) else inicio
        fim_val = self._calcular(fim) if isinstance(fim, str) else fim
        
        for i in range(int(inicio_val), int(fim_val) + 1):
            self.variaveis[variavel] = i
            self.executar_bloco(bloco)
    
    def _enquanto(self, condicao, bloco):
        """Loop enquanto condição for verdadeira"""
        while self._calcular(condicao):
            self.executar_bloco(bloco)
    
    def executar_bloco(self, linhas):
        """Executa um bloco de linhas de código"""
        if isinstance(linhas, str):
            linhas = [linhas]
        for linha in linhas:
            self.executar_linha(linha)
    
    def _repetir(self, vezes, acao):
        """Repete uma ação X vezes"""
        for i in range(int(vezes)):
            yield i
    
    def _esperar(self, segundos):
        """Pausa execução por X segundos"""
        time.sleep(float(segundos))
    
    def _limpar(self):
        """Limpa a tela"""
        os.system('cls' if os.name == 'nt' else 'clear')
    
    def _funcao(self, nome, parametros, corpo):
        """Define uma função personalizada"""
        self.funcoes_usuario[nome] = {
            'parametros': parametros,
            'corpo': corpo
        }
    
    def chamar_funcao(self, nome, argumentos):
        """Chama uma função definida pelo usuário"""
        if nome not in self.funcoes_usuario:
            raise Exception(f"Função '{nome}' não foi definida")
        
        funcao = self.funcoes_usuario[nome]
        parametros = funcao['parametros']
        corpo = funcao['corpo']
        
        # Verifica se o número de argumentos está correto
        if len(argumentos) != len(parametros):
            raise Exception(f"Função '{nome}' espera {len(parametros)} argumentos, mas recebeu {len(argumentos)}")
        
        # Salva variáveis atuais (escopo local)
        variaveis_backup = self.variaveis.copy()
        
        # Define parâmetros como variáveis locais
        for i, param in enumerate(parametros):
            self.variaveis[param] = argumentos[i]
        
        # Executa o corpo da função
        resultado = None
        try:
            for linha in corpo:
                if linha.strip().startswith('retorna '):
                    # Comando retorna
                    valor = linha.strip()[8:].strip()
                    resultado = self._calcular(valor) if valor else None
                    break
                else:
                    self.executar_linha(linha)
        finally:
            # Restaura variáveis originais
            self.variaveis = variaveis_backup
        
        return resultado
    
    def parsear_linha(self, linha):
        """Analisa e processa uma linha de código"""
        linha = linha.strip()
        
        # Ignora comentários e linhas vazias
        if not linha or linha.startswith('//'):
            return
        
        # Comando mostra
        if linha.startswith('mostra '):
            args = linha[7:].strip()
            self.processar_mostra(args)
            return
        
        # Comando definir
        if linha.startswith('definir '):
            self.processar_definir(linha[8:])
            return
        
        # Comando funcao
        if linha.startswith('funcao '):
            self.processar_funcao(linha)
            return
        
        # Verifica se é uma chamada de função personalizada
        palavras = linha.split()
        if palavras and palavras[0] in self.funcoes_usuario:
            self.processar_chamada_funcao(linha)
            return
        
        # Comando se/entao/senao
        if linha.startswith('se '):
            self.processar_se(linha)
            return
            
        # Comando para/de/ate
        if linha.startswith('para '):
            self.processar_para(linha)
            return
            
        # Comando enquanto
        if linha.startswith('enquanto '):
            self.processar_enquanto(linha)
            return
        
        # Outros comandos
        partes = linha.split(' ', 1)
        comando = partes[0]
        
        if comando in self.funcoes_builtin and len(partes) > 1:
            args = partes[1]
            if comando == 'esperar':
                self._esperar(float(args))
            elif comando == 'limpar':
                self._limpar()
    
    def processar_mostra(self, args):
        """Processa comando mostra com múltiplos argumentos"""
        # Se a linha contém 'calcular', processa de forma especial
        if 'calcular ' in args:
            # Divide a linha em partes, preservando o comando calcular
            partes = []
            resto = args
            
            while 'calcular ' in resto:
                antes, depois = resto.split('calcular ', 1)
                if antes.strip():
                    # Processa as partes antes do calcular
                    partes.extend(self.dividir_argumentos(antes.strip()))
                
                # Encontra o fim da expressão calcular
                expressao = ""
                i = 0
                parenteses = 0
                aspas = False
                char_aspas = None
                
                while i < len(depois):
                    char = depois[i]
                    if not aspas and char in ['"', "'"]:
                        aspas = True
                        char_aspas = char
                        if expressao:  # Se já temos expressão, para aqui
                            break
                    elif aspas and char == char_aspas:
                        aspas = False
                        char_aspas = None
                        if expressao:  # Se já temos expressão, para aqui
                            break
                    elif not aspas and char == '(':
                        parenteses += 1
                    elif not aspas and char == ')':
                        parenteses -= 1
                    elif not aspas and char == ' ' and parenteses == 0:
                        # Verifica se o próximo token é uma string ou operador
                        proximo = depois[i+1:].lstrip()
                        if proximo.startswith('"') or proximo.startswith("'"):
                            break
                        elif not proximo or proximo[0] in '+-*/=<>!':
                            break
                    
                    expressao += char
                    i += 1
                
                # Calcula a expressão
                resultado = self._calcular(expressao.strip())
                partes.append(str(resultado))
                
                # Continua com o resto
                resto = depois[len(expressao):].strip()
            
            # Adiciona qualquer parte restante
            if resto:
                partes.extend(self.dividir_argumentos(resto))
            
            mostra(' '.join(partes))
        else:
            # Processamento normal
            argumentos = self.dividir_argumentos(args)
            valores = []
            for arg in argumentos:
                if arg.startswith('"') and arg.endswith('"'):
                    valores.append(arg[1:-1])
                elif arg.startswith("'") and arg.endswith("'"):
                    valores.append(arg[1:-1])
                elif arg in self.variaveis:
                    valores.append(str(self.variaveis[arg]))
                else:
                    valores.append(arg)
            
            mostra(' '.join(valores))
    
    def dividir_argumentos(self, texto):
        """Divide texto em argumentos respeitando strings"""
        argumentos = []
        arg_atual = ""
        dentro_string = False
        char_string = None
        
        i = 0
        while i < len(texto):
            char = texto[i]
            
            if not dentro_string and char in ['"', "'"]:
                dentro_string = True
                char_string = char
                arg_atual += char
            elif dentro_string and char == char_string:
                dentro_string = False
                arg_atual += char
                char_string = None
            elif not dentro_string and char == ' ':
                if arg_atual.strip():
                    argumentos.append(arg_atual.strip())
                    arg_atual = ""
            else:
                arg_atual += char
            
            i += 1
        
        if arg_atual.strip():
            argumentos.append(arg_atual.strip())
        
        return argumentos
    
    def processar_definir(self, args):
        """Processa comando definir"""
        partes = args.split(' ', 1)
        if len(partes) < 2:
            mostra("Erro: definir precisa de nome e valor")
            return
        
        nome = partes[0]
        valor_str = partes[1]
        
        # Processa o valor
        if valor_str.startswith('calcular '):
            valor = self._calcular(valor_str[9:])
        elif valor_str.startswith('ler'):
            if len(valor_str) > 3 and valor_str[3] == ' ':
                valor = self._ler(valor_str[4:])
            else:
                valor = self._ler()
        else:
            valor = valor_str
        
        self._definir(nome, valor)
    
    def processar_funcao(self, linha):
        """Processa definição de função"""
        # Formato: funcao nome(param1, param2) ... fim
        # Esta será chamada pelo processamento de blocos
        pass
    
    def processar_chamada_funcao(self, linha):
        """Processa chamada de função"""
        # Formato: nome_funcao arg1 arg2 arg3
        partes = linha.split(' ', 1)
        nome_funcao = partes[0]
        
        argumentos = []
        if len(partes) > 1:
            args_str = partes[1]
            argumentos = self.dividir_argumentos(args_str)
            # Processa cada argumento
            argumentos_processados = []
            for arg in argumentos:
                if arg.startswith('"') and arg.endswith('"'):
                    argumentos_processados.append(arg[1:-1])
                elif arg.startswith("'") and arg.endswith("'"):
                    argumentos_processados.append(arg[1:-1])
                elif arg in self.variaveis:
                    argumentos_processados.append(self.variaveis[arg])
                else:
                    try:
                        # Tenta avaliar como número ou expressão
                        argumentos_processados.append(self._calcular(arg))
                    except:
                        argumentos_processados.append(arg)
            argumentos = argumentos_processados
        
        resultado = self.chamar_funcao(nome_funcao, argumentos)
        return resultado
    
    def processar_se(self, linha):
        """Processa comando se/entao/senao"""
        # Formato: se condicao entao comando [senao comando]
        partes = linha.split(' ')
        if len(partes) < 4 or partes[2] != 'entao':
            mostra("Erro: formato incorreto. Use: se condicao entao comando [senao comando]")
            return
            
        # Extrai a condição (entre 'se' e 'entao')
        idx_entao = linha.find(' entao ')
        condicao = linha[3:idx_entao].strip()
        
        # Extrai o comando após 'entao'
        resto = linha[idx_entao + 6:].strip()
        
        # Verifica se há 'senao'
        if ' senao ' in resto:
            idx_senao = resto.find(' senao ')
            bloco_entao = resto[:idx_senao].strip()
            bloco_senao = resto[idx_senao + 7:].strip()
        else:
            bloco_entao = resto
            bloco_senao = None
            
        # Executa a estrutura condicional
        self._se(condicao, bloco_entao, bloco_senao)
    
    def processar_para(self, linha):
        """Processa comando para/de/ate"""
        # Formato: para variavel de inicio ate fim comando
        partes = linha.split(' ')
        if len(partes) < 7 or partes[2] != 'de' or partes[4] != 'ate':
            mostra("Erro: formato incorreto. Use: para variavel de inicio ate fim comando")
            return
            
        variavel = partes[1]
        inicio = partes[3]
        fim = partes[5]
        comando = ' '.join(partes[6:])
        
        self._para(variavel, inicio, fim, comando)
    
    def processar_enquanto(self, linha):
        """Processa comando enquanto"""
        # Formato: enquanto condicao comando
        partes = linha.split(' ', 2)
        if len(partes) < 3:
            mostra("Erro: formato incorreto. Use: enquanto condicao comando")
            return
            
        condicao = partes[1]
        comando = partes[2]
        
        self._enquanto(condicao, comando)
    
    def executar_linha(self, linha):
        """Executa uma linha de código"""
        try:
            self.parsear_linha(linha)
        except Exception as e:
            mostra(f"Erro: {e}")
    
    def executar_arquivo(self, caminho_arquivo):
        """Executa um arquivo .aprende"""
        try:
            with open(caminho_arquivo, 'r', encoding='utf-8') as arquivo:
                linhas = arquivo.readlines()
                
            # Processa linhas com suporte a blocos indentados
            i = 0
            while i < len(linhas):
                linha = linhas[i].rstrip()
                numero_linha = i + 1
                
                try:
                    # Verifica se é uma estrutura de controle
                    if linha.strip().startswith(('se ', 'para ', 'enquanto ', 'funcao ')):
                        bloco, proxima_linha = self.processar_bloco_indentado(linhas, i)
                        self.executar_estrutura_controle(bloco)
                        i = proxima_linha
                    else:
                        self.executar_linha(linha)
                        i += 1
                except Exception as e:
                    mostra(f"Erro na linha {numero_linha}: {e}")
                    i += 1
        except FileNotFoundError:
            mostra(f"Arquivo não encontrado: {caminho_arquivo}")
        except Exception as e:
            mostra(f"Erro ao executar arquivo: {e}")
    
    def processar_bloco_indentado(self, linhas, inicio):
        """Processa um bloco indentado (se/para/enquanto)"""
        linha_controle = linhas[inicio].strip()
        bloco = [linha_controle]
        
        i = inicio + 1
        while i < len(linhas):
            linha = linhas[i].rstrip()
            if linha.strip() == "":
                i += 1
                continue
            if linha.startswith("    ") or linha.startswith("\t"):
                # Linha indentada, faz parte do bloco
                bloco.append(linha.strip())
            elif linha.strip().startswith("senao"):
                # Linha senao
                bloco.append(linha.strip())
                # Procura linhas indentadas após senao
                i += 1
                while i < len(linhas):
                    linha_senao = linhas[i].rstrip()
                    if linha_senao.strip() == "":
                        i += 1
                        continue
                    if linha_senao.startswith("    ") or linha_senao.startswith("\t"):
                        bloco.append(linha_senao.strip())
                        i += 1
                    else:
                        break
                break
            else:
                # Linha não indentada, fim do bloco
                break
            i += 1
        
        return bloco, i
    
    def executar_estrutura_controle(self, bloco):
        """Executa uma estrutura de controle com bloco"""
        linha_controle = bloco[0]
        comandos = bloco[1:]
        
        if linha_controle.startswith('se '):
            self.processar_se_bloco(linha_controle, comandos)
        elif linha_controle.startswith('para '):
            self.processar_para_bloco(linha_controle, comandos)
        elif linha_controle.startswith('enquanto '):
            self.processar_enquanto_bloco(linha_controle, comandos)
        elif linha_controle.startswith('funcao '):
            self.processar_funcao_bloco(linha_controle, comandos)
    
    def processar_se_bloco(self, linha_se, comandos):
        """Processa se/entao/senao com bloco"""
        # Encontra senao se existir
        idx_senao = -1
        for i, cmd in enumerate(comandos):
            if cmd.startswith('senao'):
                idx_senao = i
                break
        
        if idx_senao >= 0:
            comandos_entao = comandos[:idx_senao]
            comandos_senao = comandos[idx_senao+1:]
        else:
            comandos_entao = comandos
            comandos_senao = []
        
        # Extrai condição
        if ' entao' in linha_se:
            condicao = linha_se[3:linha_se.find(' entao')].strip()
        else:
            condicao = linha_se[3:].strip()
        
        # Executa condição
        if self._calcular(condicao):
            for cmd in comandos_entao:
                self.executar_linha(cmd)
        elif comandos_senao:
            for cmd in comandos_senao:
                self.executar_linha(cmd)
    
    def processar_para_bloco(self, linha_para, comandos):
        """Processa para/de/ate com bloco"""
        # Formato: para variavel de inicio ate fim
        partes = linha_para.split(' ')
        if len(partes) >= 6 and partes[2] == 'de' and partes[4] == 'ate':
            variavel = partes[1]
            inicio = self._calcular(partes[3])
            fim = self._calcular(partes[5])
            
            for i in range(int(inicio), int(fim) + 1):
                self.variaveis[variavel] = i
                for cmd in comandos:
                    self.executar_linha(cmd)
    
    def processar_enquanto_bloco(self, linha_enquanto, comandos):
        """Processa enquanto com bloco"""
        condicao = linha_enquanto[9:].strip()
        
        while self._calcular(condicao):
            for cmd in comandos:
                self.executar_linha(cmd)
    
    def processar_funcao_bloco(self, linha_funcao, comandos):
        """Processa definição de função com bloco"""
        # Formato: funcao nome(param1, param2)
        import re
        match = re.match(r'funcao\s+(\w+)\s*\((.*?)\)', linha_funcao)
        if not match:
            raise Exception("Formato incorreto para função. Use: funcao nome(param1, param2)")
        
        nome_funcao = match.group(1)
        params_str = match.group(2).strip()
        
        # Processa parâmetros
        parametros = []
        if params_str:
            parametros = [p.strip() for p in params_str.split(',') if p.strip()]
        
        # Remove comando 'fim' se existir
        if comandos and comandos[-1].strip() == 'fim':
            comandos = comandos[:-1]
        
        # Define a função
        self.funcoes_usuario[nome_funcao] = {
            'parametros': parametros,
            'corpo': comandos
        }
        
        mostra(f"Função '{nome_funcao}' definida com sucesso!")

# Exemplo de uso
if __name__ == "__main__":
    interpretador = InterpretadorAprende()
    interpretador.executar_arquivo("ola.aprende")