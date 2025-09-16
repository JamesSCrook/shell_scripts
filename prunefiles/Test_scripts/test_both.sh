#!/bin/sh

rm -f /tmp/prunefiles_findfiles.out /tmp/prunefiles_find.out

cp -p prunefiles_args_findfiles_1	prunefiles_args_findfiles_not_me
sudo chown bin:bin			prunefiles_args_findfiles_not_me

cp prunefiles_args_findfiles_1		prunefiles_args_findfiles_no_read
chmod 222				prunefiles_args_findfiles_no_read

cp prunefiles_args_findfiles_1		prunefiles_args_findfiles_insecure
chmod 666				prunefiles_args_findfiles_insecure

touch					prunefiles_args_findfiles_empty
chmod 644				prunefiles_args_findfiles_empty

prunefiles -n -v 5 -f findfiles -l /tmp/prunefiles_findfiles.out prunefiles_args_findfiles* nOpE
prunefiles -n -v 5 -f find      -l /tmp/prunefiles_find.out      prunefiles_args_find

wc -l prunefiles_findfiles.ref /tmp/prunefiles_findfiles.out prunefiles_find.ref /tmp/prunefiles_find.out

for FILENAME in prunefiles_findfiles prunefiles_find; do
    CMD="diff $FILENAME.ref /tmp/$FILENAME.out"
    echo "RUNNING [$CMD]" '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    $CMD
    echo
    echo
    echo
done

rm -f prunefiles_args_findfiles_not_me prunefiles_args_findfiles_no_read prunefiles_args_findfiles_insecure prunefiles_args_findfiles_empty

exit 0

### Sample output should only have "obvious" differences (timestamps, username, etc.), like this:
  1061 prunefiles_findfiles.ref
  1061 /tmp/prunefiles_findfiles.out
  1019 prunefiles_find.ref
  1019 /tmp/prunefiles_find.out
  4160 total
RUNNING [diff prunefiles_findfiles.ref /tmp/prunefiles_findfiles.out] &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
1c1
< [0] ===================== Mon 15 Sep 2025 14:31:07 AEST =====================
---
> [0] ===================== Mon 15 Sep 2025 14:32:37 AEST =====================
1034c1034
< [0]    === details: -rw-r--r--. 1 jc jc 0 Sep 15 14:31 prunefiles_args_findfiles_empty
---
> [0]    === details: -rw-r--r--. 1 jc jc 0 Sep 15 14:32 prunefiles_args_findfiles_empty
1040c1040
< [0]    === details: -rw-rw-rw-. 1 jc jc 3090 Sep 15 14:31 prunefiles_args_findfiles_insecure
---
> [0]    === details: -rw-rw-rw-. 1 jc jc 3090 Sep 15 14:32 prunefiles_args_findfiles_insecure
1047c1047
< [0]    === details: --w--w--w-. 1 jc jc 3090 Sep 15 14:31 prunefiles_args_findfiles_no_read
---
> [0]    === details: --w--w--w-. 1 jc jc 3090 Sep 15 14:32 prunefiles_args_findfiles_no_read
1061c1061
< [0]    ===================== Mon 15 Sep 2025 14:31:08 AEST =====================
---
> [0]    ===================== Mon 15 Sep 2025 14:32:38 AEST =====================



RUNNING [diff prunefiles_find.ref /tmp/prunefiles_find.out] &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
1c1
< [0] ===================== Mon 15 Sep 2025 12:15:43 AEST =====================
---
> [0] ===================== Mon 15 Sep 2025 14:32:38 AEST =====================
1019c1019
< [0]    ===================== Mon 15 Sep 2025 12:15:44 AEST =====================
---
> [0]    ===================== Mon 15 Sep 2025 14:32:39 AEST =====================



