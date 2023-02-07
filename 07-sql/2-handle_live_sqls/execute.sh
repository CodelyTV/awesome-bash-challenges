docker exec -it codely-awesome_bash_challenges-7_2-mariadb tail -f ./var/lib/mysql/general.log |
  grep "INSERT INTO courses" |
  awk -F\' '{print "{\"id\":\""$2"\",\"name\":\""$4"\",\"duration\":\""$6"\"}"}'
