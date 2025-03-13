library(tidyverse)

bike_data <- read.csv("data/raw/bike_data.csv")
bike_data <- bike_data %>%
  select(-instant, -dteday)
bike_data <- bike_data %>%
  mutate(weathersit = as.factor(weathersit))
bike_data <- bike_data %>%
  mutate(cnt = as.numeric(cnt))
bike_data <- bike_data %>%
  rename(id = X)
write_csv(bike_data, "../dsci-310-group-16/data/cleaned/bike_data.csv")