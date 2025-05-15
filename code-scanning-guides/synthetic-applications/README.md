# Synthetic Applications

## What are Synthetic Applications?

Synthetic applications are a type of application that is not a real application but is created for the purpose of testing and validating the functionality of a SAST solution.
They are often used in scenarios where real applications are not available or practical to use, such as in testing environments or for demonstration purposes.

## Enaling Additional Queries

The quickest optional to extend CodeQL for Synthetic Applications is using [the GitHub SecurityLab query packs](https://github.com/GitHubSecurityLab/CodeQL-Community-Packs).

### GitHub Actions

1. [Switch to "Advanced Setup"](https://docs.github.com/en/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/configuring-advanced-setup-for-code-scanning)
2. Update the `github/codeql-action/init` step with the following setting:

```yaml
- name: Initialize CodeQL
  uses: github/codeql-action/init@v3
  with:
    # ...
    config-file: GitHubSecurityLab/CodeQL-Community-Packs/configs/synthetics.yml@main
```

Once run this will pull in additional queries and another configuration options for the application.

## List of Guides

| Name                 | Link / Repository                                             | Docs                       | Workflow                        |
| -------------------- | ------------------------------------------------------------- | -------------------------- | ------------------------------- |
| OWASP WebGoat (Java) | [GitHub Repository](https://github.com/WebGoat/WebGoat)       | [Docs](./owasp-webgoat.md) | [Workflow](./owasp-webgoat.yml) |
| Juice Shop           | [GitHub Repository](https://github.com/juice-shop/juice-shop) | [Docs](./juice-shop.md)    | [Workflow](./juice-shop.yml)    |
