PDFLATEX ?= pdflatex

LATEXFLAGS ?= -halt-on-error -interaction=batchmode

%.pdf: %.tex
	$(PDFLATEX) $(LATEXFLAGS) $<
	$(PDFLATEX) $(LATEXFLAGS) $<
	$(PDFLATEX) $(LATEXFLAGS) $<
