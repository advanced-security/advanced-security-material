---
description: Weekly tracker that maps CodeQL bundle versions to language-specific query and library pack versions across all supported languages
on:
  schedule: weekly
  workflow_dispatch:
  skip-if-match: "is:pr is:open Update CodeQL version tracker in:title"
permissions:
  contents: read
  pull-requests: read
  issues: read
timeout-minutes: 45
tools:
  github:
    toolsets: [default]
  web-fetch:
  cache-memory:
network:
  allowed:
    - github
safe-outputs:
  create-pull-request:
    max: 1
    preserve-branch-name: true
---

# CodeQL Version Tracker

You are responsible for maintaining a version mapping page (`codeql/codeql-version-tracker.md`) that tracks the relationship between CodeQL bundle versions and the language-specific query/library pack versions included in each bundle.

## Background

The CodeQL bundle is released via the `github/codeql-action` repository. Each bundle release (tagged `codeql-bundle-v<VERSION>`) includes:
- A specific CodeQL CLI version
- Language-specific query packs (`codeql/<language>-queries`)
- Language-specific library packs (`codeql/<language>-all`)

The actual pack version numbers are found in the `qlpack.yml` files in the `github/codeql` repository at the corresponding tag `codeql-cli/v<VERSION>`.

## Languages to Track

Track these languages (each has a `-queries` and `-all` pack):
- **actions** — `actions/ql/src/qlpack.yml` and `actions/ql/lib/qlpack.yml`
- **cpp** — `cpp/ql/src/qlpack.yml` and `cpp/ql/lib/qlpack.yml`
- **csharp** — `csharp/ql/src/qlpack.yml` and `csharp/ql/lib/qlpack.yml`
- **go** — `go/ql/src/qlpack.yml` and `go/ql/lib/qlpack.yml`
- **java** — `java/ql/src/qlpack.yml` and `java/ql/lib/qlpack.yml`
- **javascript** — `javascript/ql/src/qlpack.yml` and `javascript/ql/lib/qlpack.yml`
- **python** — `python/ql/src/qlpack.yml` and `python/ql/lib/qlpack.yml`
- **ruby** — `ruby/ql/src/qlpack.yml` and `ruby/ql/lib/qlpack.yml`
- **rust** — `rust/ql/src/qlpack.yml` and `rust/ql/lib/qlpack.yml`
- **swift** — `swift/ql/src/qlpack.yml` and `swift/ql/lib/qlpack.yml`

> **Note:** Not all languages exist in every CodeQL version. Some languages (like `actions`, `rust`) were added in later versions. If a `qlpack.yml` file does not exist for a language at a given tag, leave that cell blank or mark it as "N/A".

## Your Task

### Step 1: Load Previous State from Cache

Check cache-memory for a file named `codeql-version-tracker-state.json`. If it exists, read it. This file tracks:
- `last_checked`: Timestamp of the last run (use filesystem-safe format `YYYY-MM-DD-HH-MM-SS`)
- `processed_releases`: Array of CodeQL bundle version strings already processed (e.g., `["2.25.2", "2.25.1", "2.25.0"]`)

If the file does not exist, this is the first run — see Step 2 for how to handle this case.

### Step 2: Discover CodeQL Bundle Releases

Use GitHub tools to list releases from `github/codeql-action`. Filter to releases where the tag name starts with `codeql-bundle-v`. These are the bundle releases.

**First Run (no previous cache state):** Limit processing to the **30 most recent** `codeql-bundle-v*` releases only. Do NOT attempt to process all historical releases — there are too many to process in a single run. The tracker will be seeded with the most recent data; older historical releases are not needed.

**Subsequent Runs:** Only paginate as needed to find releases newer than the most recent entry in `processed_releases`. Stop paginating once you reach already-processed versions.

Compare against the `processed_releases` list from cache. Identify which releases are **new** (not yet processed).

If there are no new releases, call `noop` with the message "CodeQL version tracker is up to date — no new releases found." Do NOT create a PR.

### Step 3: Extract Pack Versions for Each New Release

For each new CodeQL bundle release (e.g., `codeql-bundle-v2.25.2`):

