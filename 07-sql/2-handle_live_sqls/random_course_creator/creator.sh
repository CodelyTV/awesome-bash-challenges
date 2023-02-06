function random_course_name() {
	shuf -n4 ./courses_words.txt | xargs echo
}

function random_duration() {
	echo $((RANDOM % 50 + 1)) "hours"
}

function generate_random_course_insert() {
	course_id=$(uuidgen)
	course_name=$(random_course_name)
	course_duration=$(random_duration)

	insert_sql="INSERT INTO courses (id, name, duration) VALUES ('$course_id', '$course_name', '$course_duration');"

	echo "$insert_sql"
}

total_inserts=0
while true; do
	number_of_inserts_per_second=$(<./number_of_inserts_per_second)
	seconds_between_inserts=$(echo "scale=2; 1 / $number_of_inserts_per_second" | bc)

	insert=$(generate_random_course_insert)
	total_inserts=$((total_inserts + 1))
	mysql -uroot -hcodely-awesome_bash_challenges-7_2-mariadb --database=mooc -e"$insert"
	echo "$total_inserts> ($number_of_inserts_per_second inserts/s): '$insert' - Executed"

	sleep "$seconds_between_inserts"
done
