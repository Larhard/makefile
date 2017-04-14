LATEX ?= latex
DVIPDF ?= dvipdf
DVIPNG ?= dvipng

LATEXFLAGS ?= -halt-on-error -interaction=batchmode
DVIPDFFLAGS ?=
DVIPNGFLAGS ?=

%.dvi: %.tex
	$(LATEX) $(LATEXFLAGS) $<
	$(LATEX) $(LATEXFLAGS) $<
	$(LATEX) $(LATEXFLAGS) $<

%.pdf: %.dvi
	$(DVIPDF) $(DVIPDFFLAGS) $<

%.png: %.dvi
	$(DVIPNG) $(DVIPNGFLAGS) $<
