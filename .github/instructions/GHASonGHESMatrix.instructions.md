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

- **Inventory Features:** Look for any new features / functionality in these specific areas relating to GitHub Advanced Security / Code Security / Secret Protection / Advisory Database:
  - Secret Scanning
  - Code Scanning
  - Supply Chain (Dependabot Alerts/Advisory Database, Updates, Dependency Graph)
  - Security Overview
  - Administration (Security Configurations - only advanced security features or features with major security implications only)
    - do not put security configuration setup for specific features under the feature section - keep the security configuration under Administration!
- **Check Dependencies:** Note any changes to setup requirements (Actions, Connect, etc.) for the Dependencies section.

## 2. Analysis Guidelines
- **Public Preview vs. GA:** 
  - Identify if a feature is in Preview (mark with ☑️) or General Availability (mark with ✅).
  - Explicitly check if existing features have moved from Preview to GA in this release.
- **Significance Filter:**
  - **INCLUDE:** New functionality, new features, major gaps addressed, major architectural changes, new versions, counts.
  - **EXCLUDE:** Minor bug fixes, new versions of existing langagues/framework support added (ex: Go 1.25 or Swift 6.1.2), simple renames (e.g., "Generic" -> "Experimental"), or UI tweaks without functional impact.

## 3. Matrix Update Rules
- **New Column:** Always add a new column for the new version in *every* feature table, even if there are no specific changes for that table.
- **Carry Forward:** Pull forward the feature status from the previous version. Update the status icon only if it has changed (e.g., ☑️ to ✅).
- **New Rows:** Insert new rows for new features found during research.  Give the feature a few word summary, always prefer to deep link it to the docs/changelog for the new feature. Ensure the link renders appropriately to a docs page that describes the feature - otherwise fall back to changelog - otherwise fallback to no link.
- **End-of-Life Versions:** When a version's deprecation date has passed, it must be archived — not silently dropped. Archiving is a two-part operation that happens in the same change:
  1. **Copy** the EOL version's columns (Release date, Deprecation date, Notes, and every feature row's status icon) out of every table in `GHAS-on-GHES-feature-matrix.md` into a dated archive file at `advanced-security/archive/GHAS-on-GHES-feature-matrix-<YEAR>.md`, where `<YEAR>` is the calendar year of archiving. Create the file (as a self-contained snapshot with the title, intro, legend, and `## Release notes` heading) if it does not exist for that year; otherwise append the columns to the existing yearly archive file.
  2. **Remove** those version columns from every table in the active matrix and add a bullet to the "End of life Archive" section at the top linking to the archive file (e.g. `- [2026 GHES 3.14 - GHES 3.16](./advanced-security/archive/GHAS-on-GHES-feature-matrix-2026.md)`).
  Never remove a column without writing it to the archive first. A change that deletes columns but does not touch `advanced-security/archive/` is incorrect.
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
