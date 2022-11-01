# Scanning a compiled language with CodeQL
* NOTE: This guide will focus on GitHub Actions but the concepts can be applied to the CodeQL CLI on other CI platforms.

## Language Specific Guidance
* [CSharp](compiled-languages-csharp.md)
* [C++](compiled-languages-cpp.md)
* [Java](compiled-languages-java.md)

## Autobuilder
The autobuilder action (see [docs](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/configuring-the-codeql-workflow-for-compiled-languages#about-autobuild-for-codeql) )
 
## Build Customizations
See common build configuration and specific compiler flags: [specifying build commands](https://codeql.github.com/docs/codeql-cli/creating-codeql-databases/#specifying-build-commands)

## Common Problems

### Autobuilder [error]We were unable to automatically build your code. Please replace the call to the autobuild action with your custom build steps.

See [language specific guidance](#language-specific-guidance) for common resolutions to add custom build steps


### 401 due to private package server configuration

Ensure network access from GitHub runners to your private registry is open
   - For IP Whitelisting, consider using [Larger Runners with Static IP](https://docs.github.com/en/actions/using-github-hosted-runners/using-larger-runners#networking-for-larger-runners)
   - See Also: [Connecting Actions to a private network](https://docs.github.com/en/actions/using-github-hosted-runners/connecting-to-a-private-network)

See [language specific guidance](#language-specific-guidance) for authentication options to popular package mangers 

### Out of Memory
ex: 

> 2022-06-01T20:08:13.6909315Z       Exit code 137 and error was:

>A fatal error occurred: RelationManager failed to produce already COMPUTED FlowSummaryImpl#b68d378d::Private::TConsSummaryComponentStack#fff/3@e38197wv


These errors typically indicate that your project is too large for CodeQL to analyse with the amount of RAM found on the default GitHub runners. You can tweak the way we allocate memory to possibly make the workflow succeed by adding the following environment variable to your CodeQL job (for example, just below the runs-on field):


We can tweak the way CodeQL allocates memory to possibly make the workflow succeed
```yml
    env:
      CODEQL_ACTION_EXTRA_OPTIONS: '{"database": {"run-queries": ["--off-heap-ram=0"]}}'
```
alternatively we can further define limits 
```yml
    - name: Perform CodeQL Analysis
      uses: github/codeql-action/analyze@v2
      with: 
	    # Increase Values seen in logs:
        #2022-06-01T19:37:19.0200037Z   CODEQL_RAM: 119741
	    #2022-06-01T19:37:19.0200307Z   CODEQL_THREADS: 32
        ram: 64000
        threads: 16
```

## Reviewing Results

Helpful Articles to understand how to review, troubleshoot, and debug logs:

- [Viewing Code Scanning Logs](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/viewing-code-scanning-logs)
- [Workflow verbose logging in debug mode](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/troubleshooting-the-codeql-workflow#creating-codeql-debugging-artifacts)
- [Adding artifacts on every CodeQL Run](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/troubleshooting-the-codeql-workflow#creating-codeql-debugging-artifacts-using-a-workflow-flag)
- [Exit Codes](https://codeql.github.com/docs/codeql-cli/exit-codes/)

## Optimizaitons
- CodeQL Docs -  [The build takes too long](https://docs.github.com/en/enterprise-cloud@latest/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/troubleshooting-the-codeql-workflow)