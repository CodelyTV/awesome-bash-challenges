function it_should_output_the_expected_text() {
	executor_file="$1"
	expected_output_file="$2"
	actual_output=$(sh "$executor_file")

	diff "$expected_output_file" <(echo "$actual_output") && echo "✅ All ok!" && exit 0 || echo "❌ The output is not the expected" && exit 1
}
