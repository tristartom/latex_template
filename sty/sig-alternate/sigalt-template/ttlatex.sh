PS2PDF_OPTS="-q -sPAPERSIZE=letter -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true"

DVIPS_OPTS="-Pdownload35 -P distiller -q -G0 -tletter" 
#-P cmz

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
config_text='\def\TTSTYLETARGET'"$style_target{}"' ' #don't forget the last ' '

ut=$(awk -F "=" '/^ut=.*/ {print $2}' $config_file)
if [ "$ut" == 'true' ]; then
  config_text="$config_text"' \def\TTUT{} ' #don't forget the last ' '
fi

tome=$(awk -F "=" '/^tome=.*/ {print $2}' $config_file)
if [ "$tome" == 'true' ]; then
  config_text="$config_text"'\def\TTTOME{} '
fi

./ttclean.sh "$filename"
latex "$config_text\input{$filename}" #initial ' ' is not allowed!
bibtex "$filename"
latex "$config_text\input{$filename}"
latex "$config_text\input{$filename}"
dvips $DVIPS_OPTS "$filename" -o "$filename".ps
ps2pdf $PS2PDF_OPTS "$filename".ps "$filename".pdf
pdffonts "$filename".pdf
evince $filename.pdf &
