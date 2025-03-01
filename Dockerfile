FROM continuumio/miniconda3:latest  # Use Miniconda base image

# Set the working directory inside the container
WORKDIR /app

# Copy Conda environment file
COPY environment.yml /app/environment.yml

# Install Mamba for faster dependency resolution
RUN conda install -n base -c conda-forge mamba -y

# Create and activate the environment
RUN mamba env create -f /app/environment.yml && conda clean --all -y

# Set environment path
ENV PATH="/opt/conda/envs/r_env/bin:$PATH"
ENV CONDA_DEFAULT_ENV=r_env

# Install additional system dependencies
RUN apt-get update && apt-get install -y \
    libxt6 \
    libx11-xcb1 \
    libxrender1 \
    libxext6 \
    libsm6 \
    unixodbc \
    && apt-get clean

# Copy project files
COPY . /app

# Set the entrypoint to activate the Conda environment
SHELL ["/bin/bash", "-c"]
RUN echo "conda activate r_env" >> ~/.bashrc

# Expose RStudio port if needed
EXPOSE 8787

# Default command: Keep the container running
CMD ["bash"]
