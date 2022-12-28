jq '[.[] | {titulo: .title, emoji}]' "$PWD/_input.json"
