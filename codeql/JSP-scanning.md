[JSP (Jakarta Server Pages / Java Server Pages)](https://en.wikipedia.org/wiki/Jakarta_Server_Pages) which is a Java server-side template rendering framework used heavily in the Java world.

We don't have a full support of JSP, that said the CodeQL Product team have added support which currently is in Beta under feature flag support.
Because of this the product team would love feedback from any customer that enables this feature.

This is a guide to explain how to enable JSP support and where to provide feedback to the product team to make any improvements to this new feature.

## Features / Limitations

The following features and limitations should be considered.

- We only support (intercept) the Jasper JSP compiler.
  - For other compilers, JSP files may not be extracted.
- Only JSP files actually configured to be pre-compiled as part of the build using Jasper will be extracted
  - In the same way that we only extract Java files that are compiled as part of the build
- Extraction can be slow if there are many JSP files because the JSP pre-compilation compiles one file at a time
    - You may see a pause in the build logs where the JSP pre-compilation happens.
- When viewing results, locations are mapped between raw JSP files and generated Java files

## Enabling JSP Support

To enable JSP support, please make sure you are using the latest version on CodeQL CLI or using Actions in the Cloud (up to date).

### Step: 0: Enabling for Actions

```yaml

env:
  CODEQL_EXTRACTOR_JAVA_JSP: true
# ...
jobs:
  analysis:
    # ...
    steps:
    # ...
    - name: Initialize CodeQL
      uses: github/codeql-action/init@v4
      with:
        languages: java
    # ...
    - name: Perform CodeQL Analysis
      uses: github/codeql-action/analyze@v3
```

### Step 0: Enabling for the CLI

```bash
export CODEQL_EXTRACTOR_JAVA_JSP=true
# ...
codeql database create \
  --language="java" \
  ./.codeql-db/codeql-java
# ...
```

### Step 1: Compiling JSP / JSTL

In a lot of cases JSP isn't pre-compiled by Jasper compiler so we have to get the compile to execute and compile the JSP templates to generate Java code.

**Example using Maven:**

```xml
<!-- ... -->
<plugin>
  <groupId>io.leonard.maven.plugins</groupId>
  <artifactId>jspc-maven-plugin</artifactId>
  <!-- This version depends vastly on what technologies are being used:
       - Tomcat 9: 3.2.0
  -->
  <version>3.3.4</version>
  <executions>
    <execution>
      <id>jspc</id>
      <goals>
        <goal>compile</goal>
      </goals>
      <configuration>
        <suppressSmap>false</suppressSmap>
      </configuration>
    </execution>
  </executions>
</plugin>
<!-- ... -->
```

### Step 2: Configure Workflow


```yaml
# Initializes the CodeQL tools for scanning.
- name: Initialize CodeQL
  uses: github/codeql-action/init@v3
  with:
    languages: ${{ matrix.language }}
    # https://github.com/GitHubSecurityLab/CodeQL-Community-Packs/tree/main/java/src/security/CWE-079
    queries: +githubsecuritylab/CodeQL-Community-Packs/java/src/security/CWE-079/XSSJSP.ql@main
    # [optional] Or add the Community Pack
    packs: githubsecuritylab/codeql-java-queries
# ...
- name: Perform CodeQL Analysis
  uses: github/codeql-action/analyze@v3
  with:
    # To help with mapping files
    # [note]: This will be depricated in the future
    # https://github.com/github/codeql-action/blob/4c3e5362829f0b0bb62ff5f6c938d7f95574c306/analyze/action.yml#L33-L41
    add-snippets: true
```

**Resources:**

- https://leonardehrenfried.github.io/jspc-maven-plugin/compile-mojo.html
- https://stackoverflow.com/tags/jstl/info
- https://docs.spring.io/spring-framework/docs/3.2.x/spring-framework-reference/html/view.html
- https://stackoverflow.com/questions/13648357/the-formform-tag-declares-that-it-accepts-dynamic-attributes-but-does-not-imple
- https://stackoverflow.com/questions/4928271/how-to-install-jstl-the-absolute-uri-http-java-sun-com-jstl-core-cannot-be-r#answers
