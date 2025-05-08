# Proyecto de Sílabos en LaTeX

Este proyecto contiene plantillas LaTeX para la creación de sílabos de cursos académicos de manera profesional y consistente.

## Estructura del Proyecto

```
MALLA_CS/
├── build/           # Archivos generados durante la compilación
├── images/          # Imágenes y logos para los sílabos
├── refs/            # Referencias bibliográficas
├── src/             # Archivos fuente LaTeX
│   ├── algoritmia.tex   # Sílabo para el curso de Introducción a Algoritmos
│   └── template.tex     # Plantilla genérica para nuevos sílabos
├── styles/          # Archivos de estilo LaTeX
│   └── syllabus.sty # Paquete personalizado para sílabos
├── .gitignore       # Archivos ignorados por git
├── Makefile         # Reglas para compilar los documentos
└── README.md        # Este archivo
```

## Requisitos

### Instalación de dependencias

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install texlive-full make latexmk biber texlive-latex-extra texlive-lang-spanish cm-super
```

#### Fedora
```bash
sudo dnf install texlive-scheme-full make latexmk texlive-babel-spanish texlive-hyphen-spanish
```

#### Arch Linux
```bash
sudo pacman -S texlive-most texlive-lang biber
```

## Compilación de Documentos

### Compilar todos los documentos
```bash
make
# o
make docs
```

### Ver la lista de documentos disponibles
```bash
make list
```

### Compilar un documento específico
```bash
make algoritmia  # Para compilar el sílabo de Introducción a Algoritmos
make template    # Para compilar la plantilla genérica
```

### Compilación con referencias bibliográficas
```bash
make bib
```

### Limpiar archivos temporales
```bash
make clean      # Elimina archivos temporales pero mantiene PDFs
make cleanall   # Elimina archivos temporales y PDFs
```

## Creación de un Nuevo Sílabo

1. Copia `src/template.tex` a `src/nombre_curso.tex`
2. Edita los campos necesarios para tu curso
3. Compila con `make nombre_curso`

El sistema reconocerá automáticamente el nuevo archivo y lo agregará a la lista de documentos compilables.

## Personalización

El archivo `styles/syllabus.sty` contiene definiciones de comandos y estilos que puedes personalizar según tus necesidades. Los sílabos utilizan comandos como:

```latex
\universidad{NOMBRE DE LA UNIVERSIDAD}
\facultad{NOMBRE DE LA FACULTAD}
\departamento{NOMBRE DEL DEPARTAMENTO}
\curso{NOMBRE DEL CURSO}
\codigo{CÓDIGO DEL CURSO}
\semestre{AÑO-SEMESTRE}
```

## Contribución

Si deseas contribuir a este proyecto:

1. Haz un fork del repositorio
2. Crea una rama para tu característica (`git checkout -b feature/nueva-caracteristica`)
3. Haz commit de tus cambios (`git commit -am 'Añade nueva característica'`)
4. Envía un push a la rama (`git push origin feature/nueva-caracteristica`)
5. Abre un Pull Request

## Solución de problemas comunes

### Fuentes faltantes
Si aparece un error sobre fuentes faltantes, asegúrate de tener instalado el paquete `cm-super` (en sistemas basados en Debian/Ubuntu) o el equivalente en tu distribución.

### Problemas con caracteres especiales
Verifica que estés usando codificación UTF-8 en tus archivos .tex y que hayas cargado los paquetes apropiados para soporte de idiomas.

## Licencia

Este proyecto está disponible para su uso y modificación libre.

## Contacto

Para preguntas o sugerencias, contacta a [tu nombre/email].
