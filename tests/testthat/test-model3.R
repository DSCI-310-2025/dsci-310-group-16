library(testthat)
source(here::here("R", "model_functions.R"))

test_that("split_data() works", {
  data <- data.frame(cnt = 1:100)
  split <- split_data(data)
  expect_equal(nrow(split$train), 75) # 75% of 100 = 75
})
