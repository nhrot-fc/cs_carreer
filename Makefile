# Makefile para compilar documentos LaTeX
# Definición de variables
TEX = pdflatex
BIBTEX = bibtex
SRC_DIR = src
BUILD_DIR = build
# Encuentra automáticamente todos los archivos .tex
TEX_FILES = $(wildcard $(SRC_DIR)/*.tex)
# Extrae los nombres base sin la extensión
DOCS = $(basename $(notdir $(TEX_FILES)))
FLAGS = -output-directory=$(BUILD_DIR) -interaction=nonstopmode

# Asegurarse de que build exista
$(shell mkdir -p $(BUILD_DIR))

# Regla por defecto: compilar todos los documentos
all: docs

# Compilar todos los documentos
docs: $(DOCS)

# Regla genérica para compilar cualquier documento
$(DOCS): %: $(SRC_DIR)/%.tex
	@echo "Compilando $<..."
	$(TEX) $(FLAGS) $<
	$(TEX) $(FLAGS) $<
	@echo "Compilación de $@ completada"
	@echo "El PDF se encuentra en $(BUILD_DIR)/$@.pdf"

# Compilación con bibliografía (cuando sea necesario)
bib: $(BUILD_DIR)/%.aux
	$(BIBTEX) $(BUILD_DIR)/$*.aux
	$(TEX) $(FLAGS) $(SRC_DIR)/$*.tex
	$(TEX) $(FLAGS) $(SRC_DIR)/$*.tex
	@echo "Compilación con bibliografía completada"

# Limpiar archivos temporales
clean:
	rm -f $(BUILD_DIR)/*.aux $(BUILD_DIR)/*.log $(BUILD_DIR)/*.toc \
		$(BUILD_DIR)/*.lof $(BUILD_DIR)/*.lot $(BUILD_DIR)/*.out \
		$(BUILD_DIR)/*.fls $(BUILD_DIR)/*.fdb_latexmk $(BUILD_DIR)/*.synctex.gz \
		$(BUILD_DIR)/*.bbl $(BUILD_DIR)/*.blg

# Limpiar todo (incluyendo PDFs)
cleanall: clean
	rm -f $(BUILD_DIR)/*.pdf

# Imprimir la lista de documentos disponibles
list:
	@echo "Documentos disponibles: $(DOCS)"

# Mantener archivo .gitkeep en build
.PHONY: all docs $(DOCS) bib clean cleanall list