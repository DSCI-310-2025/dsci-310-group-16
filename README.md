# Bike Analysis Project#

# Contributors

Annmarie Thomson, Arya Sardesai,Christina Zhang


# Project Overview

This project analyzes bike-sharing data to uncover patterns in usage, seasonal trends, and potential factors influencing ridership. Using statistical methods and machine learning techniques, we provide insights into the relationships between variables such as weather, time of day, and demand.

# How to Run the Analysis

Clone the repository:

git clone https://github.com/DSCI-310-2025/dsci-310-group-16.git
cd dsci-310-group-16

# How to Run
1. In your terminal, clone the project and set it as your working directory:
git clone https://github.com/DSCI-310-2025/dsci-310-group-16.git
cd dsci-310-group-16
2. Next, run:
docker build -t annmariect/dsci-310-group-16 .
docker run -it --rm -p 8787:8787 -v /$(pwd):/home/rstudio annmariect/dsci-310-group-16
4. In a browser, open up: http://localhost:8787
When prompted to put a username: Rstudio
When prompted to put a password: Put the password from the run command
5. Open bike_analysis.rmd and press the "Run" button
6. Press "Knit" to get a copy of our report

# Dependencies
- Docker
- Git
R Specific
- library(vroom)
- library(tidyverse)
- library(tidymodels)
- library(ggplot2)
- library(ucimlrepo)
- library(leaps)
- library(mltools)
- library(ggpubr)

# Licenses and Code of Conduct
[license](LICENSE) and [Code of Conduct](CODE_OF_CONDUCT.md)


