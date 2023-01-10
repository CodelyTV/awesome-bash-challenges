# 🔥 Reto
* Queremos saber quién es la persona que más colabora en nuestro repo de `dotly`
* Para ello, formatea el el json tal que:
```json
[
  {
    "user": "$GITHUB_USER$",
    "total_prs": $NUM_PRS_USER$,
    "prs_title": [
      "$PR_1_TITLE$",
      "$PR_2_TITLE$",
      …
    ]
  },
  …
```

Donde:
* `$GITHUB_USER$` es el nombre de usuario de GitHub
* `$NUM_PRS_USER$` es el total de PRs que ese usuario ha hecho
* `$PR_NUM_TITLE` tiene el formato de: `created_at: title`

* Todo ordenado de mayor a menor número de PRs
* Filtrando para que sólo aparezcan quienes han hecho más de 1 PR
