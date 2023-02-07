yq -p csv -o yaml '.[] | {"player": .player, "hr": .home_runs}' _input.csv
