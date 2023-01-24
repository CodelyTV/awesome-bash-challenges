yq -p csv -o csv '[map(.categories)[] | .[] | {"category": .}]' _input.csv | sort -ur
