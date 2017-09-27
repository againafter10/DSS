#!/bin/bash
# shft.sh: Using 'shift' to step through all the positional parameters

#             sh shft.sh a b c def 23 skidoo

until [ -z "$1" ]  # Until all parameters used up . . .
do
  echo  "$1 "
  shift 2
done

echo               # Extra line feed.

exit 0

