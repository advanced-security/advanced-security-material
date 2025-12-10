---
applyTo: "GHAS-on-GHES-feature-matrix.md"
---

You are an expert technical writer and product specialist for GitHub Advanced Security (GHAS) on GitHub Enterprise Server (GHES).

When asked to update this Advanced Security feature matrix for a new GHES version, follow this strict procedure:

## 1. Research Phase
- **Identify the Version:** Determine the specific GHES version number requested (e.g., 3.16).
- **Consult Release Inventory:** Read the official start/end/docs/releasenote information for all versions at `End of life dates at: https://docs.github.com/en/enterprise-server/admin/all-releases#releases-of-github-enterprise-server`.
- **Consult Release Notes:** Read the official release notes at `https://docs.github.com/en/enterprise-server@<VERSION>/admin/release-notes`.
- **Specifics**
  - CodeQL version included in the runner toolcache is located in this document: https://docs.github.com/en/enterprise-server@<VERSION>/admin/managing-code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance#provisioning-the-actions-for-code-scanning
  - Secret Scanning pattern counts are easily discovered for the GHES VERSION by running this script on the public docs for secret scanning pattern list: https://github.com/felickz/scripts/blob/main/pwsh/Count-SecretScanningPatterns.ps1

- **Inventory Features:** Look for changes in these specific areas relating to GitHub Advanced Security:
  - Secret Scanning
  - Code Scanning
  - Supply Chain (Dependabot Alerts, Updates, Dependency Graph)
  - Security Overview
  - Administration (Security Configurations - only advanced security features or features with major security implications only)
    - do not put security configuration setup for specific features under the feature section - keep the security configuration under Administration!
- **Check Dependencies:** Note any changes to setup requirements (Actions, Connect, etc.) for the Dependencies section.

## 2. Analysis Guidelines
- **Public Preview vs. GA:** 
  - Identify if a feature is in Preview (mark with ☑️) or General Availability (mark with ✅).
  - Explicitly check if existing features have moved from Preview to GA in this release.
- **Significance Filter:**
  - **INCLUDE:** New functionality, major gaps addressed, major architectural changes, new versions, counts.
  - **EXCLUDE:** Minor bug fixes, new versions of existing langagues/framework support added (ex: Go 1.25 or Swift 6.1.2), simple renames (e.g., "Generic" -> "Experimental"), or UI tweaks without functional impact.

## 3. Matrix Update Rules
- **New Column:** Always add a new column for the new version in *every* table, even if there are no specific changes for that table.
- **Carry Forward:** Pull forward the feature status from the previous version. Update the status icon only if it has changed (e.g., ☑️ to ✅).
- **New Rows:** Insert new rows for new features found during research.  Give the feature a few word summary, always prefer to deep link it to the docs for the new feature.

## 4. Pull Request & Output Instructions
When generating the Pull Request description or summary of changes:
- **List Omissions:** Explicitly list any advanced security / security features you saw in the release notes but decided *not* to include in the matrix. This helps the reviewer confirm if they should be added.
- **Rendered Link:** Include a link to the rendered view of the Markdown file so the reviewer can easily visualize the table columns.
