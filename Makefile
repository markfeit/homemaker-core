#
# Top-Level Makefile for Homemaker
#

default: build


ifndef DEST_DIR
export DEST_DIR := $(HOME)
endif

TOP := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
BIN := $(TOP)/bin
LIB := $(TOP)/lib


HOME_PROTOTYPE := home
$(HOME_PROTOTYPE):
	@echo
	@echo "WARNING: No '$(HOME_PROTOTYPE)' directory present."
	@echo "No files will be built or installed."
	@echo

WORK := work
$(WORK):: FORCE
	mkdir -p "$@"
	(cd $(HOME_PROTOTYPE) && tar cf - .) \
		| (cd "$@" && tar xpf -)
TO_CLEAN += $(WORK)


MACROS := macros.m4
export M4_MACROS := $(TOP)/$(MACROS)
$(MACROS)::
	$(BIN)/build-macros > "$@"
TO_CLEAN += $(MACROS)


build install uninstall: $(WORK) $(MACROS)
	$(BIN)/build-all "$(WORK)" "${LIB}/makefiles" "$@"


clean:
	rm -rf $(TO_CLEAN)
	find . -name "*~" | xargs rm -rf

FORCE::
	@true
