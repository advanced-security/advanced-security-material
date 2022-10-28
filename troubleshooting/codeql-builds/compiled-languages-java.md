
# Private Package Registries

## The codeql for java is failing when it tries to do mvn command and tries to access a artifactory repo where our pom.xml are stored.

Assuming the given package registry instance is publicly accessible:


Option 1 - Pass credentials via environment variable from Actions secrets and configure Maven settings to utilize those credentials (see sample [here](https://github.com/actions/setup-java/blob/main/docs/advanced-usage.md#yaml-example))

ex `workflow.yml` step:
```yml
      env:
        MAVEN_USERNAME: maven_username123
        MAVEN_CENTRAL_TOKEN: ${{ secrets.MAVEN_CENTRAL_TOKEN }}
```

ex `settings.xml`
```xml
    <server>
      <id>maven</id>
      <username>${env.MAVEN_USERNAME}</username>
      <password>${env.MAVEN_CENTRAL_TOKEN}</password>
    </server>
```

Option 2 - Use the [maven-settings-action](https://github.com/s4u/maven-settings-action) to dynamically create/overrite a `settings.xml` that contains the credentials for your specified package manager.

```yml
- if: matrix.language == 'java'
      name: Configure maven credentials
      uses: s4u/maven-settings-action@v2.6.0
      with:
        servers: '[{"id": "central", "username": "${{ secrets.MAVEN_USERNAME }}", "password": "${{ secrets.MAVEN_CENTRAL_TOKEN }}"}]'
```

# Build Failures

## java.lang.IllegalArgumentException: Unsupported class file major version ##

Ensure you are compiling your java application using CodeQL tracing on a supported version of the JDK as found here: https://codeql.github.com/docs/codeql-overview/supported-languages-and-frameworks/

## Fatal error compiling: error: invalid target release: \## 

Specify your [desired java version via the setup-java action](https://github.com/actions/setup-java#supported-version-syntax)
```yml
 uses: actions/setup-java@v3
 with:
     java-version: 17
     distribution: 'microsoft'
```