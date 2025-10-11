# Instrução para criar o ícone ICO

Para converter o SVG em ICO para usar no Windows, podes usar uma ferramenta online como:
- https://convertio.co/svg-ico/
- https://cloudconvert.com/svg-to-ico

Ou usar o ImageMagick no terminal:
```bash
magick aprende-icon.svg -resize 256x256 aprende-icon.ico
```

O ficheiro aprende-icon.ico deve ser colocado na pasta raiz do projeto.