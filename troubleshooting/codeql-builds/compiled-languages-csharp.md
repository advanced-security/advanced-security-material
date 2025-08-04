---

Scanning a C# application with CodeQL

# Build Failures

## [error]We were unable to automatically build your code. Please replace the call to the autobuild action with your custom build steps.

<details>
<summary>Expand for sample workflow failure output</summary>

```
  Exit code 1
  Attempting to locate build script
  Error: Could not auto-detect a suitable build method
  Error: We were unable to automatically build your code. Please replace the call to the autobuild action with your custom build steps.  Failure invoking /opt/hostedtoolcache/CodeQL/...

    Exit code 1 and error was:

    Error: Could not auto-detect a suitable build method

  CommandInvocationError: Failure invoking /opt/hostedtoolcache/CodeQL/0.0.0-20221010/x64/codeql/csharp/tools/autobuild.sh with arguments .

    Exit code 1 and error was:

    Error: Could not auto-detect a suitable build method

  at runTool (/home/runner/work/_actions/github/codeql-action/v2/lib/codeql.js:867:15)
  at processTicksAndRejections (node:internal/process/task_queues:96:5)
  at async Object.runAutobuild (/home/runner/work/_actions/github/codeql-action/v2/lib/codeql.js:559:13)
  at async runAutobuild (/home/runner/work/_actions/github/codeql-action/v2/lib/autobuild.js:97:5)
  at async run (/home/runner/work/_actions/github/codeql-action/v2/lib/autobuild-action.js:71:17)
  at async runWrapper (/home/runner/work/_actions/github/codeql-action/v2/lib/autobuild-action.js:88:9)
```
</details>

This error indicates there is a scenario where our [C# AutoBuilder](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/configuring-code-scanning-for-compiled-languages#autobuilding-code) cannot build your application. Make sure to:

- Use a compatible runner (Windows 2019/2022, Visual Studio, .NET SDK)
- Pull required custom tooling via [custom script](https://docs.github.com/en/actions/using-github-hosted-runners/customizing-github-hosted-runners)

## Manual Build Steps on Windows Runners
NOTE: If you require Windows OS to build, ensure you are using a Windows runner. Otherwise, it will attempt to use Mono [from the ubuntu image](https://github.com/actions/runner-images/blob/main/images/linux/Ubuntu2204-Readme.md).

Example using `windows-latest`:
```yml
jobs:
  analyze:
    name: Analyze
    runs-on: windows-latest
```

Next, specify your own build steps from an existing CI workflow:
- [microsoft/setup-msbuild](https://github.com/microsoft/setup-msbuild) and [Nuget/setup-nuget](https://github.com/nuget/setup-nuget) are popular tools

```yml
  # Autobuild attempts to build any compiled languages
  # If this step fails, then you should remove it and run the build manually (see below)
  #- name: Autobuild
  #  uses: github/codeql-action/autobuild@v2

  # Discover where the MSBuild tool is and automatically add it to the PATH environment variable
  - name: Setup MSBuild
    uses: microsoft/setup-msbuild@v1

  # Download/installs a given version of NuGet.exe. Using this action will add nuget to your $PATH
  - name: Setup NuGet
    uses: NuGet/setup-nuget@v1

  # CI build with best practices from: https://codeql.github.com/docs/codeql-cli/creating-codeql-databases/#specifying-build-commands
  - name: .NET Build Steps
    run: |
      nuget restore .\FullDotNetWebApp.sln -DisableParallelProcessing
      msbuild .\FullDotNetWebApp.sln /p:UseSharedCompilation=false /t:rebuild /p:Platform="Any CPU" /p:Configuration="Debug" /p:MvcBuildViews=true

  - name: Perform CodeQL Analysis
    uses: github/codeql-action/analyze@v2
```

# Dependencies

Managing dependencies is critical to successful CodeQL scans, especially for private package feeds and custom NuGet servers.

## NuGet and dotnet restore

### DotNet (.NET standard / core)
Using `dotnet` is best documented at: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-net. The [actions/setup-dotnet](https://github.com/actions/setup-dotnet) action supports setting up authentication for NuGet feeds.

#### NuGet Error NU1301
This can indicate your custom package server is not configured which may fail the `dotnet restore` command. For private package servers, follow this guidance to add package sources: [Setup dotnet authentication](https://github.com/actions/setup-dotnet#setting-up-authentication-for-nuget-feeds).

#### NuGet.targets(132,5): warning : Your request could not be authenticated by the GitHub Packages service. Please ensure your access token is valid and has the appropriate scopes configured.

Add authentication before the autobuild or manual build steps:
```yml
- uses: actions/setup-dotnet@v3
  with:
    source-url: https://nuget.pkg.github.com/<owner>/index.json
  env:
    NUGET_AUTH_TOKEN: ${{secrets.GITHUB_TOKEN}}
```

To update existing feeds in a `nuget.config` with credentials:
```yml
# Updating MY_ADO_FEED credentials
- name: update nuget to add auth
  run: dotnet nuget update source MY_ADO_FEED -u NOTUSED -p "${{ secrets.ADO_TOKEN }}" --store-password-in-clear-text
```

Alternatively, add a GitHub Packages hosted NuGet feed using the nuget CLI tooling:
```yml
- name: add nuget auth
  run: dotnet nuget add source https://nuget.pkg.github.com/<org-goes-here>/index.json -n "GitHub" -u USERNAME -p "${{ secrets.GH_PACKAGES_READ_ONLY }}" --store-password-in-clear-text
```

### .NET Framework

#### NuGet Authentication
If you cannot use [nuget/setup-nuget](https://github.com/nuget/setup-nuget#basic) to pass package key/source to nuget.exe for restore, instead fallback to `nuget sources` commands:

Update an existing source in `nuget.config`:
```yml
- name: NuGet Restore
  run: |
    nuget sources Update -Name "SourceName" -UserName "any" -Password "${{ secrets.NUGET_PACKAGES_PAT }}"
    nuget restore
```

Add a new source with `nuget sources Add`:
```yml
- name: NuGet Restore
  run: |
    nuget sources Add -Name "SourceName" -Source "https://url.to.your/source" -UserName "any" -Password "${{ secrets.NUGET_PACKAGES_PAT }}"
    nuget restore
```

## Global Private Registry Configuration

Global Private Registry configuration at the org level supports credentials for NuGet servers. This increases the precision of the default setup scans, especially in "build mode: none", by enabling CodeQL to resolve dependencies that otherwise require authentication. Ensure your org-level registry settings are up-to-date with correct credentials to avoid restore failures and maximize analysis completeness.

## Tips for build-mode: none

- [Build-mode none](https://docs.github.com/en/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages#codeql-build-modes) allows scanning without invoking build targets. Credentials for private registries listed in your `nuget.config` must be available/injected so that `none` mode does not attempt to hit a registry that will fail for every dependency.
- Consider breaking up code into smaller chunks to scan (e.g., monorepo microservices).

---

<rest of the original content>