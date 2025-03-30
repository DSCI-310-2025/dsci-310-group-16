#' Split Data into Training and Test Sets
#'
#' Partitions a dataset into training and testing subsets using random sampling.
#' Maintains proportional class distribution when strata is specified.
#'
#' @param data A data frame or tibble containing the dataset to split
#' @param prop Numeric value between 0 and 1 indicating the proportion of data for 
#'        the training set (default: 0.75)
#'
#' @return A list with two components:
#' \item{train}{Training subset (data.frame)}
#' \item{test}{Testing subset (data.frame)}
#'
#' @export
#'
#' @examples
#' data <- data.frame(x = rnorm(100), y = rnorm(100))
#' splits <- split_data(data)
split_data <- function(data, prop = 0.75) {
  set.seed(2024)
  split <- rsample::initial_split(data, prop = prop)
  list(
    train = rsample::training(split),
    test = rsample::testing(split)
  )
}

#' Train Linear Regression Model for Bike Counts
#' 
#' Fits a linear regression model to predict bike rental counts using specified
#' predictor variables.
#'
#' @param train_data Training data (data.frame or tibble)
#' @param formula A formula specifying the model structure (e.g. cnt ~ temp + season)
#'
#' @return An object of class "lm" containing the fitted model
#'
#' @export
#'
#' @examples
#' model <- train_bike_model(bike_data, cnt ~ temp + season)
train_bike_model <- function(train_data, formula) {
  stats::lm(formula, data = train_data)
}
#' Evaluate Regression Model Performance
#'
#' Calculates model performance metrics and predictions on test data.
#'
#' @param model A fitted model object (from train_bike_model())
#' @param test_data Test dataset for evaluation (data.frame or tibble)
#' @param response_var Character string naming the response variable column
#'
#' @return A list containing:
#' \item{rmse}{Root mean squared error (numeric)}
#' \item{predictions}{Data frame with actual and predicted values}
#'
#' @export
#'
#' @examples
#' results <- evaluate_model(model, test_data, "cnt")
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

