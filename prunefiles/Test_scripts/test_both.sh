#!/bin/sh

prunefiles -n -v 5 -f findfiles -l /tmp/prunefiles_findfiles.out prunefiles_args_findfiles
prunefiles -n -v 5 -f find      -l /tmp/prunefiles_find.out      prunefiles_args_find

wc -l prunefiles_findfiles.ref prunefiles_find.ref /tmp/prunefiles_findfiles.out /tmp/prunefiles_find.out

diff prunefiles_findfiles.ref /tmp/prunefiles_findfiles.out
diff prunefiles_find.ref      /tmp/prunefiles_find.out
