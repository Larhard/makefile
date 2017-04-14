SOFFICEFLAGS ?= --headless -env:UserInstallation=file:///tmp/soffice_headless
SOFFICE ?= soffice

%.pdf: %.docx
	$(SOFFICE) $(SOFFICEFLAGS) --convert-to pdf $<

%.pdf: %.doc
	$(SOFFICE) $(SOFFICEFLAGS) --convert-to pdf $<

%.pdf: %.odt
	$(SOFFICE) $(SOFFICEFLAGS) --convert-to pdf $<
