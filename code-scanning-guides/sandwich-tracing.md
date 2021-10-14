### Getting started with CodeQL sandwich tracing

Let's learn how to sandwich trace via the CodeQL CLI on our local machines. First let's download the CodeQL bundle! Head over here and download the approprate bundle for your OS: https://github.com/github/codeql-action/releases
Once it's downloaded, untar the content to a CodeQL home folder and you can add CodeQL to your path if you'd like

```
export PATH="/Documents/codeql-home/codeql:$PATH"
```

Check to make sure you can use the CodeQL CLI

```
codeql --version
```

Now we need to use the CodeQL CLI on an actual repository. Let's start here with our GHAS training material: https://github.com/ghas-bootcamp/ghas-bootcamp
There's multiple languages being used here, so for the purposes of this tutorial let's try to scan the Go portions of the codebase. Make sure you have the supported version of Go: https://codeql.github.com/docs/codeql-overview/supported-languages-and-frameworks/

Clone this repository and `cd` into it. 

The first thing we gotta do when it comes to sandwich tracing is to init the CodeQL tools and provide a skeleton of the CodeQL database content.

```
codeql database init db-go --language=go --source-root . --begin-tracing
```

The output of the command looks something like this:

```
Resolving extractor go.
Successfully loaded extractor Go (go) from /Documents/codeql-home/codeql/go.
Created CodeQL database at /Documents/ghas-bootcamp/db-go.
In order to initialise tracing, some environment variables need to be set in the shell your build will run in.
A number of scripts to do this have been created in /Documents/ghas-bootcamp/db-go/temp/tracingEnvironment.
Please run one of these scripts before invoking your build command.

Based on your operating system, we recommend you run:
source /Documents/ghas-bootcamp/db-go/temp/tracingEnvironment/start-tracing.sh
```

As it suggests, let's source some environment variables! 

```
source /Documents/ghas-bootcamp/db-go/temp/tracingEnvironment/start-tracing.sh
```

These environment variables are needed for tracing. The next thing we need to do is extract the Go source code. CodeQL has built in tools to do this for you automatically via an `autobuild.sh` script. Let's use that here like so:

```
/Documents/codeql-home/codeql/go/tools/autobuild.sh
```


We're almost there to analyze land! Last thing we gotta do is wrap up the database with our finalize command:

```
codeql database finalize db-go
```

Within your codeql database directory (in this case `db-go`) you should notice a `db-go` directory which contains the db schemes and a `src.zip` which contains the source that was extracted.

Now to analysis... let's reference our `db-go` and other parameters in the `analyze` command:

```
codeql database analyze db-go go-security-and-quality.qls --format=sarif-latest --output=codeql-go-results.sarif
```

There are three query suites we can choose from:

- `$CODEQL_SUPPORT_LANGUAGE-code-scanning.qls`
- `$CODEQL_SUPPORT_LANGUAGE-security-extended.qls`
- `$CODEQL_SUPPORT_LANGUAGE-security-and-quality.qls`

If you have the CodeQL bundle on path, you can reference these query suites by their filenames. If you don't, you can use the full path to the query suite 🎉 The CodeQL bundle contains the cached queries, so the "compiling" process is pretty fast. You'll then notice the queries being evaluated, and then the results are written to the SARIF file.

You can inspect the SARIF file and see if the results array is empty or non-empty. 

When you're ready to upload the SARIF to the proper repository, use this command with the proper values for each required parameter:

```
codeql github upload-results --repository=$GITHUB_REPOSITORY --ref=$GITHUB_REF --commit=$GITHUB_SHA --sarif=codeql-go-results.sarif --github-auth-stdin=<YOUR TOKEN>
``` 

### Notes about sandwich tracing

This is a _very simple_ example of how to sandwich trace and normally you wouldn't call out the `autobuild.sh` script for interpreted languages + Go, but when should you actually use sandwich tracing? Use it when:
  - [Autobuilding](https://codeql.github.com/docs/codeql-cli/creating-codeql-databases/#detecting-the-build-system) doesn't work on your codebase via the [first method of using the CLI](https://github.com/advanced-security/advanced-security-material/blob/main/code-scanning-guides/setup-codeql-cli.md)
  - You're not able to specify a [command line for the build](https://codeql.github.com/docs/codeql-cli/creating-codeql-databases/#specifying-build-commands).
