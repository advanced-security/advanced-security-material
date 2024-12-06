## GoLang Private Modules

Autobuild fails with error "Some packages could not be found"

There are two options when it comes to private repositories:

- Set-up the Go environment within the Actions workflow (not vendoring then)
- Vendor the dependencies

Setting up the Go environment can be done by adding a Actions step to update the [Go settings](https://go.dev/ref/mod#private-modules) pointing them to use an access token (ex:  [GitHub Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)) with the corresponding access to the private repository.
The example below shows how this can be done using a single step before the CodeQL Initize step - storing the GitHub PAT in an Actions Secret.

**Example:**

```yml
name: CodeQL

env:
  GOLANG_TOKEN: ${{ secrets.GOLANG_GITHUB_TOKEN }}
  GOLANG_USER: octocat

# ...
jobs:
  analyze:
    name: Analyze
    # ...
    steps:
    - name: Go Configuration
      run: git config --global url."https://${GOLANG_USER}:${GOLANG_TOKEN}@github.com".insteadOf "https://github.com"

    # ... Start scanning
```

Alternatively, pass the token into the CodeQL init action to allow it to be used for downstream git operations:

```yml
- uses: github/codeql-action/init@v2
  with:
  external-repository-token: ${{ secrets.GOLANG_GITHUB_TOKEN }}
```


The auto generated GITHUB_TOKEN is strictly scoped to the repository for security reasons.

To interact with higher level resources(other repositories, use GitHub Apps with shortlived tokens instead of Personal Acces Tokens. The GitHub action for it here https://github.com/actions/create-github-app-token described in the docs here https://github.com/actions/create-github-app-token


This is better than a PAT for a few reasons:
- The tokens are short lived.
- The token can be scoped to specific places in the workflow at time of creation.
- It isn’t associated to a user, it is associated to an app.
