import unittest
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
from tempfile import NamedTemporaryFile

from src.interpretador import InterpretadorAprende


class ControlStructureTests(unittest.TestCase):
    """Testes para loops aninhados e blocos senao encadeados."""

    def _executar_programa(self, codigo: str):
        interpretador = InterpretadorAprende()
        with NamedTemporaryFile('w', delete=False, suffix='.aprende', encoding='utf-8') as temporario:
            temporario.write(codigo)
            caminho = Path(temporario.name)

        saida = StringIO()
        try:
            with redirect_stdout(saida):
                interpretador.executar_arquivo(str(caminho))
        finally:
            caminho.unlink(missing_ok=True)

        # remove linhas vazias geradas por mostra()
        return [linha.strip() for linha in saida.getvalue().splitlines() if linha.strip()]

    def test_loops_aninhados(self):
        codigo = """
        definir linha 1
        enquanto linha menor_igual 2
            definir coluna 1
            enquanto coluna menor_igual 2
                mostra "linha " linha " coluna " coluna
                definir coluna calcular coluna + 1
            definir linha calcular linha + 1
        """

        linhas = self._executar_programa(codigo)
        esperado = [
            "linha  1  coluna  1",
            "linha  1  coluna  2",
            "linha  2  coluna  1",
            "linha  2  coluna  2",
        ]
        self.assertEqual(linhas, esperado)

    def test_senao_encadeado(self):
        codigo = """
        definir numero 2
        se numero igual 1 entao
            mostra "ramo 1"
        senao
            se numero igual 2 entao
                mostra "ramo 2"
            senao
                mostra "ramo 3"
        """

        linhas = self._executar_programa(codigo)
        self.assertEqual(linhas, ["ramo 2"])

    def test_funcao_com_estruturas_aninhadas(self):
        codigo = """
        funcao analisar(valor)
            definir total valor
            enquanto total maior 0
                se total maior 1 entao
                    mostra "maior que um: " total
                senao
                    mostra "ultimo passo: " total
                definir total calcular total - 1
            para indice de 1 ate 2
                mostra "indice " indice
            retorna nada
        fim

        analisar 3
        """

        linhas = self._executar_programa(codigo)
        if linhas and linhas[0].startswith("Função '"):
            linhas = linhas[1:]

        esperado = [
            "maior que um:  3",
            "maior que um:  2",
            "ultimo passo:  1",
            "indice  1",
            "indice  2",
        ]
        self.assertEqual(linhas, esperado)

    def test_funcao_sem_fim_dispara_erro(self):
        codigo = """
        funcao incompleta()
            mostra "oi"
        mostra "fora"
        """

        linhas = self._executar_programa(codigo)
        self.assertTrue(linhas)
        self.assertIn("Função 'incompleta' precisa terminar com 'fim'", linhas[0])


if __name__ == "__main__":
    unittest.main()
