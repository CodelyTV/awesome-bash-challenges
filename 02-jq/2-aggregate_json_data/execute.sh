jq '[.[] | {titulo: (.emoji + " " + .title), total_categorias: .categories | length , longitud_titulo: .title | length}]' "$PWD/_input.json"
