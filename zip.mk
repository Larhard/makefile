ZIP ?= zip -r

%.zip:
	$(RM) $@
	$(ZIP) $@ $^ $(ZIPFLAGS)
