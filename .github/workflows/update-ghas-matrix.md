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
  cache-memory:
network:
  allowed:
    - github
    - codeql.github.com
safe-outputs:
  create-pull-request:
    max: 1
    preserve-branch-name: true
---

# Update GHAS-on-GHES Feature Matrix

You are responsible for keeping the `GHAS-on-GHES-feature-matrix.md` document up to date with the latest GitHub Enterprise Server (GHES) Advanced Security features.

## Instructions Reference

Before making any changes, read the copilot instructions file at `.github/instructions/GHASonGHESMatrix.instructions.md` in this repository. Follow all guidelines in that file for research, analysis, significance filtering, and matrix update rules.

## Your Task

### Step 1: Load Previous State from Cache

Check cache-memory for a file named `ghas-matrix-state.json`. If it exists, read it. This file tracks:
- `last_checked`: Timestamp of the last run (use filesystem-safe format `YYYY-MM-DD-HH-MM-SS`)
- `latest_major_version`: The highest major GHES version already documented in the matrix
- `checked_patch_versions`: Object mapping each major version to the latest patch version already reviewed (e.g., `{"3.19": "3.19.4", "3.18": "3.18.6"}`)
- `omitted_features`: List of features previously seen but intentionally excluded (to avoid re-evaluation)

If the file does not exist, this is the first run — proceed without prior state.

### Step 2: Determine Current State

Read `GHAS-on-GHES-feature-matrix.md` and identify:
- The **latest major GHES version** currently documented (look at the column headers in the Release Notes table)
- The **oldest version** still in the matrix
- Any versions that have passed their deprecation date

### Step 3: Check for New GHES Versions

Fetch the all-releases page to discover if any new GHES versions exist beyond what's documented:
- URL: `https://docs.github.com/en/enterprise-server/admin/all-releases`

Compare the versions listed on that page against the columns in the current matrix. If a new major version exists (e.g., 3.20 when the matrix only goes to 3.19), this is a **new version update**.

### Step 4: Check Minor/Patch Version Release Notes

For each currently supported major version in the matrix, check the release notes for significant Advanced Security changes in recent patch releases:
- URL pattern: `https://docs.github.com/en/enterprise-server@<VERSION>/admin/release-notes`

If you have cache state from Step 1, only check patch versions **newer** than what was previously reviewed (e.g., if `checked_patch_versions["3.19"]` is `"3.19.4"`, only look at 3.19.5+). Also skip any features listed in `omitted_features` from cache — they were already evaluated and excluded.

Look specifically for:
- Features moving from Public Preview (☑️) to General Availability (✅)
- New Advanced Security capabilities being backported to existing versions
- Important deprecations or breaking changes

### Step 5: Evaluate Significance

Apply the significance filter from the instructions file:
- **INCLUDE:** New functionality, major gaps addressed, Preview→GA transitions, new CodeQL toolcache versions, partner pattern count changes, new versions, counts
- **EXCLUDE:** Minor bug fixes, new language/framework version support (e.g., Go 1.25, Swift 6.2), simple renames, UI tweaks without functional impact

If there are no significant changes found, **do not create a PR**. Simply note that the matrix is up to date and exit.

### Step 6: Make Updates

If significant changes were found, follow the matrix update rules from the instructions:

1. **For new major versions:** Add a new column to *every* table. Carry forward the previous version's status. Update specific features based on the release notes.
2. **For minor version changes:** Update the relevant cells in existing columns (e.g., change ☑️ to ✅ when a feature goes GA in a patch release).
3. **For new features:** Add new rows with descriptive names and deep-linked documentation URLs.

For CodeQL toolcache versions, check: `https://docs.github.com/en/enterprise-server@<VERSION>/admin/managing-code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance`

For secret scanning partner pattern counts, check: `https://docs.github.com/en/enterprise-server@<VERSION>/code-security/secret-scanning/introduction/supported-secret-scanning-patterns`

### Step 7: Save State to Cache

Before finishing (whether or not a PR was created), write the updated state to cache-memory as `ghas-matrix-state.json`:
- `last_checked`: Current timestamp in `YYYY-MM-DD-HH-MM-SS` format (no colons, no T, no Z)
- `latest_major_version`: The highest major GHES version now documented
- `checked_patch_versions`: Updated with the latest patch version reviewed for each major version
- `omitted_features`: Merge any newly omitted features with the previous list

### Step 8: Create Pull Request

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
