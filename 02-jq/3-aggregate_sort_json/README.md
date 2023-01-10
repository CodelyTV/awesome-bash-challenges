# 🔥 Challenge

We want to check if there are any course emojis repeated in our input data. In order to do so:

1. Format the courses JSON array input to the following schema. That is, group the courses array by their emoji and provide some useful information:
   ```json
   [
     {
       "emoji": $EMOJI,
       "total": $TOTAL,
       "courses": [
         $COURSE_1_TITLE,
         $COURSE_2_TITLE,
         …
       ]
     },
     …
   ]
   ```
   Properties:
   * `$EMOJI`: The `.emoji` value that we grouped by
   * `$TOTAL`: Number of times that emoji appears as a course emoji
   * `$COURSE_TITLES`: Array containing the courses titles of the courses that have that emoji set
2. Sort the output array prioritizing the emojis with more appearances
3. Filter out the output array in order to only keep the emojis that appear more than once
