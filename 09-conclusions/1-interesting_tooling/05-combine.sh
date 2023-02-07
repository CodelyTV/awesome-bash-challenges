mlr -csv sort -nr home_runs _input.csv | awk -F, '{print $3","$8}' | uplot bar -H -d, -t "Home runs"
