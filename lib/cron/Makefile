#
# Makefile for HomeMaker Crontab
#

default: build

TOP := $(shell cd ../.. && pwd)
BIN := $(TOP)/bin

# If crontab isn't installed, fake success with 'true' and do it in a
# POSIX-y way.

ifndef HM_NO_CRONTAB

  CRONTAB_PROG := $(shell echo $$PATH \
	| tr ':' '\n' \
	| sed -e 's|$$|/crontab|g' \
	| xargs -n 1 ls 2>/dev/null \
	| head -1)

  CRONTAB := crontab
  $(CRONTAB): $(CRONTAB).m4
	m4 -D '__BIN__=$(BIN)' "$<" > $@
  TO_CLEAN += $(CRONTAB)

endif


build: $(CRONTAB)

TAG=homemaker


uninstall:
ifneq ($(CRONTAB_PROG),)
	$(CRONTAB_PROG) -l \
	| sed -e "/^#BEGIN-$(TAG)/,/^#END-$(TAG)/d" \
	| $(CRONTAB_PROG) -
endif

install: uninstall $(CRONTAB)
ifneq ($(CRONTAB_PROG),)
	$(CRONTAB_PROG) -l \
	| ( \
		cat \
		&& echo "#BEGIN-$(TAG)" \
		&& cat "$(CRONTAB)" \
		&& echo "#END-$(TAG)" \
	  ) \
	| $(CRONTAB_PROG) -
endif


clean:
	rm -rf $(TO_CLEAN) *~
