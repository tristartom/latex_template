#!/usr/bin/env bash

export TEXCONFIG=.:$TEXCONFIG

filename=$(echo $1 | awk 'substr($0,length($0))=="." {print substr($0, 0, length($0) - 1)}')
if [ "$filename" == '' ]; then
    filename=$1
fi
echo "filename=$filename"

config_file=config.properties

target=$(awk -F "=" '/^target=.*/ {print $2}' $config_file)
config_text='\def\TTTARGET'"$target{}"' ' #don't forget the last ' '

style_target=$(awk -F "=" '/^style_target=.*/ {print $2}' $config_file)
config_text="$config_text"'\def\TTSTYLETARGET'"$style_target{}"' ' #don't forget the last ' '

ut=$(awk -F "=" '/^ut=.*/ {print $2}' $config_file)
if [ "$ut" == 'true' ]; then
  config_text="$config_text"'\def\TTUT{} ' #don't forget the last ' '
fi

utbluff=$(awk -F "=" '/^utbluff=.*/ {print $2}' $config_file)
if [ "$utbluff" == 'true' ]; then
  config_text="$config_text"'\def\TTUTBLUFF{} ' #don't forget the last ' '
fi

tome=$(awk -F "=" '/^tome=.*/ {print $2}' $config_file)
if [ "$tome" == 'true' ]; then
  config_text="$config_text"'\def\TTTOME{} '
fi


./tt_sh/clean.sh "$filename"
latex "$config_text\input{$filename}" #initial ' ' is not allowed!
if [ $? -ne 0 ]; then exit; fi 

bibtex "$filename"
latex "$config_text\input{$filename}"
if [ $? -ne 0 ]; then exit; fi 
latex "$config_text\input{$filename}"
if [ $? -ne 0 ]; then exit; fi 
dvips "$filename" -o "$filename".ps
ps2pdf "$filename".ps "$filename".pdf

newfileName=$filename

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Ubuntu
    evince $newfileName.pdf &
else 
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    open -a Preview $newfileName.pdf &
  fi
fi

