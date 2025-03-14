# Bike Analysis Project#

# Contributors

Annmarie Thomson, Arya Sardesai,Christina Zhang


# Project Overview

This project analyzes bike-sharing data to uncover patterns in usage, seasonal trends, and potential factors influencing ridership. Using statistical methods and machine learning techniques, we provide insights into the relationships between variables such as weather, time of day, and demand.

# How to Run the Analysis

1. In your terminal, clone the project and set it as your working directory:
```bash
git clone https://github.com/DSCI-310-2025/dsci-310-group-16.git
cd dsci-310-group-16`
```

2. Next, run:
```bash
docker build -t annmariect/dsci-310-group-16 .
docker run -it --rm -p 8787:8787 -v /$(pwd):/home/rstudio annmariect/dsci-310-group-16
```

4. In a browser, open up: http://localhost:8787

When prompted to put a username: Rstudio

When prompted to put a password: Put the password from the run command

5. Open bike_analysis.rmd and press the "Run" button

6. Press "Knit" to get a copy of our report

# Dependencies
Note the analysis runs on rocker/rstudio:4.4.2 image
- `ggplot2`: Version 3.5.1  
- `tidymodels`: Version 1.3.0  
- `rmarkdown`: Version 2.29  
- `readr`: Version 2.1.5  
- `GGally`: Version 2.2.1  
- `leaps`: Version 3.1  
- `mltools`: Version 0.1.0  
- `purrr`: Version 1.0.4  
- `knitr`: Version 1.49  

# Licenses
This project is licensed under the terms outlined in [LICENSE.md](LICENSE.md), including the `MIT License` and the `Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)` License.


