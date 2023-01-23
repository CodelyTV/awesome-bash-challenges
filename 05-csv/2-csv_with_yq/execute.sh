yq -p csv -o csv '[.[] | select(.team == "NYA") | select(.year == 2000)]' _input.csv
