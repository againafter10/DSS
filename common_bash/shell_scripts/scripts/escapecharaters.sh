#!/bin/bash
# escaped.sh: escaped characters

echo; echo

# Escaping a newline.
# ------------------

echo ""

echo "This will print
as two lines."
# This will print
# as two lines.

echo "This will print \
as one line."
# This will print as one line.

echo; echo

echo "============="


echo "\v\v\v\v"      # Prints \v\v\v\v literally.
# Use the -e option with 'echo' to print escaped characters.
echo "============="
echo "VERTICAL TABS"
echo  "\vxx\vxx\vxx\vxx\vxxxx\vxx\vxx\vxx\vxx"   # Prints 4 vertical tabs.
echo "=============="
echo "=============="
echo "\txxxx\vxxxx\vxxxx\vxxxx"
