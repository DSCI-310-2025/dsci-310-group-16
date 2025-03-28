library(testthat)
library(dplyr)
library(readr)

source("R/cleaning.R")

test_that("clean_bike_data removes and renames columns, and converts types", {
    sample_data <- tibble::tibble(
        `...1` = 1:2,
        instant = 1:2,
        dteday = c("2021-01-01", "2021-01-02"),
        weathersit = c(1, 2),
        cnt = c("100", "200")
    )
        
    cleaned <- clean_bike_data(sample_data)
    
    # Check column name
    expect_false("instant" %in% colnames(cleaned))
    expect_false("dteday" %in% colnames(cleaned))
    expect_true("id" %in% colnames(cleaned))

    # Check types
    expect_s3_class(cleaned$weathersit, "factor")
    expect_type(cleaned$cnt, "double")
})

test_that("write_csv successfully writes cleaned data to file", {
    # Create a temporary file path
    temp_file <- tempfile(fileext = ".csv")
    # Sample cleaned data
    cleaned_data <- tibble::tibble(
        id = 1:2,
        weathersit = as.factor(c(1, 2)),
        cnt = c(100, 200)
    )
    # Write to the temp file
    write_csv(cleaned_data, temp_file)
    
    # Test: file exists
    expect_true(file.exists(temp_file))
    
    # Test: content is readable and correct
    read_back <- read_csv(temp_file, show_col_types = FALSE)
    expect_equal(nrow(read_back), 2)
    expect_equal(names(read_back), c("id", "weathersit", "cnt"))
    expect_equal(read_back$cnt, c(100, 200))
})
