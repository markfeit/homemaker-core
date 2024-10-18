#
# Top-Level Makefile for Homemaker
#

default: build


ifndef DEST_DIR
export DEST_DIR := $(HOME)
endif

TOP := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
BIN := $(TOP)/bin
PRIVATE := $(TOP)/private


HOME_PROTOTYPE := home
$(HOME_PROTOTYPE):
	@echo
	@echo "WARNING: No '$(HOME_PROTOTYPE)' directory present."
	@echo "No files will be built or installed."
	@echo


MACROS := macros.m4
export M4_MACROS := $(TOP)/$(MACROS)
$(MACROS)::
	$(BIN)/build-macros > "$@"
TO_CLEAN += $(MACROS)


build install uninstall: $(HOME_PROTOTYPE) $(MACROS)
	$(BIN)/build-all "$(TOP)" "$@"


clean:
	$(BIN)/build-all "$(TOP)" "$@"
	rm -rf $(TO_CLEAN)
	find . -name "*~" | xargs rm -rf
