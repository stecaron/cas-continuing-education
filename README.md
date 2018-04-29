# cas-continuing-education

This `Shiny App` aims to keep track of the *Casualty Actuarial Society* and *Canadian Institute of Actuaries* continuing professional development program logs.

## How using it?

This repo is a template for anyone who wants to keep track of their CE logs (it contains no personal informations). To use it, here is the two simple steps:

1. Clone the repo into youor local machine:

`git clone https://github.com/stecaron/cas-continuing-education.git`

2. Verify that the proposed requirements are still valid and suited to your designation. To do so, review the 3 variables contained in the `launch-app.R`:

```
# Period of time the requirements are reviewed (years)
number_of_calendar_years <- 2
# Period of time the requirements are reviewed (years)
min_number_of_combine_hours <- 100
# Minimum number of structured hours
min_number_of_structured_hours <- 24
```

3. Run the script `launch-app.R`