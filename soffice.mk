SOFFICEFLAGS ?= --headless -env:UserInstallation=file:///tmp/soffice_headless
SOFFICE ?= soffice

SOFFICE_CONVERT_TO_PDF = $(SOFFICE) $(SOFFICEFLAGS) --convert-to pdf

%.pdf: %.docx
	$(SOFFICE_CONVERT_TO_PDF) $<

%.pdf: %.doc
	$(SOFFICE_CONVERT_TO_PDF) $<

%.pdf: %.odt
	$(SOFFICE_CONVERT_TO_PDF) $<

%.pdf: %.txt
	$(SOFFICE_CONVERT_TO_PDF) $<
