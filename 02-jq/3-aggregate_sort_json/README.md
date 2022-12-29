# 🔥 Reto
* Queremos saber qué emojis estamos repitiendo en los cursos
* Para ello, formatea el el json tal que:
```json
[
  {
    "emoji": $EMOJI,
    "total": $TOTAL,
    "courses": [
      $COURSE_1_TITLE,
      $COURSE_2_TITLE,
      …
    ]
  },
  …
]
```
Donde:
* `$EMOJI` es el emoji
* `$TOTAL` es el total de veces que aparece ese emoji
* `$COURSE_TITLES` es un array con todos los títulos de los cursos

* Todo ordenado por emojis que más se repiten
* Filtrando para que sólo aparezcan los que tienen duplicados
