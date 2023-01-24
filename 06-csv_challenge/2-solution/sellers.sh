yq -p csv -o csv 'map({"id": .seller_id, "name": .seller_name})' _input.csv | grep -Ev "^," | sort -ur
