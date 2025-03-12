FROM rocker/rstudio:4.4.2

RUN Rscript -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"

RUN Rscript -e "remotes::install_version('ggplot2', version='3.5.1', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('tidymodels', version='1.3.0', repos = 'https://cran.rstudio.com')"
RUN Rscript -e "remotes::install_version('rmarkdown', version='2.29', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('readr', version='2.1.5', repos = 'https://cran.r-project.org' )"
RUN Rscript -e "remotes::install_version('GGally', version='2.2.1', repos = 'https://cran.rstudio.com')"

RUN Rscript -e "remotes::install_version('leaps', version = '3.1', repos = 'https://cran.rstudio.com')"
RUN Rscript -e "remotes::install_version('mltools', version = '0.1.0', repos = 'https://cran.rstudio.com')"
RUN Rscript -e "remotes::install_version('purrr', version = '1.0.4', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('knitr', version = '1.49', repos = 'https://cran.r-project.org')"

