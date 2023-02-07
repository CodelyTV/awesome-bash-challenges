awk -F, '{print $3","$8}' _input.csv | uplot bar -H -d, -t "Home runs"
