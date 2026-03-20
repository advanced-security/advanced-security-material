---
description: Weekly check for GHES Advanced Security release note updates to keep the GHAS feature matrix documentation current
on:
  schedule: weekly
  skip-if-match: "is:pr is:open update GHAS feature matrix in:title"
permissions:
  contents: read
  pull-requests: read
  issues: read
tools:
  github:
    toolsets: [default]
  web-fetch:
network:
  allowed:
    - github
    - codeql.github.com
safe-outputs:
  create-pull-request:
    max: 1
---

# Update GHAS-on-GHES Feature Matrix

You are responsible for keeping the `GHAS-on-GHES-feature-matrix.md` document up to date with the latest GitHub Enterprise Server (GHES) Advanced Security features.

## Instructions Reference

Before making any changes, read the copilot instructions file at `.github/instructions/GHASonGHESMatrix.instructions.md` in this repository. Follow all guidelines in that file for research, analysis, significance filtering, and matrix update rules.

## Your Task

### Step 1: Determine Current State

Read `GHAS-on-GHES-feature-matrix.md` and identify:
- The **latest major GHES version** currently documented (look at the column headers in the Release Notes table)
- The **oldest version** still in the matrix
- Any versions that have passed their deprecation date

### Step 2: Check for New GHES Versions

Fetch the all-releases page to discover if any new GHES versions exist beyond what's documented:
- URL: `https://docs.github.com/en/enterprise-server/admin/all-releases`

Compare the versions listed on that page against the columns in the current matrix. If a new major version exists (e.g., 3.20 when the matrix only goes to 3.19), this is a **new version update**.

### Step 3: Check Minor/Patch Version Release Notes

For each currently supported major version in the matrix, check the release notes for significant Advanced Security changes in recent patch releases:
- URL pattern: `https://docs.github.com/en/enterprise-server@<VERSION>/admin/release-notes`

Look specifically for:
- Features moving from Public Preview (☑️) to General Availability (✅)
- New Advanced Security capabilities being backported to existing versions
- Important deprecations or breaking changes

### Step 4: Evaluate Significance

Apply the significance filter from the instructions file:
- **INCLUDE:** New functionality, major gaps addressed, Preview→GA transitions, new CodeQL toolcache versions, partner pattern count changes, new versions, counts
- **EXCLUDE:** Minor bug fixes, new language/framework version support (e.g., Go 1.25, Swift 6.2), simple renames, UI tweaks without functional impact

If there are no significant changes found, **do not create a PR**. Simply note that the matrix is up to date and exit.

### Step 5: Make Updates

If significant changes were found, follow the matrix update rules from the instructions:

1. **For new major versions:** Add a new column to *every* table. Carry forward the previous version's status. Update specific features based on the release notes.
2. **For minor version changes:** Update the relevant cells in existing columns (e.g., change ☑️ to ✅ when a feature goes GA in a patch release).
3. **For new features:** Add new rows with descriptive names and deep-linked documentation URLs.

For CodeQL toolcache versions, check: `https://docs.github.com/en/enterprise-server@<VERSION>/admin/managing-code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance`

For secret scanning partner pattern counts, check: `https://docs.github.com/en/enterprise-server@<VERSION>/code-security/secret-scanning/introduction/supported-secret-scanning-patterns`

### Step 6: Create Pull Request

Create a pull request with:
- **Title:** "Update GHAS feature matrix for GHES <version(s)>"
- **Branch name:** Use a descriptive branch name like `update-ghas-matrix-<version>`
- **Body:** Include:
  - Summary of what changed and why
  - Release metadata (release date, deprecation date, CodeQL toolcache version) for any new major versions
  - List of features added or updated, grouped by section (Secret Protection, Code Scanning, etc.)
  - **Omissions:** Explicitly list features seen in release notes but excluded per the significance filter
  - A link to the rendered markdown: `https://github.com/${{ github.repository }}/blob/<branch-name>/GHAS-on-GHES-feature-matrix.md`
- **Labels:** Add the label `ghas-matrix-update` if it exists

### Important Notes

- Only create a PR if there are actual meaningful changes to make. Do not create empty or trivial PRs.
- When adding new columns, ensure you add the column to ALL tables in the document (Release Notes, Secret Protection, Code Scanning, Dependabot Alerts, Dependabot Updates, Dependency Graph, Security Overview, Administration).
- Preserve the existing markdown table formatting and alignment.
- Do not modify the Dependencies table at the bottom unless there are actual dependency requirement changes.
