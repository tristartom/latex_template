#!/usr/bin/env bash

read -p "To check spell in main.pdf?"

#./tt_sh/spellcheck.sh

read -p "To check gramma in main.pdf?"

#open -b com.adobe.Reader main.pdf &

pdfinfo main.pdf | grep Author
ls -l main.pdf
read -p "Check anonymous"

#cat topic1_sgx_nsf17/pd_v1.tex \
mutool draw -F text main.pdf 2>/dev/null \
| grep --color=auto -E \
    "e\.g\. |i\.e\. \
     |XXX|YYY|ZZZ|requires? to \
     |\?\?|entail? to\
     |[Nn]ote [^t]|can not\
     |most of|are originally\
     |out of the scope\
     |f yes,\
     |non-exist \
     |etc[\s,]|on-going|to develop\
     |two fold|planed|at expenses|[I|i]n the below\
     |\[\?\]|up-bound|ref{\
     |\[\?|\?\]|,\?|\
     |In the end of\
     |in comparison with\
     |is about\
     |Etheruem\
"
  
read -p "To check terminology is properly introduced first time used? [y|N]"

mutool draw -F text main.pdf 2>/dev/null \
| grep --color=auto -E \
    " [A-Z0-9]* \
"  

# -> compared to
# -> At the end of
# is about -> is

# require to do -> require doing
# note -> note that
# can not -> cannot
# most of -> most
# are originally -> were originally
# two fold -> two-fold
# planed -> planned
# at expenses -> at expense
# In the below -> Below
# dependent to -> dependent on
# etc -> etc.
# entails? to do -> entail doing
# on-going  -> ongoing
# to develop -> to be developed

read -p "To check sentences in section heading are self-contained?"

read -p "To re-read titles of sections and paragraphs: making sense?"


