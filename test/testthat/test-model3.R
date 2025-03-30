library(testthat)
library(tibble)
library(rsample)
library(here)

source(here::here("R", "model3_functions.R"))

test_data <- tibble(
  cnt = c(10, 20, 30),
  temp = c(15, 25, 35),
  season = c(1, 2, 1)
)
test_that("split_data() works", {
  data <- tibble(cnt = 1:100)
  split <- split_data(data)
  expect_equal(nrow(split$train), 75) # 75% of 100 = 75
})

test_that("train_bike_model() returns valid lm object", {
  model <- train_bike_model(test_data, cnt ~ temp + season)
  expect_s3_class(model, "lm")
  expect_true("coefficients" %in% names(model))
})

test_that("evaluate_model() calculates correct RMSE", {
  result <- evaluate_model(test_model, bike_train_data, "cnt")
  
  # Check RMSE calculation
  expect_equal(result$rmse, expected_rmse, tolerance = 0.001)
  
  # Check output structure
  expect_named(result, c("rmse", "predictions"))
  expect_s3_class(result$predictions, "data.frame")
})

test_that("evaluate_model() errors on invalid input", {
  expect_error(evaluate_model("not_a_model", bike_train_data, "cnt"))
  expect_error(evaluate_model(test_model, "not_a_dataframe", "cnt"))
})
