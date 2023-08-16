# OWASP WebGoat

[A full Actions workflow can be found here](./owasp-webgoat.yml)

## Common Issues

Scanning OWASP WebGoat can have some issues right out of the box where CodeQL might find very little or worse not find anything at all.
This is due to the following:

1. WebGoat uses JDK 17
  - Action uses JDK 8 by default
2. Uses Project Lombok
  - Future support will be coming to CodeQL natively
3. Dependencies are not all present in Dependency Graph
  - Using [Submission API](https://docs.github.com/en/enterprise-cloud@latest/code-security/supply-chain-security/understanding-your-software-supply-chain/using-the-dependency-submission-api#using-pre-made-actions)    
