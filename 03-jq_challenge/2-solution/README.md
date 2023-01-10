# 🔥 Challenge

We want to know the top contributors of a GitHub repository based on the number of open Pull Requests (PRs). For this example, we will be using the [dotly](https://github.com/CodelyTV/dotly) repository. In order to do so:

1. Format the output JSON according to the following schema:
   ```json
   [
     {
       "user": "$GITHUB_USER$",
       "total_prs": $NUM_PRS_USER$,
       "prs_title": [
         "$PR_1_TITLE$",
         "$PR_2_TITLE$",
         …
       ]
     },
     …
   ```
   Properties:
   * `$GITHUB_USER$`: GitHub username
   * `$NUM_PRS_USER$`: Number of PRs open by that user
   * `$PR_NUM_TITLE`: PRs title following the schema: `created_at: title`
2. Sort the output array prioritizing the users with more PRs
3. Filter out the output array in order to only keep users that has contributed with more than 1 PR
