library(tidyverse)
library(tidymodels)
library(leaps)
library(broom)
library(ggplot2)

bike_data <- read.csv("data/cleaned/bike_data.csv")

#splitting data

set.seed(2024)
bike_split <- initial_split(bike_data,prop = 0.75, strata = cnt)
bike_train <- training(bike_split)
bike_test <- testing(bike_split)

#Summary stats for the training and test sets

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
write_csv(bike_tt_summary, paste0(output_prefix, "_summary_stats.csv"))

# Determine the best model
best_models <- regsubsets(log(cnt) ~ season + holiday + workingday + weathersit + temp + hum + windspeed, 
                          data = bike_train, nvmax = 11)

# Summarize best subset results
res.sum <- summary(best_models)
best_model_index <- which.max(res.sum$adjr2)

# Save best subset results to a file
best_subset_results <- data.frame(
  R2 = which.max(res.sum$rsq),
  Adj.R2 = which.max(res.sum$adjr2)
)
write_csv(best_subset_results, paste0(output_prefix, "_best_subset_results.csv"))

# Fit the final model (including weathersit)
final_bike_model <- lm(log(cnt) ~ season + holiday + workingday + weathersit + temp + hum + windspeed, 
                       data = bike_train)

# Save final model summary to a file
model_summary <- tidy(final_bike_model)
write_csv(model_summary, paste0(output_prefix, "_model_summary.csv"))

# Make predictions on the test set
predictions <- predict(final_bike_model, newdata = bike_test)

# Calculate RMSE
rmse_value <- rmse(preds = predictions, actuals = log(bike_test$cnt))
rmse_df <- data.frame(RMSE = rmse_value)
write_csv(rmse_df, paste0(output_prefix, "_rmse.csv"))

# Save predictions to a file
predictions_df <- data.frame(actual = log(bike_test$cnt), predicted = predictions)
write_csv(predictions_df, paste0(output_prefix, "_predictions.csv"))

# Generate and save residual plot
residual_plot <- ggplot(bike_train, aes(x = fitted(final_bike_model), y = residuals(final_bike_model))) +
  geom_point(alpha = 0.5) +
  geom_hline(yintercept = 0, linetype = 'dashed', color = "red") +
  labs(title = "Residual Plot", x = "Fitted Values", y = "Residuals")
ggsave(paste0(output_prefix, "_residual_plot.png"), plot = residual_plot)