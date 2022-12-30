jq '[. | group_by(.emoji) | map({emoji: .[0].emoji, total: length, courses: map(.title)}) | sort_by(.total) | reverse | .[] | select(.total | length > 1)]' "$PWD/_input.json"
