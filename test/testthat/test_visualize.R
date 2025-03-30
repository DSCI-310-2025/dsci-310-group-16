library(testthat)
library(ggplot2)
source("R/visualize.R")

test_that("make_scatter creates a valid ggplot object", {
  data <- data.frame(x = 1:10, y = rnorm(10))
  p <- make_scatter(data, "x", "y", "Test Plot", "X-axis", "Y-axis", "blue")
  
  expect_s3_class(p, "ggplot") # Check that the function returns a ggplot object
  expect_equal(p$labels$title, "Test Plot") # Check the title
  expect_equal(p$labels$x, "X-axis") # Check x-axis label
  expect_equal(p$labels$y, "Y-axis") # Check y-axis label
})

test_that("make_bar creates a valid ggplot object", {
  # Sample data
  data <- data.frame(
    category = c("A", "B", "C"),
    value = c(10, 15, 7),
    group = c("G1", "G2", "G1")
  )
  # Generate the bar plot
  p <- make_bar(data, "category", "value", "group", "Test Bar Plot", 
                "Categories", "Values", "blue", c("A", "B", "C"))
  
  expect_s3_class(p, "ggplot")  # Check if it returns a ggplot object
  expect_equal(p$labels$title, "Test Bar Plot")  # check the title
  expect_equal(p$labels$x, "Categories")  # check x-axis
  expect_equal(p$labels$y, "Values")  # check y-axis
})

test_that("save_plot function saves the file correctly", {
  data <- data.frame(x = 1:10, y = rnorm(10))
  p <- make_scatter(data, "x", "y", "Test Plot", "X-axis", "Y-axis", "blue")
  
  temp_dir <- tempdir()
  output_file <- file.path(temp_dir, "test_plot.png")
  
  save_plot("test_plot.png", temp_dir, 5)
  
  expect_true(file.exists(output_file)) # Check if file was saved
})
