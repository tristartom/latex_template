#!/usr/bin/env bash
if [ $# -ne 0 ]; then
  echo "format: ./tt_sh/spellcheck.sh"
  exit 1
fi

#find all .tex file except ones under sty directory
find . -path "./pasttext" -prune -o -path "./sty" -prune -o -name "*.tex" -print | while read aline; do
  read -p "spellcheck file $aline [Y|n]: " sth < /dev/tty
  if [ ! "$sth" == 'n' ]; then
    aspell -c $aline  < /dev/tty
  fi
done
