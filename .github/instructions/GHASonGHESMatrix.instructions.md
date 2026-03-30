---
applyTo: "GHAS-on-GHES-feature-matrix.md"
---

You are an expert technical writer and product specialist for GitHub Advanced Security (GHAS) on GitHub Enterprise Server (GHES).

When asked to update this Advanced Security feature matrix for a new GHES version, follow this strict procedure:

## 1. Research Phase
- **Identify the Version(s):** Determine the specific GHES version number(s) to check.
  - If a version is specified by a user, use that version.
  - If running as an automated workflow (no user-specified version), compare the versions currently documented in the matrix against the all-releases page to detect any new major versions or recent patch releases.
- **Consult Release Inventory:** Read the official start/end/docs/releasenote information for all versions at `https://docs.github.com/en/enterprise-server/admin/all-releases#releases-of-github-enterprise-server`.
- **Consult Release Notes:** Read the official release notes at `https://docs.github.com/en/enterprise-server@<VERSION>/admin/release-notes`.
- **Consult the GHES GA announcement blog post:** Check `https://github.blog/changelog/` for a post titled "GitHub Enterprise Server X.XX is now generally available" — this often summarizes the most notable GHAS features in plain language and may highlight items not obvious from the structured release notes.
- **Consult the GitHub community discussion:** Check `https://github.com/orgs/community/discussions` for the GHES X.XX GA announcement thread, which typically lists key highlights including security features.
- **Check Minor/Patch Versions:** For each currently documented major version that is still supported, check the release notes page for recent patch releases (e.g., 3.19.3 → 3.19.4) that may include significant Advanced Security feature changes such as features moving from Preview to GA, new capabilities being backported, or important security fixes.
- **Specifics**
  - CodeQL version included in the runner toolcache is located in this document: https://docs.github.com/en/enterprise-server@<VERSION>/admin/managing-code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance#provisioning-the-actions-for-code-scanning
  - Secret Scanning pattern counts are easily discovered for the GHES VERSION by running this script on the public docs for secret scanning pattern list: https://github.com/felickz/scripts/blob/main/pwsh/Count-SecretScanningPatterns.ps1

- **Inventory Features:** Look for changes in these specific areas relating to GitHub Advanced Security:
  - Secret Scanning — including but not limited to: validity checks, enterprise-level push protection bypass controls, new detector types, expanded push protection coverage, alert management improvements
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
- **New Column:** Always add a new column for the new version in *every* feature table, even if there are no specific changes for that table.
- **Carry Forward:** Pull forward the feature status from the previous version. Update the status icon only if it has changed (e.g., ☑️ to ✅).
- **New Rows:** Insert new rows for new features found during research.  Give the feature a few word summary, always prefer to deep link it to the docs for the new feature.
- **End-of-Life Versions:** When a version has passed its deprecation date, consider whether it should be archived. The document uses an archive pattern — see the "End of life Archive" section at the top of the matrix. Do not remove columns without moving them to the archive first.
- **Dependencies Table:** The Dependencies table at the bottom of the document has a **different column structure** (Feature, GHAS license, Actions, Connect, Documentation, Notes). Do **NOT** add GHES version columns to it. Only modify the Dependencies table if there are actual dependency requirement changes.

## 4. Table Formatting Validation
**CRITICAL:** After making any edits, you MUST validate that all markdown tables still render correctly. Broken tables are the most common mistake when editing this file.

**Validation rules:**
1. Every row in a table must have the **same number of pipe (`|`) characters** as the header row of that table.
2. The separator row (`|---|---|...`) must have exactly as many column separators as the header.
3. The document contains **multiple independent tables** with different column counts — verify each table independently.
4. Do not add or remove pipe characters from any table row without updating the entire table to match.

**To validate,** count the pipes in each row and confirm consistency within each table. You can run this check with:
```bash
awk '/^\|/ { n=gsub(/\|/,"&"); if (prev>0 && n!=prev) printf "ERROR line %d: expected %d pipes, got %d: %s\n", NR, prev, n, $0; prev=n } /^[^|]/ { prev=0 }' GHAS-on-GHES-feature-matrix.md
```

If any table has inconsistent column counts, fix them before committing or creating a PR.

## 5. Pull Request & Output Instructions
When generating the Pull Request description or summary of changes:
- **List Omissions:** Explicitly list any advanced security / security features you saw in the release notes but decided *not* to include in the matrix. This helps the reviewer confirm if they should be added.
- **Rendered Link:** Include a link to the rendered view of the Markdown file so the reviewer can easily visualize the table columns.
- **Version Context:** When updating for a new major version, include the release date, deprecation date, and CodeQL toolcache version in the PR description.
- **Duplicate Check:** Before creating a PR, check if there is already an open PR updating the matrix for the same version(s). If so, skip creating a duplicate.
