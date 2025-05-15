## NPM Private Modules
The below example shows how you can pull dependencies from private npm registries.

### GitHub Actions Example

```yml
name: CodeQL
env:
NPM_REGISTRY_URL: '${{ secrets.NPM_REGISTRY_URL }}'
NPM_TOKEN: '${{ secrets.NPM_TOKEN }}'
NODE_VERSION: 16.x

jobs:
build:
runs-on: ubuntu-latest
steps:
- name: checks out code
uses: actions/checkout@v2
- name: Use Node.js
uses: actions/setup-node@v2
with:
always-auth: true
node-version: '${{env.NODE_VERSION}}'
registry-url: '${{env.NPM_REGISTRY_URL}}'
- name: Install dependencies
run: npm ci --ignore-scripts
env:
NODE_AUTH_TOKEN: '${{env.NPM_TOKEN}}'


# ... Start scanning
```

## NodeJS 

A minimum version of Node.js or higher must be installed and available on the PATH as node. See [additional software requirements](https://codeql.github.com/docs/codeql-overview/system-requirements/#additional-software-requirements)


### Could not start Node.js. It is required for TypeScript extraction.

```
2025-03-21T15:17:16.5636388Z [2025-03-21 11:17:16] [build-stderr] Could not start Node.js. It is required for TypeScript extraction.
2025-03-21T15:17:16.5643217Z [2025-03-21 11:17:16] [build-stderr] Please install Node.js and ensure 'node' is on the PATH.
2025-03-21T15:17:16.5645558Z [2025-03-21 11:17:16] [build-stderr] 	at com.semmle.ts.extractor.TypeScriptParser.startNodeAndGetVersion(TypeScriptParser.java:256)
2025-03-21T15:17:16.5676028Z [2025-03-21 11:17:16] [build-stderr] 	at com.semmle.ts.extractor.TypeScriptParser.verifyNodeInstallation(TypeScriptParser.java:217)
2025-03-21T15:17:16.5678667Z [2025-03-21 11:17:16] [build-stderr] 	at com.semmle.ts.extractor.TypeScriptParser.verifyInstallation(TypeScriptParser.java:178)
2025-03-21T15:17:16.5681439Z [2025-03-21 11:17:16] [build-stderr] 	at com.semmle.js.extractor.AutoBuild.verifyTypeScriptInstallation(AutoBuild.java:1190)
2025-03-21T15:17:16.5683831Z [2025-03-21 11:17:16] [build-stderr] 	at com.semmle.js.extractor.AutoBuild.extractTypeScript(AutoBuild.java:1033)
2025-03-21T15:17:16.5686297Z [2025-03-21 11:17:16] [build-stderr] 	at com.semmle.js.extractor.AutoBuild.extractSource(AutoBuild.java:758)
2025-03-21T15:17:16.5688572Z [2025-03-21 11:17:16] [build-stderr] 	at com.semmle.js.extractor.AutoBuild.run(AutoBuild.java:464)
2025-03-21T15:17:16.5690809Z [2025-03-21 11:17:16] [build-stderr] 	at com.semmle.js.extractor.AutoBuild.main(AutoBuild.java:1370)
```

Example to dynamically install node using the [actions/setup-node](https://github.com/actions/setup-node/) action:

```yaml
- uses: actions/checkout@v4
- uses: actions/setup-node@v4
... scan with codeql
```
