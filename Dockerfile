FROM rocker/r-ver:4.4.3

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R packages with specific versions
RUN R -e "install.packages(c(\"remotes\", \"devtools\"), repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('tidyverse', repos='https://cloud.r-project.org/', version='1.3.0')"
RUN R -e "install.packages('data.table', repos='https://cloud.r-project.org/', version='1.13.0')"
RUN R -e "install.packages('ggplot2', repos='https://cloud.r-project.org/', version='3.3.2')"
RUN R -e "install.packages('dplyr', repos='https://cloud.r-project.org/', version='1.0.2')"
RUN R -e "install.packages('shiny', repos='https://cloud.r-project.org/', version='1.5.0')"
RUN R -e "install.packages('rmarkdown', repos='https://cloud.r-project.org/', version='2.3')"

# Set working directory
WORKDIR /home/rstudio

# Expose port for Shiny apps
EXPOSE 3838

CMD ["R"]

