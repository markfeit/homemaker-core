#
# Makefie for ~/bin
#

-include Makefile-local

ifndef DEST_DIR
  DEST_DIR := $(HOME)
endif

NOARCH := noarch
BINDIR := $(DEST_DIR)/bin
NOARCHDIR := $(BINDIR)/$(NOARCH)
ARCHDIR := $(BINDIR)/$(shell uname -m)


defaut: build


build:
	@echo Nothing to do here.


$(ARCHDIR):
	mkdir -p '$@'


$(NOARCHDIR)::
	mkdir -p '$@'
	rsync --archive '$(NOARCH)/' '$@'

ifndef INERT
install: $(NOARCHDIR) $(ARCHDIR)
else
install:
	@echo "Inert; not installing in $(DEST_DIR)."
endif

clean:
	rm -rf $(TO_CLEAN)
