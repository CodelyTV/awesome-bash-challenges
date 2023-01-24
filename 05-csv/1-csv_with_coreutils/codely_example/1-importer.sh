cp user_progress_report.csv test.csv
head -n 1 test.csv | gsed 's/,/\n/g' | cat -n

# [OPTIONAL] Move the `last_name` column to the last one:
# awk -F',' -v OFS=, '{tmp=$3; for(i=3;i<=NF;i++) $i=$(i+1); $NF=tmp}1' user_progress_report.csv > tmp && mv tmp user_progress_report.csv

--- validar que el último campo es last name

# Add the `Start Day` column
awk -F',' -v OFS=, '{s=(NR==1)?"Start Day":substr($12,0,10);$0=$0 OFS s}1' test.csv > tmp && mv tmp test.csv

# Move the `course_id` column to the last one
awk -F',' -v OFS=, '{tmp=$7; for(i=7;i<=NF;i++) $i=$(i+1); $NF=tmp}1' test.csv > tmp && mv tmp test.csv

# Move the `cohort_id` column to the last one
awk -F',' -v OFS=, '{tmp=$8; for(i=8;i<=NF;i++) $i=$(i+1); $NF=tmp}1' test.csv > tmp && mv tmp test.csv

# Add completion_date column
awk -F',' -v OFS=, '{s=(NR==1)?"completion_date":"";$0=$0 OFS s}1' test.csv > tmp && mv tmp test.csv

# Move the completion_date column
awk -F',' -v OFS=, '{tmp=$NF; for( i=NF;i>11;i-- ) {$i=$(i-1)}; $11=tmp  ; print}' test.csv > tmp && mv tmp test.csv

# Move the `last_registration_activity` column to the last one
awk -F',' -v OFS=, '{tmp=$13; for(i=13;i<=NF;i++) $i=$(i+1); $NF=tmp}1' test.csv > tmp && mv tmp test.csv

# Move the `discount_code` column to the last one
awk -F',' -v OFS=, '{tmp=$17; for(i=17;i<=NF;i++) $i=$(i+1); $NF=tmp}1' test.csv > tmp && mv tmp test.csv

head -n 1 test.csv | gsed 's/,/\n/g' | cat -n

#--- validar campos igual a:
#
#     1	user_id
#     2	first_name
#     3	email
#     4	profile_bio
#     5	profile_location
#     6	registration_role
#     7	course_name
#     8	cohort_name
#     9	progress_pct
#    10	start_date
#    11	completion_date
#    12	last_session_time
#    13	points_earned
#    14	points_missed
#    15	points_available
#    16	score
#    17	last_name
#    18	Start Day
#    19	course_id
#    20	cohort_id
#    21	last_registration_activity
#    22	discount_code
#
#--- si ok

rm user_progress_report.csv
mv test.csv user_progress_report.csv
