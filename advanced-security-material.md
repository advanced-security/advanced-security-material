#### Advanced Security Training:
- [ ] https://github.com/ghas-bootcamp/ghas-bootcamp
  - This is a public template, so you can create this repository within your existing organization. Make sure it is private, so that you can enable secret scanning and code scanning in the repository settings. This assumes you have a GitHub Advanced Security license.
  - You can fork this to your personal account, but secret scanning is automatically enabled for public repositories and as far as code scanning goes it can only be enabled on public user-owned repositories. 

#### Universe 2020 Workshops:
- [ ] https://github.com/githubuniverseworkshops/workshop-automate-your-workflow
- [ ] https://github.com/githubuniverseworkshops/devsecops-automation-with-ghas
- [ ] https://github.com/githubuniverseworkshops/codeql

#### Satellite 2020 CodeQL Workshops:
- [ ] Java: https://www.youtube.com/watch?v=nvCd0Ee4FgE
- [ ] Javascript: https://www.youtube.com/watch?v=pYzfGaLTqC0

#### CodeQL Resources: 
- [ ] QL Tutorials: https://codeql.github.com/docs/writing-codeql-queries/ql-tutorials/
- [ ] CodeQL for VS Code: https://codeql.github.com/docs/codeql-for-visual-studio-code/
- [ ] VS Code starter workspace to use with the CodeQL VS extension: https://github.com/github/vscode-codeql-starter
- [ ] CodeQL CTF: https://securitylab.github.com/ctf
- [ ] Read about contributing to CodeQL Queries: https://github.com/github/codeql/blob/main/CONTRIBUTING.md

#### Review Documentation:
- [ ] [Actions](https://docs.github.com/en/free-pro-team@latest/actions/learn-github-actions)
  - [ ] https://docs.github.com/en/free-pro-team@latest/actions/learn-github-actions/introduction-to-github-actions
  - [ ] https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions#filter-pattern-cheat-sheet
- [ ] [About Code Scanning](https://docs.github.com/en/github/finding-security-vulnerabilities-and-errors-in-your-code/about-code-scanning)
  - [ ] [CodeQL CLI Binaries](https://github.com/github/codeql-cli-binaries/releases)
  - [ ] [Getting started with CodeQL CLI](https://codeql.github.com/docs/codeql-cli/getting-started-with-the-codeql-cli/)
   - [ ] [Examples of using the CodeQL runner and CodeQL CLI](https://github.com/cmboling/ghas-test-workflows/tree/main/.github/workflows)
   - [ ] [Other CI/CD pipeline examples](https://github.com/kllund/sample-pipeline-files)
- [ ] [About Secret Scanning](https://docs.github.com/en/github/administering-a-repository/about-secret-scanning)
- [ ] [About Dependency Scanning](https://docs.github.com/en/free-pro-team@latest/github/managing-security-vulnerabilities/about-alerts-for-vulnerable-dependencies)
- [ ] More on Code Scanning:
  - [ ] Configure code scanning: https://docs.github.com/en/free-pro-team@latest/github/finding-security-vulnerabilities-and-errors-in-your-code/configuring-code-scanning
  - [ ] Configuring builds for Compiled Languages: https://docs.github.com/en/free-pro-team@latest/github/finding-security-vulnerabilities-and-errors-in-your-code/configuring-the-codeql-workflow-for-compiled-languages
  - [ ] Running additional queries: https://docs.github.com/en/free-pro-team@latest/github/finding-security-vulnerabilities-and-errors-in-your-code/configuring-code-scanning#running-additional-queries
  - [ ] Built-in Queries: https://github.com/github/codeql, https://github.com/github/codeql-go
    - For example, js query suites: https://github.com/github/codeql/tree/master/javascript/ql/src/codeql-suites
- [ ] Troubleshooting code scanning workflow:
https://docs.github.com/en/free-pro-team@latest/github/finding-security-vulnerabilities-and-errors-in-your-code/troubleshooting-the-codeql-workflow

#### Using the CodeQL CLI in CI/CD:
- [ ] How to use the CodeQL CLI: https://github.com/advanced-security/javascript-codeql-cli-test-workflow/blob/main/.github/workflows/codeql-analysis.yml
- [ ] Example Azure workflows using CLI: https://github.com/cmboling/ghas-test-workflows/tree/main/.github/workflows/azure-workflows
- [ ] Other Examples using CodeQL Runner/CLI: https://github.com/kllund/sample-pipeline-files
  - [ ] Jenkins + CodeQL CLI: https://github.com/kllund/sample-pipeline-files/blob/main/Jenkinsfile-template-with-codeql-cli-bundle

#### OSS Issue Tracking
- [ ] GitHub Code Scanning + Jira: https://github.com/github/ghas-jira-integration
