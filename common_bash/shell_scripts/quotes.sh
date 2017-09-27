#!/bin/bash

var="'(]\\{}\$&\""
echo $var        # '(]\{}$"
echo "$var"      # '(]\{}$"     Doesn't make a difference.

echo

IFS='\'
echo $var        # '(] {}$"     \ converted to space. Why?
echo "$var"      # '(]\{}$"


echo "Why can't I write 's between single quotes"

echo

# The single quote  method.
echo 'Why can't I write 's between single quotes'
echo
echo 'Why can'\''t I write '"'"'s between single quotes'

exit 0
