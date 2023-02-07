input_file="_input.sql"
processed_elements=0
batch_size=100
tail_value=0
while [ $processed_elements -ne 1 ]; do
  output=$(tail -n +$tail_value "$input_file" | head -$batch_size | awk -F\' '{print $2","$4","$6}')
  echo "$output"
  processed_elements=$(echo "$output" | wc -l)

  tail_value=$((tail_value + batch_size))

  echo
  echo "Total processed: $tail_value"
done
