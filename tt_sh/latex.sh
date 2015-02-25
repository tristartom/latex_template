#!/usr/bin/env bash

#-P cmz

filename=$(echo $1 | awk 'substr($0,length($0))=="." {print substr($0, 1, length($0) - 1)}')
if [ "$filename" == '' ]; then
    filename=$1
fi
echo "filename=$filename"

./tt_sh/clean.sh "$filename"
latex "$filename"
bibtex "$filename"
latex "$filename"
latex "$filename"
dvips "$filename" -o "$filename".ps
ps2pdf "$filename".ps "$filename".pdf
evince $filename.pdf &
