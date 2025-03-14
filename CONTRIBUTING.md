# Contributing to Our Project

We welcome all contributions to this project! Whether you're fixing a bug, adding a feature, or improving documentation, your help is appreciated.

### Reporting Bugs
If you notice a bug or have a feature request, please open an issue [here](https://github.com/UBC-DSCI/dsci-310-group-16/issues). Be sure to include:
- A clear description of the problem or feature.
- Steps to reproduce the issue (if applicable).
- Screenshots or error messages (if applicable).

### Contributing Code
If you'd like to contribute code, please follow these steps:

1. **Fork the Repository**:
   - Fork the repo to your own GitHub account.

2. **Set Up the Development Environment**:
   - Clone your forked repository to your local machine:
     ```bash
     git clone https://github.com/your-username/dsci-310-group-16.git
     ```
   - Set up the computational environment using Docker:
     ```bash
     docker build -t bike-analysis .
     docker run -it bike-analysis
     ```
   - Alternatively, you can set up a local environment by installing the required dependencies listed in the `Dockerfile`.

3. **Create a New Branch**:
   - Create a new branch for your changes:
     ```bash
     git checkout -b your-branch-name
     ```

4. **Make Your Changes**:
   - Make your changes to the codebase. Ensure your code follows the project's style guidelines:
     - R code should follow the [tidyverse style guide](https://style.tidyverse.org/).
     - Python code should follow the [black style guide](https://black.readthedocs.io/en/stable/).
   - Test your changes to ensure they work as expected.

5. **Commit Your Changes**:
   - Stage your changes:
     ```bash
     git add .
     ```
   - Commit your changes with a meaningful message:
     ```bash
     git commit -m "Add feature: [describe your changes]"
     ```

6. **Push Your Changes**:
   - Push your branch to your forked repository:
     ```bash
     git push origin your-branch-name
     ```

7. **Submit a Pull Request**:
   - Go to the original repository and create a Pull Request (PR) from your branch.
   - Provide a clear title and description for your PR, explaining what it does and why it's needed.
   - Assign at least one teammate to review your PR.

### Review Process
- We will review pull requests within 7 days.
- Reviewers may provide feedback or request changes. Please address any feedback and update your PR accordingly.
- Once approved, your changes will be merged into the `main` branch.

### Code of Conduct
All contributors must abide by our [Code of Conduct](CODE_OF_CONDUCT.md). Please be respectful and inclusive in all interactions.