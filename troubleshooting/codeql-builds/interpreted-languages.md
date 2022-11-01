# Scanning an interpreted language with CodeQL
* NOTE: This guide will focus on GitHub Actions but the concepts can be applied to the CodeQL CLI on other CI platforms.

## Language Specific Guidance
* [Python](interpreted-languages-python.md)


# Troubleshooting

## [ERROR] Spawned process exited abnormally (code 1; tried to run: [/opt/hostedtoolcache/CodeQL/<version>/x64/codeql/javascript/tools/autobuild.sh])

This is the higher level error handler for the autobuilder (in this case javascript)

```
[ERROR] Spawned process exited abnormally (code 1; tried to run: [/opt/hostedtoolcache/CodeQL/0.0.0-20220401/x64/codeql/javascript/tools/autobuild.sh])
  A fatal error occurred: Exit status 1 from command: [/opt/hostedtoolcache/CodeQL/0.0.0-20220401/x64/codeql/javascript/tools/autobuild.sh]
  Error: The process '/opt/hostedtoolcache/CodeQL/0.0.0-20220401/x64/codeql/codeql' failed with exit code 2
  Error: The process '/opt/hostedtoolcache/CodeQL/0.0.0-20220401/x64/codeql/codeql' failed with exit code 2
      at toolrunnerErrorCatcher (/home/runner/work/_actions/github/codeql-action/v2/lib/toolrunner-error-catcher.js:86:19)
      at processTicksAndRejections (node:internal/process/task_queues:96:5)
      at async Object.extractScannedLanguage (/home/runner/work/_actions/github/codeql-action/v2/lib/codeql.js:519:13)
      at async createdDBForScannedLanguages (/home/runner/work/_actions/github/codeql-action/v2/lib/analyze.js:79:13)
      at async finalizeDatabaseCreation (/home/runner/work/_actions/github/codeql-action/v2/lib/analyze.js:96:5)
      at async runFinalize (/home/runner/work/_actions/github/codeql-action/v2/lib/analyze.js:259:5)
      at async run (/home/runner/work/_actions/github/codeql-action/v2/lib/analyze-action.js:78:9)
      at async runWrapper (/home/runner/work/_actions/github/codeql-action/v2/lib/analyze-action.js:212:9)
```

In your logs, look for an exception with the output `[build-stderr]`

## [build-stderr] java.lang.OutOfMemoryError: Java heap space
```
[build-stderr] Exception while extracting /home/runner/work/path/to/file/myfile.js.
[build-stderr] java.lang.OutOfMemoryError: Java heap space
[build-stderr] 	at java.base/java.util.HashMap.resize(Unknown Source)
[build-stderr] 	at java.base/java.util.HashMap.putVal(Unknown Source)
[build-stderr] 	at java.base/java.util.HashMap.put(Unknown Source)
[build-stderr] 	at java.base/java.util.HashSet.add(Unknown Source)
[build-stderr] 	at com.semmle.js.extractor.LocationManager.emitLocationsDefault(LocationManager.java:156)
[build-stderr] 	at com.semmle.js.extractor.LocationManager.emitFileLocation(LocationManager.java:146)
[build-stderr] 	at com.semmle.js.extractor.LocationManager.emitSnippetLocation(LocationManager.java:141)
[build-stderr] 	at com.semmle.js.extractor.LocationManager.emitNodeLocation(LocationManager.java:126)
[build-stderr] 	at com.semmle.js.extractor.LexicalExtractor.extractTokens(LexicalExtractor.java:166)
[build-stderr] 	at com.semmle.js.extractor.JSExtractor.extract(JSExtractor.java:113)
[build-stderr] 	at com.semmle.js.extractor.JSExtractor.extract(JSExtractor.java:59)
[build-stderr] 	at com.semmle.js.extractor.ScriptExtractor.extract(ScriptExtractor.java:85)
[build-stderr] 	at com.semmle.js.extractor.FileExtractor.extractContents(FileExtractor.java:545)
[build-stderr] 	at com.semmle.js.extractor.FileExtractor.extract(FileExtractor.java:452)
[build-stderr] 	at com.semmle.js.extractor.AutoBuild.doExtract(AutoBuild.java:1122)
[build-stderr] 	at com.semmle.js.extractor.AutoBuild.lambda$extract$8(AutoBuild.java:1106)
[build-stderr] 	at com.semmle.js.extractor.AutoBuild$$Lambda$29/0x00000008000d4950.run(Unknown Source)
[build-stderr] 	at java.base/java.util.concurrent.CompletableFuture$AsyncRun.run(Unknown Source)
[build-stderr] 	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)
[build-stderr] 	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)
[build-stderr] 	at java.base/java.lang.Thread.run(Unknown Source)
```

It is best to use the [paths-ignore](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/configuring-code-scanning#specifying-directories-to-scan) feature to exclude the file opencv.js. It would look something like this:

```yml
paths-ignore:
  - '**/myfile.js'
```

In general, when a repository contains a huge JS file that is output of a compiler/bundler process, it is best to exclude it. As an example: opencv.js is from the OpenCV project, it which case it is the result of translating some C++ code to JS using Emscripten. This source code is unreadable and it wouldn't be helpful to get code scanning alerts in such files anyway.

References:
- https://github.com/github/codeql/issues/9056#issuecomment-1120793848