library(tidyverse)
library(docopt)

source("R/cleaning.R")

"This script loads, cleans, saves titanic data

Usage: 02_clean_data.R --file_path=<file_path> --output_path=<output_path>
" -> doc

# here::i_am("scripts/02_clean_data.R")
# source(here::here("R", "cleaning.R"))

opt <- docopt(doc)

bike_data <- read_csv(opt$file_path)
bike_data_cleaned <- clean_bike_data(bike_data)
write_csv(bike_data_cleaned, opt$output_path)