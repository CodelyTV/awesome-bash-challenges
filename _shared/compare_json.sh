function it_should_output_the_expected_json() {
	executor_file="$1"
	expected_output_file="$2"
	actual_output=$(sh "$executor_file")

	diff <(echo "$actual_output" | jq --sort-keys .) <(jq --sort-keys . "$expected_output_file") && echo "✅ All ok!" && exit 0 || echo "❌ The output is not the expected" && exit 1
}
