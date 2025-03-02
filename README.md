# Bike Analysis Project#

# Contributors

Arya Sardesai,Annmarie Thomson,Christina Zhang


# Project Overview

This project analyzes bike-sharing data to uncover patterns in usage, seasonal trends, and potential factors influencing ridership. Using statistical methods and machine learning techniques, we provide insights into the relationships between variables such as weather, time of day, and demand.

# How to Run the Analysis

Clone the repository:

git clone https://github.com/DSCI-310-2025/dsci-310-group-16.git
cd dsci-310-group-16

# License

This project is licensed under the terms specified in LICENSE.md.

# Reproducible Computational Environment with Docker

This project uses Docker to ensure a consistent and reproducible computing environment for analysis. All dependencies are containerized, eliminating system compatibility issues.

- Dockerfile defines the environment.

- GitHub Actions automates building and publishing the image to DockerHub.

- Contributors can run the same environment on any system.

# Install Docker

Download & Install Docker

Verify installation:

docker --version

# Run the Docker Container

Pull and run the latest image from DockerHub:

docker pull YOUR_DOCKER_USERNAME/dsci310-group-16:latest
docker run --rm -it YOUR_DOCKER_USERNAME/dsci310-group-16 R

Run an R script inside the container:

docker run --rm -v $(pwd):/workspace -w /workspace YOUR_DOCKER_USERNAME/dsci310-group-16 Rscript analysis.R

# Building & Developing Locally

For contributors modifying the environment:

Clone the repository:

git clone https://github.com/DSCI-310-2025/dsci-310-group-16.git
cd dsci310-group-16

Build the Docker image:

docker build -t dsci310-group-16 .

Run it:

docker run --rm -it dsci310-group-16 R

# Automated Build & Deployment

The GitHub Actions workflow (.github/workflows/publish_docker_image.yml) automates Docker image builds and pushes to DockerHub whenever the Dockerfile is updated in main.

To trigger manually, push an empty commit:

git commit --allow-empty -m "Trigger Docker build"
git push origin main


All contributors can work in a consistent, reproducible environment using Docker! 

