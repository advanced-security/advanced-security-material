## GoLang Private Modules

Autobuild fails with error "Some packages could not be found"

There are a few options when it comes to private repositories:
- Default Setup [can take advantage of Global Private Registry configuration](https://github.blog/changelog/2025-06-10-private-registries-for-go-codeql-scans/) via `GOPROXY` 
- Advanced setup via yaml configuration can initialize the Go environment within the Actions workflow
- Vendor the dependencies

### Advanced Setup

Setting up the Go environment can be done by adding a Actions step to update the [Go settings](https://go.dev/ref/mod#private-modules) pointing them to use a [GitHub Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) with the corresponding access to the private repository.
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
