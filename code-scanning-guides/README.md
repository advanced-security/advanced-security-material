# Code Scanning Guides

This directory contains comprehensive guides and resources for GitHub Advanced Security Code Scanning and CodeQL.

## Directory Structure

### 📊 [CodeQL Mappings](./codeql-mappings/)
Security framework and vulnerability catalog mappings for CodeQL queries:
- **[OWASP Top 10 2025](./codeql-mappings/OWASP2025-CodeQL.md)** - Mapping between OWASP Top 10 2025 vulnerabilities and CodeQL queries via CWE identifiers
- **[MITRE Top 10 KEV](./codeql-mappings/MITRETop10KEV.md)** - Mapping between MITRE Top 10 Known Exploited Vulnerabilities and CodeQL queries
- **[SANS Top 25](./codeql-mappings/SANS25-CodeQL.md)** - Mapping between SANS Top 25 Software Errors and CodeQL queries

### 🔧 Setup & Configuration
- **[Setup CodeQL CLI](./setup-codeql-cli.md)** - Guide for setting up the CodeQL CLI
- **[Uploading PR Analysis](./uploading-pr-analysis.md)** - How to upload CodeQL analysis results for pull requests
- **[Sandwich Tracing](./sandwich-tracing.md)** - Advanced CodeQL tracing techniques

### 🔌 [Integrations](./integrations/)
- **[Third-Party Integrations](./integrations/code-scanning-third-party-integrations.md)** - Integrating Code Scanning with third-party tools

### 🧪 [Synthetic Applications](./synthetic-applications/)
Test applications for validating CodeQL and Code Scanning:
- **[OWASP WebGoat](./synthetic-applications/owasp-webgoat.md)** - Deliberately insecure web application for testing
- **[OWASP Juice Shop](./synthetic-applications/juice-shop.md)** - Modern vulnerable web application

## Getting Started

1. If you're looking for **security framework mappings** (OWASP, MITRE KEV, SANS), start with the [CodeQL Mappings](./codeql-mappings/) directory
2. For **setting up CodeQL**, see the [Setup CodeQL CLI](./setup-codeql-cli.md) guide
3. To **test CodeQL rules**, check out the [Synthetic Applications](./synthetic-applications/) directory

## Additional Resources

For more Advanced Security resources, see the parent repository's [README](../README.md).
