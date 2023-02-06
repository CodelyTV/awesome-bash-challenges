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

while true; do
	seconds_between_inserts=$(<./seconds_between_inserts)

	generate_random_course_insert
	sleep "$seconds_between_inserts"
done
