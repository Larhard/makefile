CONVERT ?= convert
ZIP ?= zip
PDFLATEX ?= pdflatex
SOFFICEFLAGS ?= --headless -env:UserInstallation=file:///tmp/soffice_headless
SOFFICE ?= soffice
CP ?= cp -r

COPY ?= $(CP) $^ $@

%.pdf: %.png
	$(CONVERT) $(CONVERTINPUTFLAGS) $< $(CONVERTOUTPUTFLGAS) $@

%.pdf: %.jpg
	$(CONVERT) $(CONVERTINPUTFLAGS) $< $(CONVERTOUTPUTFLGAS) $@

%.pdf: %.jpeg
	$(CONVERT) $(CONVERTINPUTFLAGS) $< $(CONVERTOUTPUTFLGAS) $@

%.pdf: %.gif
	$(CONVERT) $(CONVERTINPUTFLAGS) $< $(CONVERTOUTPUTFLGAS) $@

%.pdf: %.docx
	$(SOFFICE) $(SOFFICEFLAGS) --convert-to pdf $<

%.pdf: %.doc
	$(SOFFICE) $(SOFFICEFLAGS) --convert-to pdf $<

%.pdf: %.odt
	$(SOFFICE) $(SOFFICEFLAGS) --convert-to pdf $<

%.pdf: %.tex
	$(PDFLATEX) $<
	$(PDFLATEX) $<
	$(PDFLATEX) $<

%.zip:
	$(RM) $@
	$(ZIP) $@ $^

.DEFAULT_GOAL ?= all

include convert.mk
