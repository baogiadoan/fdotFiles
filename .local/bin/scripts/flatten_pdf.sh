#!/usr/bin/env bash
# https://unix.stackexchange.com/questions/162922/is-there-a-way-to-flatten-a-pdf-image-from-the-command-line

# pdf2ps $1 - | ps2pdf - flattened_$1

# https://unix.stackexchange.com/questions/162922/is-there-a-way-to-flatten-a-pdf-image-from-the-command-line

gs -dSAFER -dBATCH -dNOPAUSE -dNOCACHE -sDEVICE=pdfwrite \
-dPreserveAnnots=false \
-sOutputFile=flat_$1 $1


