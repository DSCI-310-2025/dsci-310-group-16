library(tidyverse)
library(docopt)

"This script loads, cleans, saves titanic data

Usage: 02_clean_data.R --file_path=<file_path> --output_path=<output_path>
" -> doc

opt <- docopt(doc)

bike_data <- read.csv(opt$file_path)
bike_data <- bike_data %>%
  select(-instant, -dteday)
bike_data <- bike_data %>%
  mutate(weathersit = as.factor(weathersit))
bike_data <- bike_data %>%
  mutate(cnt = as.numeric(cnt))
bike_data <- bike_data %>%
  rename(id = X)
write_csv(bike_data, opt$output_path)