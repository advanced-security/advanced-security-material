# OWASP WebGoat

[A full Actions workflow can be found here](./owasp-webgoat-codeql.yml)

## Common Issues

Scanning OWASP WebGoat can have some issues right out of the box where CodeQL might find very little or worse not find anything at all.
This is due to the following:

1. WebGoat uses JDK 11
  - Action uses JDK 8 by default
2. Uses Project Lombok
  - Future support will be coming to CodeQL natively
