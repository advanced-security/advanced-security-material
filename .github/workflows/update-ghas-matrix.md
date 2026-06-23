---
description: Weekly check for GHES Advanced Security release note updates to keep the GHAS feature matrix documentation current
on:
  schedule: weekly
  skip-if-match: "is:pr is:open update GHAS feature matrix in:title"
permissions:
  contents: read
  pull-requests: read
  issues: read
  copilot-requests: write
timeout-minutes: 45
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

# AW: Update GHAS-on-GHES Feature Matrix

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
- **INCLUDE:** New functionality, new features, major gaps addressed, Preview→GA transitions, new CodeQL toolcache versions, partner pattern count changes, new versions, counts
- **EXCLUDE:** Minor bug fixes, new language/framework version support (e.g., Go 1.25, Swift 6.2), simple renames, UI tweaks without functional impact


If there are no significant feature changes found **and** no versions are due to be archived (see Step 6), **do not create a PR**. Call `noop` with a message explaining that the matrix is already up to date and what was checked. Note: archiving an EOL version (Step 6) is itself a reason to open a PR even when no new features were found.

### Step 6: Archive End-of-Life Versions

Before adding or updating any feature rows, deal with versions that have reached end of life (EOL).

A version is EOL when its **Deprecation date** (see the Release notes table) is on or before today's date. Use the all-releases page to confirm dates if needed.

**You must never delete a version column without first copying it into the archive.** Archiving is a two-part operation — write the archive file *and* remove the columns — and both parts must happen in the same PR.

1. **Identify EOL versions.** From the Release notes table in `GHAS-on-GHES-feature-matrix.md`, collect every version whose Deprecation date has passed. If none have passed, skip this step entirely.

2. **Choose the archive file.** Archives live in `advanced-security/archive/` and are named by the calendar year in which the versions are archived: `GHAS-on-GHES-feature-matrix-<YEAR>.md` (e.g. `GHAS-on-GHES-feature-matrix-2026.md`, where `<YEAR>` is the current year of this run).
   - If that file does **not** exist yet, create it. Start it as a self-contained snapshot by copying the document title, intro, "How do I read this document?" legend, and the `## Release notes` heading from the active matrix.
   - If that file **already** exists (a prior run this year already archived some versions), append the new columns to the existing tables in that file instead of creating a second file for the year.

3. **Copy the EOL columns into the archive file.** For **every** table in the active matrix (Release Notes, Secret Protection, Code Scanning, Dependabot Alerts, Dependabot Updates, Dependency Graph, Security Overview, Administration), copy the columns for the EOL versions — including the Release date, Deprecation date, and Notes rows and every feature row's status icon — exactly as they appear in the active matrix. This preserves the historical data. Do **not** copy the Dependencies table (it has no version columns).

4. **Remove the EOL columns from the active matrix.** Delete those version columns from ALL tables in `GHAS-on-GHES-feature-matrix.md`. After deletion, re-run the table-formatting validation from the instructions file to confirm every table still has consistent pipe counts.

5. **Update the "End of life Archive" section** at the top of `GHAS-on-GHES-feature-matrix.md`. Add a new bullet linking to the archive file you wrote, with a label describing the year and version range, e.g.:
   `- [2026 GHES 3.14 - GHES 3.16](./advanced-security/archive/GHAS-on-GHES-feature-matrix-2026.md)`
   Keep the existing archive bullets — each archive file gets its own entry.

6. **Confirm the archive folder change is staged.** The PR diff must include the new/updated file under `advanced-security/archive/`. If your changes only touch `GHAS-on-GHES-feature-matrix.md`, the archive step is incomplete — go back and write the archive file before opening the PR.

Archiving on its own (with no new feature additions) is a valid, meaningful change and should result in a PR.

### Step 7: Make Updates

If significant changes were found, follow the matrix update rules from the instructions:

1. **For new major versions:** Add a new column to *every* table. Carry forward the previous version's status. Update specific features based on the release notes.
2. **For minor version changes:** Update the relevant cells in existing columns (e.g., change ☑️ to ✅ when a feature goes GA in a patch release).
3. **For new features:** Add new rows with descriptive names and deep-linked documentation URLs.

Significant updates get a new row in the appropriate feature matrix.  The description should link to details when possible:
-  Favor a specific docs page (in case furture content is moved - https://docs.github.com/en/enterprise-server@latest is favored over a specific version to future proof EOL server versions in docs).  Review the https://docs.github.com/en/enterprise-server docs for that the given update to ensure the link is taking you a page where the appropriate feature is described. Ensure the link is taking you to an actual docs page, not a table of contents for more docs pages.
- Otherwise, point to a specific changelog link (under https://github.blog/changelog/) that lists out which version of GHES the feature will belong to.
- Finally, if there is no appropriate link that mentions the feature, then fallback to just a text description without a hyperlink.


For CodeQL toolcache versions, check: `https://docs.github.com/en/enterprise-server@<VERSION>/admin/managing-code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance`

For secret scanning partner pattern counts, check: `https://docs.github.com/en/enterprise-server@<VERSION>/code-security/secret-scanning/introduction/supported-secret-scanning-patterns`

### Step 8: Save State to Cache

Before finishing (whether or not a PR was created), write the updated state to cache-memory as `ghas-matrix-state.json`:
- `last_checked`: Current timestamp in `YYYY-MM-DD-HH-MM-SS` format (no colons, no T, no Z)
- `latest_major_version`: The highest major GHES version now documented
- `checked_patch_versions`: Updated with the latest patch version reviewed for each major version
- `omitted_features`: Merge any newly omitted features with the previous list

### Step 9: Create Pull Request

Create a pull request with:
- **Title:** "Update GHAS feature matrix for GHES <version(s)>"
- **Branch name:** Use a descriptive branch name like `update-ghas-matrix-<version>`
- **Body:** Include:
  - Summary of what changed and why
  - If versions were archived: list the archived versions, their deprecation dates, and link to the archive file that now holds them
  - Link to the release-notes
  - Release metadata (release date, deprecation date, CodeQL toolcache version) for any new major versions
  - List of features added or updated, grouped by section (Secret Protection, Code Scanning, etc.)
  - **Omissions:** Explicitly list features seen in release notes but excluded per the significance filter
  - A link to the rendered markdown: `https://github.com/${{ github.repository }}/blob/<branch-name>/GHAS-on-GHES-feature-matrix.md`
- **Labels:** Add the label `ghas-matrix-update` if it exists

### Important Notes

- Only create a PR if there are actual meaningful changes to make. Do not create empty or trivial PRs. (Archiving EOL versions counts as a meaningful change.)
- **Never remove a version column without first copying it into the dated archive file under `advanced-security/archive/`.** A PR that deletes columns from `GHAS-on-GHES-feature-matrix.md` but does not add/update a file in the archive folder is incomplete.
- When adding new columns, ensure you add the column to ALL tables in the document (Release Notes, Secret Protection, Code Scanning, Dependabot Alerts, Dependabot Updates, Dependency Graph, Security Overview, Administration).
- Preserve the existing markdown table formatting and alignment.
- Do not modify the Dependencies table at the bottom unless there are actual dependency requirement changes.
