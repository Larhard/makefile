CONVERT ?= convert

%.pdf:
	$(CONVERT) $(CONVERTINPUTFLAGS) $^ $(CONVERTOUTPUTFLGAS) $@

%.pdf: %.jpg
%.pdf: %.jpeg
%.pdf: %.gif
%.pdf: %.gif
