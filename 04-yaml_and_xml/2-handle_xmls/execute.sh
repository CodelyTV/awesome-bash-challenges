yq -o=xml '. | {
  "+p_xml": "version=\"1.0\" encoding=\"UTF-8\"",
  "doctrine-mapping": {
    "entity": {
      "+@name": (. | keys)[0],
      "+@table": (map(.table))[0],
      "id": {
        "+@name": ((map(.id))[0] | keys)[0],
        "+@type": (map((map(.id))[0]))[0].type,
        "+@column": (map((map(.id))[0]))[0].column,
        "+@length": (map((map(.id))[0]))[0].length
      }
    }
  }
}' _input.orm.yaml
