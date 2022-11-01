Scanning a C# application with CodeQL

# Build Failures

## [error]We were unable to automatically build your code. Please replace the call to the autobuild action with your custom build steps.

<details>
<summary>Expand for sample workflow failure output</summary>

```
  Exit code 1
  Attempting to locate build script
  Error: Could not auto-detect a suitable build method
  Error: We were unable to automatically build your code. Please replace the call to the autobuild action with your custom build steps.  Failure invoking /opt/hostedtoolcache/CodeQL/0.0.0-20221010/x64/codeql/csharp/tools/autobuild.sh with arguments .
  
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


This error indicates there is a scenario where our [C# AutoBuilder](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/configuring-the-codeql-workflow-for-compiled-languages#c) is unable to build your code.  No sweat, check out some of the resources below to get you started:

Ensure your required build tooling is installed your [runner](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources)
   - Windows 2019 runner 
      - [Visual Studio 2019 Enterprise pre-installed](https://github.com/actions/runner-images/blob/main/images/win/Windows2019-Readme.md#visual-studio-enterprise-2019)
	  - [.NET Framework Developer Pack](https://github.com/actions/runner-images/blob/main/images/win/Windows2019-Readme.md#net-framework)
	  - [.NET Core SDK](https://github.com/actions/runner-images/blob/main/images/win/Windows2019-Readme.md#net-core-sdk)
   - Windows 2022 runner 
      - [Visual Studio 2022 Enterprise pre-installed](https://github.com/actions/runner-images/blob/main/images/win/Windows2022-Readme.md#visual-studio-enterprise-2022)
	  - [.NET Framework Developer Pack](https://github.com/actions/runner-images/blob/main/images/win/Windows2022-Readme.md#net-framework)
	  - [.NET Core SDK](https://github.com/actions/runner-images/blob/main/images/win/Windows2022-Readme.md#net-core-sdk)
</details>

If any custom tooling is required, consider pulling into your action via [custom script](https://docs.github.com/en/actions/using-github-hosted-runners/customizing-github-hosted-runners)


### DotNet (.NET standard / core / )
Using `dotnet` is best documented at: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-net.  The [actions/setup-dotnet](https://github.com/actions/setup-dotnet) action can assist in configuring proper build tools.

### .NET Framework Manual Build Steps on Windows Runners
NOTE: if you require windows OS to build, ensure you are using a windows runner. 

Example using `windows-latest`:
- Note: The `-latest` runner images are the latest stable images that GitHub provides, and might not be the most recent version of the operating system available from the operating system vendor.
```yml
jobs:
  analyze:
    name: Analyze
    runs-on: windows-latest
```

Next, consider specifying your own build steps from an existing CI workflow:
- The [microsoft/setup-msbuild](https://github.com/microsoft/setup-msbuild) and [Nuget/setup-nuget](https://github.com/nuget/setup-nuget) actions are popular tools to assist in this configuration


```yml
    # Autobuild attempts to build any compiled languages  (C/C++, C#, or Java).
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

##  "You are running out of disk space.  The runner will stop working when the machine runs out of disk space."
	
