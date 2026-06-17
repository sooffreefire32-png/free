# GitHub AI Flutter App Generator

This repository automates the generation and building of Flutter applications using GitHub Models and GitHub Actions.

## How it works

1.  **Define your idea**: Create or update the `idea.txt` file in the root of this repository with a clear description of the Flutter app you want to build.
2.  **AI Code Generation**: A GitHub Action (`generate_code.yml`) is triggered on pushes to `main` that modify `idea.txt`. This workflow reads your idea, uses GitHub Models (e.g., `openai/gpt-4o`) to generate the complete Flutter application code, and commits it to an `apps/[app-name]` directory in the repository.
3.  **Automated Build & Auto-Fix**: After the code generation is complete, another GitHub Action (`build_app.yml`) is triggered. This workflow sets up the Flutter environment, attempts to build the APK and AAB files, and if any build errors occur, it uses GitHub Models to analyze the error logs and suggest fixes. It will retry the build process up to 3 times after applying AI-suggested fixes.
4.  **Artifacts**: Upon successful build, the generated APK and AAB files are uploaded as GitHub Actions artifacts.

## Getting Started

1.  **Fork/Clone this repository**.
2.  **GitHub Token**: Ensure your repository has a GitHub Token with `contents: write` and `models: read` permissions. For GitHub Actions, `GITHUB_TOKEN` is usually automatically provided with sufficient permissions, but you might need to configure a Personal Access Token (PAT) if you encounter permission issues, especially for committing back to the repository.
3.  **Write your app idea**: Edit `idea.txt` with your desired Flutter app description.
4.  **Push changes**: Push your changes to the `main` branch. This will trigger the `generate_code.yml` workflow.
5.  **Monitor Workflows**: Go to the "Actions" tab in your GitHub repository to monitor the progress of the `Generate Flutter App Code` and `Build Flutter App and Auto-Fix` workflows.
6.  **Download Artifacts**: Once the `Build Flutter App and Auto-Fix` workflow completes successfully, you can download the generated APK and AAB files from the workflow run artifacts.

## `idea.txt` Example

```
Create a simple Flutter counter application with a button to increment the counter and a text display for the current count.
```

## Important Notes

*   The AI model used for code generation and error fixing is `openai/gpt-4o` (or similar). You can adjust this in the workflow files.
*   The AI-powered error fixing has a limited number of retries. Complex errors might require manual intervention.
*   The generated app name is currently fixed to `generated_app` within the `apps/` directory. Future improvements could include dynamic naming based on the `idea.txt` content.
