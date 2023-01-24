#!/usr/bin/env bash

set -euo pipefail

# Helper functions
find_index_of() {
  local -r index_name=$1
  header=$(head -n1 "user_progress_report.csv")

  head -n1 "user_progress_report.csv" | sed -n $'1s/,/\\\n/gp' | grep -nx "$index_name" | awk -F':' '{print $1}'
}

echo "👷 Generating the \`user_progress_report.csv\` file based on the \`all_fields_user_progress_report.csv\`…"

# Immutability
cp all_fields_user_progress_report.csv user_progress_report.csv

# Uncomment to debug faster
# head -n100 all_fields_user_progress_report.csv > user_progress_report.csv

# Remove any line break inside any of the CSVs values such as `profile_bio`
awk 'BEGIN{RS="\n\n" ; ORS=" ";}{ print }' user_progress_report.csv > tmp && mv tmp user_progress_report.csv

# Replace too long course names
sed -i 's/"Buenas prácticas de BDD con Gherkin (Cucumber, Behat…)"/Buenas prácticas de BDD con Gherkin/g' user_progress_report.csv

# Convert `CR+LF` line endings to `LF` in order to avoid `awk` adding extra lines
tr -d '\r' < user_progress_report.csv > tmp && mv tmp user_progress_report.csv

# Remove any comma inside any of the CSVs values
awk -F'"' -v OFS='' '{ for (i=2; i<=NF; i+=2) gsub(",", "", $i) } 1' user_progress_report.csv > tmp && mv tmp user_progress_report.csv

# Modify the CSV structure in order to match previous generated reports and avoid having to modify the script and the G Spreadsheet report dynamic tables
user_id_position=$(find_index_of "user_id")
first_name_position=$(find_index_of "first_name")
email_position=$(find_index_of "email")
profile_bio_position=$(find_index_of "profile_bio")
profile_location_position=$(find_index_of "profile_location")
registration_role_position=$(find_index_of "registration_role")
course_name_position=$(find_index_of "course_name")
cohort_name_position=$(find_index_of "cohort_name")
progress_pct_position=$(find_index_of "progress_pct")
start_date_position=$(find_index_of "start_date")
completion_date_position=$(find_index_of "completion_date")
last_session_time_position=$(find_index_of "last_session_time")
points_earned_position=$(find_index_of "points_earned")
points_missed_position=$(find_index_of "points_missed")
points_available_position=$(find_index_of "points_available")
score_position=$(find_index_of "score")
last_name_position=$(find_index_of "last_name")
course_id_position=$(find_index_of "course_id")
cohort_id_position=$(find_index_of "cohort_id")
last_registration_activity_position=$(find_index_of "last_registration_activity")
discount_code_position=$(find_index_of "discount_code")

user_progress=$(awk -F',' \
 -v user_id="$user_id_position" \
 -v first_name="$first_name_position" \
 -v email="$email_position" \
 -v profile_bio="$profile_bio_position" \
 -v profile_location="$profile_location_position" \
 -v registration_role="$registration_role_position" \
 -v course_name="$course_name_position" \
 -v cohort_name="$cohort_name_position" \
 -v progress_pct="$progress_pct_position" \
 -v start_date="$start_date_position" \
 -v completion_date="$completion_date_position" \
 -v last_session_time="$last_session_time_position" \
 -v points_earned="$points_earned_position" \
 -v points_missed="$points_missed_position" \
 -v points_available="$points_available_position" \
 -v score="$score_position" \
 -v last_name="$last_name_position" \
 -v course_id="$course_id_position" \
 -v cohort_id="$cohort_id_position" \
 -v last_registration_activity="$last_registration_activity_position" \
 -v discount_code="$discount_code_position" \
 '{print $user_id","$first_name","$email","$profile_bio","$profile_location","$registration_role","$course_name","$cohort_name","$progress_pct","$start_date","$completion_date","$last_session_time","$points_earned","$points_missed","$points_available","$score","$last_name","substr($start_date,1,10)","$course_id","$cohort_id","$last_registration_activity","$discount_code}' "user_progress_report.csv"  |
 sed 's/start_date/Start Day/2' |
 # Remove users with line breaks in their bio descriptions (we have tried to remove them with awk and lose the battle)
 grep -v ",,,,,,,,,,,,,,,,,,," |
 # Remove courses that never came to public or that we renamed them before publishing
 grep -v "Setup producción de contenido" |
 grep -v "Introducción a Kotlin: Tu primera app de consola" |
 grep -v "Bienvenida colaboradores"
 )

 echo "$user_progress" > user_progress_report.csv

## Test out the CSV columns order
test "$(head -n1 user_progress_report.csv)" = "user_id,first_name,email,profile_bio,profile_location,registration_role,course_name,cohort_name,progress_pct,start_date,completion_date,last_session_time,points_earned,points_missed,points_available,score,last_name,Start Day,course_id,cohort_id,last_registration_activity,discount_code" && echo "✅  user_progress_report.csv has the needed columns in order after the transformation" || echo "❌ user_progress_report.csv does not has the needed columns in the correct order after the transformation"
