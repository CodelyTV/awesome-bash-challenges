docker exec -it codely-awesome_bash_challenges-8_2-mariadb mysql -Bse "SELECT * FROM mooc.courses;" |
  awk '{print "{\"id\":\""$1"\",\"name\":\""$2"\",\"duration\":\""$3"\"}"}'
