SRC = report

.PHONY: all open compile clean clean_trash

all: open

open: compile
	$(info [*] Opening PDF)
	@mupdf $(SRC).pdf

compile: $(SRC).pdf clean_trash

$(SRC).pdf: $(SRC).tex
	$(info [*] Compiling document, please wait)
	@latexmk -pdf $(SRC)

clean: clean_trash
	$(info [*] Removing compiled PDF document)
	@rm -rf $(SRC).pdf

clean_trash:
	$(info [*] Removing temporary files generated while compiling document)
	@rm -rf *.aux *.log *.bbl *.blg *.bcf *.fls *.run.xml *.fdb_latexmk