Running low on disk using the default Actions runner? Try a few of these workarounds for a potential quick fix:
			
 Clean up large directories of [preinstalled software](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#preinstalled-software) that you are potentially not using on the windows runners, add this to your “CodeQL” workflow:

```yml			
- name: Clean up some disks
  run: |
  rd C:\Android\android-sdk
  docker system prune -af
```

 Specify the temp directory to store the CodeQL database - I have seen this resolve this specific problem with a Windows env (runs-on: windows-2019)
 ```yml
- name: Initialize CodeQL
  uses: github/codeql-action/init@v2
  with:
  db-location: ‘C:\windows\temp\codeql-database’
```
			
- See also: [Vertical Scaling](#vertical-scaling---throw-hardware-at-the-software-problem)


# Speed up C# Analysis

Start here: [CodeQL Docs -  The build takes too long](https://docs.github.com/en/enterprise-cloud@latest/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/troubleshooting-the-codeql-workflow#the-build-takes-too-long).

## Optimization - Removing Unit Tests
CodeQL will extract and analyze any code that is passed through the compiler.  Consider excluding any code you do not wish to include in a security scan to speed up and remove noise from this process.

With .NET we can employ a few mechanisms to remove test/demo code from CodeQL scans (e.g. you would want to run your unit test in another workflow ):
- A [solution filter](https://docs.microsoft.com/en-us/visualstudio/msbuild/solution-filters?view=vs-2019) to only build required projects
- An explicit [solution file that excludes projects](https://docs.microsoft.com/en-us/visualstudio/ide/how-to-exclude-projects-from-a-build?view=vs-2022)
   - example from the Open Source project: [Identity Server](https://github.com/DuendeSoftware/IdentityServer/)
      - have a [build.sh script wrapper](https://github.com/DuendeSoftware/IdentityServer/blob/main/build/Program.cs#L47) around their solution targets
	  - distinct [IdentityServer.CodeQL.sln solution](https://github.com/DuendeSoftware/IdentityServer/blob/main/Duende.IdentityServer.CodeQL.sln) excluding unit tests
	  - [CodeQL yaml passes in a flag to build script](https://github.com/DuendeSoftware/IdentityServer/blob/44d8d5964edfae20c4be424c0b3a2ed5050c6fe9/.github/workflows/codeql-analysis.yml#L57) to use the CodeQL solution
- Build in release mode - exclude test projects from that [build configuration](https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2015/ide/how-to-create-and-edit-configurations?view=vs-2015&redirectedfrom=MSDN#to-modify-a-solution-wide-build-configuration)

## Optimizations - CodeQL Queries
- Tweak your current codeql yml workflow in a few ways: 
	- remove security-extended queries, the default query pack with smaller set of queries will complete faster
		- As of [v2.10.5](https://github.com/github/codeql-action/releases/tag/codeql-bundle-20220908) - Query Suite Counts
			- code-scanning (default) - 49 queries
			- security-extended - 66 queries
			- security-and-quality - 171 queries

- Micro Optimizations: Consider these as a potential quick hit to resolve a specific problem
	- Review workflow log timings to identify a any query that is taking a long time you can consider excluding it via a [CodeQL-config file](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/configuring-code-scanning#using-a-custom-configuration-file) 
		-  add a [query-filter](https://github.blog/changelog/2022-08-31-code-scanning-customize-your-codeql-analysis-using-query-filters/) to [exclude a specific query from analysis](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/configuring-code-scanning#excluding-specific-queries-from-analysis)
			
	- tweak the way CodeQL allocates memory to possibly make the workflow succeed in low memory conditions (for example, just below the runs-on field): [see sample](https://github.com/vulna-felickz/FullDotNetWebApp/pull/8/commits/263bbc8816a964d70f6267f6b6717f56b6bf6a1d)
		```yml
		env:
			CODEQL_ACTION_EXTRA_OPTIONS: '{"database": {"run-queries": ["--off-heap-ram=0"]}}'
		```

	- CodeQL will (by default) pull in source code from your dependencies using CIL extraction to assist in mapping out your data flows. While this can drastically improve the precision of the results, this can also lead to a large increase in database size.  You might consider disabling this feature for a quick scan but running a cron based scan with the option enabled.
	```yml  
		env:
		CODEQL_EXTRACTOR_CSHARP_OPTION_CIL: false
	```


## Vertical Scaling - Throw hardware at the software problem.  

Large applications can be compute/memory/disk bound as the base Actions runners are small instances (2core/8GBram/14GB SSD).  See the [recommended hardware requirements for CodeQL](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/recommended-hardware-resources-for-running-codeql) based on Codebase size.
-   Setup a [self-hosted CI action runner](https://docs.github.com/en/enterprise-cloud@latest/actions/hosting-your-own-runners/adding-self-hosted-runners#adding-a-self-hosted-runner-to-an-organization) in your infrastructure that has some more powerful specs that can handle your large application. 
- [Actions larger runners ](https://docs.github.com/en/actions/using-github-hosted-runners/using-larger-runners)
	   - This allows for up to a 64 core machine with 256GB RAM and 2040 GB of SSD storage

		
## Horizontal Scaling - Continue to decompose your solution.  

Making an investment in optimizing your build process can drastically speed up your developer experience, CI pipelines and start the process of "decomposing the monolith".  Continued investment in large or legacy applications is important to keep your security posture and dependencies up to date. Review the suggestions for [using domain-driven design to modernize your monolithic application](https://learn.microsoft.com/en-us/azure/architecture/microservices/migrate-monolith).    If you have already investigated removing projects from your solutions that you do not wish to expose to a security scan (test projects / demo code), then you have already begun this journey.

A great use case would be to filter separate solutions by front end (ex: Web.sln) and back end code(ex: API.sln) that are separated by process/network boundaries.  CodeQL can detect data flows through the code but once it reaches a process boundary the flow is stopped.  This creates a natural separation point for both feature development teams and security scans based data flows.  This would further enable a decrease in wall-clock scan time by using parallel per-solution scans using an [Actions matrix strategy](https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs) (such that each gets its own runtime and resources).  It will be important to include your common framework code in each solution so that you get a successful compilation while you further analyze other ways to share code.  
