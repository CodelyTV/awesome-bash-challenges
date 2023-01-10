grep -E "(28|29)/Jun" _input.log |
  awk -F'[ "]' '{print substr($4, 1, 18) "\t" tolower($7) "\t" toupper($8)}' |
  sed 's/\[//g' |
  sed 's/:/ /1' |
  sort --reverse
