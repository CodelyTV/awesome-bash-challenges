awk -F, 'NR==1 || $2=="NYA" && $5==2000' _input.csv
