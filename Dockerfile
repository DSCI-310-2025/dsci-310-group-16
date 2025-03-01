FROM rocker/tidyverse:latest

# Set the working directory inside the container
WORKDIR /app

# Install Conda and Mamba
RUN apt-get update && apt-get install -y wget && \
    wget -O /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

# Set Conda path
ENV PATH="/opt/conda/bin:$PATH"

# Install Mamba for better package resolution
RUN conda install -n base -c conda-forge mamba -y

# Packages and versions specified in environment.yml
COPY environment.yml /app/environment.yml

# Update environment using Mamba (instead of Conda)
RUN mamba env update --file /app/environment.yml -y && conda clean --all -y

# Copy project files
COPY . /app

# Expose RStudio and Jupyter Notebook ports
EXPOSE 8787 8888

# Keep the container running
CMD ["/init"]
