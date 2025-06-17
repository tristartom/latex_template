if [ $# -ne 1 ]; then
    echo "util: to crop pdf"
    echo "example: ./croppdf.sh file_name.pdf"
    exit 1
fi

file_name=$1
echo "pdfcrop, crop pdf"
start=$(date)
pdfcrop --margins '0 20 0 10' --clip $file_name $file_name
end=$(date)
#evince $file_name &
echo -e "from:$start\nto:$end"
./pdftops.sh $file_name
