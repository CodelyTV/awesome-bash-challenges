docker exec -it codely-awesome_bash_challenges-8_2-mariadb mysql -Bse "SELECT CONCAT('{\"id\": \"', id, '\",\"name\":\"', name, '\",\"duration\":\"', duration, '\"}') FROM mooc.courses;"
