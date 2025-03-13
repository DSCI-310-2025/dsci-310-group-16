FROM rocker/rstudio:4.4.2

RUN Rscript -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"

RUN Rscript -e "remotes::install_version('tidyverse', version='2.0.0', repos = 'https://cran.rstudio.com')"
RUN Rscript -e "remotes::install_version('tidymodels', version='1.3.0', repos = 'https://cran.rstudio.com')"

RUN Rscript -e "remotes::install_version('vroom', version='1.6.5', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('ggplot2', version='3.5.1', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('ucimlrepo', version='0.0.2', repos = 'https://cran.r-project.org')"

RUN Rscript -e "remotes::install_version('leaps', version = '3.1', repos = 'https://cran.rstudio.com')"
RUN Rscript -e "remotes::install_version('mltools', version = '0.1.0', repos = 'https://cran.rstudio.com')"
RUN Rscript -e "remotes::install_version('ggpubr', version = '0.6.0', repos = 'https://cran.rstudio.com')"

RUN Rscript -e "remotes::install_version('rmarkdown', version='2.29', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('knitr', version = '1.49', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('readr', version='2.1.5', repos = 'https://cran.r-project.org' )"


