yq -p csv -o csv 'map(select(.team == "NYA" and .year == 2000))' _input.csv
