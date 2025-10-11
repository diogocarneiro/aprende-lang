#!/usr/bin/env python3
"""
Aprende Language - CLI Principal
Ponto de entrada principal para a linguagem Aprende
"""

import sys
import os

# Adiciona o diretório src ao path para importações
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from cli import main

if __name__ == "__main__":
    main()