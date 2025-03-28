library(tibble)
set.seed(2024)

# Minimal training data
bike_train_data <- tibble(
  cnt = c(10, 20, 30, 40),
  temp = c(15, 25, 35, 45),
  season = factor(c(1, 2, 1, 2))
)

# Expected output structure
expected_model_structure <- list(
  coefficients = numeric(3),  # Intercept + 2 predictors
  rank = 3L
)

test_model <- lm(cnt ~ temp, data = bike_train_data)

expected_rmse <- sqrt(mean((
    predict(test_model, bike_train_data) - bike_train_data$cnt)^2))