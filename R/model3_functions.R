#' Split data into train/test sets
split_data <- function(data, prop = 0.75) {
  set.seed(2024)
  split <- rsample::initial_split(data, prop = prop)
  list(
    train = rsample::training(split),
    test = rsample::testing(split)
  )
}

#' Train a linear model
train_bike_model <- function(train_data, formula) {
  stats::lm(formula, data = train_data)
}

evaluate_model <- function(model, test_data, response_var) {
  predictions <- predict(model, newdata = test_data)
  actuals <- test_data[[response_var]]
  rmse <- sqrt(mean((actuals - predictions)^2))
  
  list(
    rmse = rmse,
    predictions = data.frame(
      actual = actuals,
      predicted = predictions
    )
  )
}