1. Extract the version number from the tag (e.g., `2.25.2`)
2. The corresponding tag in the `github/codeql` repository is `codeql-cli/v<VERSION>` (e.g., `codeql-cli/v2.25.2`)
3. For each language listed above, read the `qlpack.yml` file from `github/codeql` at that tag:
   - **Queries pack**: `<language>/ql/src/qlpack.yml` — extract the `version:` field
   - **Library pack**: `<language>/ql/lib/qlpack.yml` — extract the `version:` field
4. If the file doesn't exist at that tag (404), the language was not yet supported — record as "N/A"

> **Rate Limiting / Time Constraints**: There are many releases and many languages. To avoid hitting API rate limits or running out of time:
> - Process releases in batches, prioritizing newer releases first (process in reverse chronological order)
> - If you encounter rate limit errors, finish processing the releases you have and proceed to Step 4 with what you have
> - If a `qlpack.yml` file cannot be fetched (404 or rate limit), record the language as "N/A" for that release and continue
> - If you have processed at least some new releases, proceed to create the PR with what you have — do not wait for complete data

### Step 4: Update the Tracking Page

Read or create the file `codeql/codeql-version-tracker.md` in this repository.

The file should have this structure:

```markdown
# CodeQL Bundle Version Tracker

This page tracks the mapping between CodeQL bundle versions and the language-specific query and library pack versions included in each bundle.

> **Auto-generated** — This file is maintained by an automated workflow. Do not edit manually.
> Last updated: <YYYY-MM-DD>

## Version Matrix

| CodeQL Version | Release Date | <language>-queries | <language>-all | ... |
|---|---|---|---|---|
| 2.25.2 | 2026-04-15 | 1.2.3 | 4.5.6 | ... |
```

**Table format rules:**
- One row per CodeQL bundle version, sorted newest first
- Columns: `CodeQL Version`, `Release Date`, then for each language: `<language>-queries` and `<language>-all`
- The CodeQL Version should link to the bundle release page: `[2.25.2](https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.2)`
- Release Date from the GitHub release `published_at` field (format: `YYYY-MM-DD`)
- Pack versions are plain version strings (e.g., `1.2.3`)
- Use "N/A" for languages not available in that version

Because there are many languages (10) with 2 packs each (20 columns + 2 = 22 columns), split into multiple tables for readability:

1. **Core Languages Table**: CodeQL Version, Release Date, cpp-queries, cpp-all, csharp-queries, csharp-all, go-queries, go-all, java-queries, java-all
2. **Scripting Languages Table**: CodeQL Version, Release Date, javascript-queries, javascript-all, python-queries, python-all, ruby-queries, ruby-all
3. **Additional Languages Table**: CodeQL Version, Release Date, actions-queries, actions-all, rust-queries, rust-all, swift-queries, swift-all

Each table should have the same rows (all CodeQL versions), just different language columns.

When updating, merge new release rows into the existing tables. Keep existing data intact — only add new rows for newly discovered releases.

### Step 5: Save State to Cache

Write the updated state to cache-memory as `codeql-version-tracker-state.json`:
- `last_checked`: Current timestamp in `YYYY-MM-DD-HH-MM-SS` format (no colons, no T, no Z)
- `processed_releases`: Full list of all processed release versions (merge new with existing)

Always save state, even if no new releases were found.

### Step 6: Create Pull Request

If new data was added, create a pull request with:
- **Title:** "Update CodeQL version tracker with <N> new release(s)"
- **Branch name:** `update-codeql-version-tracker`
- **Body:** Include:
  - Summary of new releases added
  - List of CodeQL versions that were added
  - A link to the rendered markdown: `https://github.com/${{ github.repository }}/blob/update-codeql-version-tracker/codeql/codeql-version-tracker.md`

If no new releases were found, call `noop` with the message "CodeQL version tracker is up to date — no new releases found." Do NOT create a PR.

## Important Notes

- The `github/codeql` repo tags use format `codeql-cli/v<VERSION>` (with a slash), not `codeql-bundle-v<VERSION>`
- Parse `qlpack.yml` files as YAML — the `version:` field is what you need
- Some very old CodeQL versions may have different directory structures — if a language path doesn't exist, skip it
- Ensure all three tables have consistent rows (same set of CodeQL versions in the same order)
- Preserve the existing markdown formatting when updating
- **Always call a safe output tool before finishing** — either `create_pull_request` (when new data was added) or `noop` (when no action is needed). Never finish without calling one of these.
