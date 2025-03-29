library(tidyverse)
library(tidymodels)
library(leaps)
library(broom)
library(ggplot2)
library(mltools)
library(docopt)
library(testthat)
library(here)

source(here::here("R", "model3_functions.R"))

"This script loads, cleans, saves titanic data

# Usage: 04_model_analysis.R --file_path=<file_path> --output_dir=<output_dir>
# " -> doc

opt <- docopt(doc)

bike_data <- read.csv(opt$file_path)
# bike_data <- tibble(
#   cnt = c(10:1, 1:10),
#   season = rep(1:4, 5),
#   temp = rnorm(20)
# )

# #splitting data

split <- split_data(bike_data)

bike_train <- split$train
bike_test <- split$test

# Summary stats for the training and test sets

bike_train_summary <- bike_train |>
 summarize(mediant_cnt = median(cnt,na.rm = TRUE),
 mean_cnt = mean(cnt,na.rm = TRUE),
 sd_cnt <- sd(cnt,na.rm= TRUE))

bike_test_summary <- bike_test |>
summarize(mediant_cnt = median(cnt,na.rm = TRUE),
mean_cnt = mean(cnt,na.rm = TRUE),
sd_cnt <- sd(cnt,na.rm= TRUE))

bike_tt_summary <- bind_rows(bike_train_summary,bike_test_summary)|>
mutate(partition = c("Train", "Test"),
         fraction = c(0.75, 0.25)) |>
  relocate(partition, fraction)

# Save summary statistics to a file
output_file = file.path(path = opt$output_dir, "summary_stats.csv")
write_csv(bike_tt_summary, output_file)


# # Determine the best model
best_models <- regsubsets(log(cnt) ~ season + holiday + workingday + weathersit + temp + hum + windspeed,
                          data = bike_train, nvmax = 11)

final_model <- train_bike_model(
  bike_train,
  log(cnt) ~ season + holiday + workingday + weathersit + temp + hum + windspeed
)

# Summarize best subset results
res.sum <- summary(best_models)
best_model_index <- which.max(res.sum$adjr2)

# Save best subset results to a file
best_subset_results <- data.frame(
  R2 = which.max(res.sum$rsq),
  Adj.R2 = which.max(res.sum$adjr2)
)
output_file2 = file.path(path = opt$output_dir, "best_subset_results.csv")
write_csv(best_subset_results, output_file2)


bike_model_with_weather = lm(log(cnt) ~ season + holiday + workingday + weathersit + temp + hum + windspeed, data = bike_train)
res_with <- summary(bike_model_with_weather)
bike_model_no_weather = lm(log(cnt) ~ season + holiday + workingday + temp + hum + windspeed, data = bike_train)
res_no <- summary(bike_model_no_weather)
weather <- data.frame(
  Adj.R2_with = res_with$adj.r.squared,
  Adj.R2_without = res_no$adj.r.squared
)
output_file6 = file.path(path = opt$output_dir, "weather.csv")
write_csv(weather, output_file6)

# Fit the final model (including weathersit)
final_bike_model <- lm(log(cnt) ~ season + holiday + workingday + weathersit + temp + hum + windspeed,
                       data = bike_train)

# Save final model summary to a file
model_summary <- tidy(final_bike_model)
output_file3 = file.path(path = opt$output_dir, "model_summary.csv")
write_csv(model_summary, output_file3)

eval_results <- evaluate_model(final_bike_model, bike_test, "cnt")
rmse_value <- eval_results$rmse
predictions_df <- eval_results$predictions

# # Make predictions on the test set
# predictions <- predict(final_bike_model, newdata = bike_test)

# # Calculate RMSE
# rmse_value <- rmse(preds = predictions, actuals = log(bike_test$cnt))
# rmse_df <- data.frame(RMSE = rmse_value)
output_file4 = file.path(path = opt$output_dir, "rmse.csv")
write_csv(rmse_df, output_file4)



# # Save predictions to a file
# predictions_df <- data.frame(actual = log(bike_test$cnt), predicted = predictions)
output_file5 = file.path(path = opt$output_dir, "predictions.csv")
write_csv(predictions_df, output_file5)



# Generate and save residual plot
residual_plot <- ggplot(bike_train, aes(x = fitted(final_bike_model), y = residuals(final_bike_model))) +
  geom_point(alpha = 0.5) +
  geom_hline(yintercept = 0, linetype = 'dashed', color = "red") +
  labs(title = "Residual Plot", x = "Fitted Values", y = "Residuals")
ggsave("residual_plot.png",path=opt$output_dir)


write_csv(tidy(final_model), file.path(opt$output_dir, "model_summary.csv"))
