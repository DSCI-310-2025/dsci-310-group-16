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