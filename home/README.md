# Sample Homemaker Home Directory

This directory contains a sample structure for a few files and
directories to be installed in `$HOME`.

All of the directories in this sample have `INERT` set in their
`Makefile-local` (see below) to prevent accidential replacement of
files in the invoker's home directory.  Remove these when building for
real use.

**Note:** Directories with names matching `dot-*` will have `dot-`
replaced with a period (e.g., `dot-bashrc` will become `.bashrc`) when
their products are installed.


## `homemaker-type`

If this file exists, it directs Homemaker to use a standard Makefile
from its internal library instead of any `Makefile` that exists in the
same directory.  The file contains a single line that tells Homemaker
which one to use:

 * `file` - Processes all files matchin `*.m4` in lexically-sorted
   order and concatenates the results into a single file that will be
   installed in `$HOME` relative to the directory name.  E.g., the
   file generated in `dot-bashrc` will end up in `$HOME/.bashrc` and
   one in `dot-ssh/config` will end up in `$HOME/.ssh/config`.

 * `dir` - Indicates that the directory contains one or more
   subdirectories which should be processed recursively, ultimately
   having `file` types at the leaves.


## `Makefile-local`

Any local Makefile customizations to Homemaker-installed Makefiles go
in this file.  Typical customizations:

 * `MODE` - Installed file mode (e.g., SSH-related files should have
   theirs set to `400`).

 * `INERT` - Prevents installation in the invoking user's home
   directory.  **Note that everything in this sample has this set.
   Remove it when converting this for actual use.**
