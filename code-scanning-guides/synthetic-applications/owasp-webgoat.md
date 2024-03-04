# OWASP WebGoat

[A full Actions workflow can be found here](./owasp-webgoat.yml)

## Common Issues

Scanning OWASP WebGoat can have some issues right out of the box where CodeQL might find very little or worse not find anything at all.
This is due to the following:

1. WebGoat uses JDK 17
    - Action uses a different JDK by default.  Use the `actions/setup-java` action.
2. Uses Project Lombok
    - [support added to CodeQL natively in v2.14.4](https://github.blog/changelog/2023-09-01-code-scanning-with-codeql-improves-support-for-java-codebases-that-use-project-lombok/)
3. Dependencies are not all present in Dependency Graph
    - Using [Submission API](https://docs.github.com/en/enterprise-cloud@latest/code-security/supply-chain-security/understanding-your-software-supply-chain/using-the-dependency-submission-api#using-pre-made-actions)    
4. Vulnerabilities not detected. 
    - Enhance CodeQL to use a custom configuration file that broadens the threat model and pulls in additional expirmental, low precision, and community packs/queries. Note that this may include alerts with elevated false positive rates due to lower precision.
        - See: [Synthetics.yml](https://github.com/GitHubSecurityLab/CodeQL-Community-Packs/tree/main/configs#synthetics)
        - The default threat model includes remote sources of untrusted data.  This config will also [expand the threat model to include local sources](https://docs.github.com/en/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/customizing-your-advanced-setup-for-code-scanning#extending-codeql-coverage-with-threat-models): `threat-models: local`
