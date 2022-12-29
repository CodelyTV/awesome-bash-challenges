jq '[.[] | {titulo: (.emoji + " " + .title)} | select(.titulo | length > 50)]' "$PWD/_input.json"
