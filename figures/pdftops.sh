#!/bin/bash
if [ $# -ne 1 ]; then
    echo "util: to remove boundingbox"
    echo "example: ./pdftops.sh file_name.pdf"
    exit 1
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Ubuntu
    pdftops -eps "$1" #$1 is the pdf file to be converted.
else 
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
   pdf2ps  "$1" #$1 is the pdf file to be converted.
  fi
fi

