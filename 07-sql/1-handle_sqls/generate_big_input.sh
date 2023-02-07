input_file="_input.sql"
output_file="_input2.sql"
cp "$input_file" "$output_file"

times_to_execute=300
while [ $times_to_execute -ne 0 ]; do

	cat "$input_file" >> "$output_file"

	times_to_execute=$((times_to_execute - 1))
done
