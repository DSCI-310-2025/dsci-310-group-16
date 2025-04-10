# Bike Analysis Project

# Contributors

Annmarie Thomson, Arya Sardesai, Christina Zhang


# Project Overview

This project analyzes bike-sharing data to uncover patterns in usage, seasonal trends, and potential factors influencing ridership. Using statistical methods and machine learning techniques, we provide insights into the relationships between variables such as weather, time of day, and demand.

## Getting Started

### Prerequisites
- Docker Desktop installed and running.
- Git version control.

### How to Run the Analysis

1. In your terminal, clone the project and set it as your working directory:
```bash
git clone https://github.com/DSCI-310-2025/dsci-310-group-16.git
cd dsci-310-group-16
```

2. Next, run:
```bash
docker build -t annmariect/dsci-310-group-16 . 
docker run -it --rm -p 8787:8787 -v /$(pwd):/home/rstudio annmariect/dsci-310-group-16

```
Alternatively, pull the image from Docker Hub:
```bash
docker pull annmariect/dsci-310-group-16
docker run -it --rm -p 8787:8787 -v /$(pwd):/home/rstudio annmariect/dsci-310-group-16
```


4. In a browser, open up: http://localhost:8787

- When prompted to put a username: rstudio

- When prompted to put a password: Put the password from the run command

5. To Run the analysis: in the terminal, type
```bash
  make all
```

6. Press "Knit" to get a copy of our report

# Dependencies
Note the analysis runs on rocker/rstudio:4.4.2 image
- `tidyverse`: Version 2.0.0
- `tidymodels`: Version 1.3.0
- `vroom`: Version 1.6.5
- `ucimlrepo`: Version 0.0.2
- `leaps`: Version 3.2
- `mltools`: Version 0.3.5
- `ggpubr`: Version 0.6.0
- `rmarkdown`: Version 2.29   
- `knitr`: Version 1.49
- `docopt`: Version 0.7.1
- `corrplot`: Version 0.95

## Testing
Run all tests with:
```bash
Rscript -e "testthat::test_dir('tests/testthat')"

```

## How to Contribute
We welcome contributions! Please see our [Contribution Guidelines](CONTRIBUTING.md) for:
- Reporting Issues
- Setting up development
- Making code changes
- Our review process

# Licenses
This project is licensed under the terms outlined in [LICENSE.md](LICENSE.md), including the `MIT License` and the `Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)` License.


