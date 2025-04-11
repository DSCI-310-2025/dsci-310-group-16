library(pointblank)
library(readr)
library(dplyr)
library(tools)

#check 1. Load and validate file format
file_path <- "data/raw/bike_data.csv"
if (file_ext(file_path) != "csv") {
    stop("❌ Incorrect file format: must be a .csv file.")
    }

bike_data <- read_csv("data/raw/bike_data.csv", show_col_types = FALSE)

# Define expected column names
expected_cols <- c(
    "instant", "dteday", "season", "yr", "mnth", "hr", "holiday",
    "weekday", "workingday", "weathersit", "temp", "atemp", "hum",
    "windspeed", "casual", "registered", "cnt"
)

quantiles=quantile(bike_data$cnt, probs = c(0.90, 0.95, 0.99))
print(quantiles)

# Define a warning threshold for failing values
warn_thresh <- action_levels(warn_at = 0.10)

# Validation agent
agent <- bike_data |>
    create_agent(label = "Validation for bike_data") |>
    # check 2. Correct column names
    col_exists(columns = expected_cols) |>
    # check 3. No empty observations (entire rows of NA)
    rows_complete()|>
    # check 4. Correct data types
    col_is_numeric(columns = vars(instant, season, yr, mnth, hr, holiday, weekday,workingday, weathersit,temp, atemp, hum, windspeed, casual, registered, cnt)) |>
    col_is_date(columns = vars(dteday)) |>
    # check 5. No duplicate observations
    rows_distinct() |>
    # check 6. Outlier check on target (cnt): must be non-negative and not absurdly high
    col_vals_between(columns = vars(cnt), left = 0, right = 1000) |>
    # check 7. Valid category levels for "season" (1 = spring, 2 = summer, 3 = fall, 4 = winter)
    col_vals_in_set(columns = vars(season), set = 1:4) |>
    # check 8. Target variable follows expected distribution (e.g. based on 95th percentile cnt = 563.10)
    col_vals_lt(columns = vars(cnt), value = quantiles["95%"], actions = warn_thresh) |>

    interrogate()

print(agent)

if (any(agent$validation_set$f_passed == FALSE)) {
    stop("❌ One or more validation checks failed. See above.")
} else {
    message("✅ All validation checks passed.")
}