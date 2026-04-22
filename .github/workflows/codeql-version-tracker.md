---
description: Weekly tracker that maps CodeQL bundle versions to language-specific query and library pack versions across all supported languages
on:
  schedule: weekly
  workflow_dispatch:
permissions:
  contents: read
  pull-requests: read
  issues: read
timeout-minutes: 60
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

If the file does not exist, this is the first run. See the batch processing rules below for first-run behavior.

### Step 2: Discover CodeQL Bundle Releases

Use GitHub tools to list releases from `github/codeql-action`. Filter to releases where the tag name starts with `codeql-bundle-v`. These are the bundle releases.

> **Important — Do NOT paginate through all releases at once.** The `github/codeql-action` repository has hundreds of releases. Fetching all of them in a single run will exhaust your token budget. Instead, use the batch processing approach below.

List releases page by page (newest first). On each page, collect `codeql-bundle-v*` tagged releases and check them against `processed_releases` from cache. **Stop paginating** once you have collected enough unprocessed releases to fill the batch (see limits below), or once you reach releases that are already processed.

Compare against the `processed_releases` list from cache. Identify which releases are **unprocessed** (not yet in the list).

#### Batch Processing Limits

- **First run** (no cache state): Process only the **10 most recent** CodeQL bundle releases. Do not attempt to process the entire history — older releases will be backfilled in subsequent runs.
- **Subsequent runs**: Process up to **5 new releases** (releases newer than any in `processed_releases`) **plus** up to **5 backfill releases** (older releases not yet in `processed_releases`) per run, for a maximum of **10 releases per run**.
- **Backfill strategy**: After processing new releases, continue paginating backwards from the oldest release in `processed_releases` to find up to 5 more unprocessed historical releases. This ensures the tracker progressively fills in older versions over multiple scheduled runs.
- **When more remain**: If there are still unprocessed releases after hitting the batch limit, save your progress to cache-memory (Step 5) and call `noop` with a message like: "Processed N releases this run. M older releases remain for backfill in future runs." Do NOT create a PR with partial data if you haven't finished the current batch — only create a PR if you successfully processed all releases in this batch.

If there are no new or backfill releases to process, skip to Step 5 (save state) and exit without creating a PR.

### Step 3: Extract Pack Versions for Each New Release

For each new CodeQL bundle release (e.g., `codeql-bundle-v2.25.2`):

1. Extract the version number from the tag (e.g., `2.25.2`)
2. **Optimization — Check the bundle release body first.** Each `codeql-bundle-v*` release body on `github/codeql-action` lists all included packs with links to their source and changelogs. While the release body does not contain version numbers directly, it confirms which languages are included in that bundle (helping you skip 404s for unsupported languages).
3. The corresponding tag in the `github/codeql` repository is `codeql-cli/v<VERSION>` (e.g., `codeql-cli/v2.25.2`)
4. For each language listed above, read the `qlpack.yml` file from `github/codeql` at that tag:
   - **Queries pack**: `<language>/ql/src/qlpack.yml` — extract the `version:` field
   - **Library pack**: `<language>/ql/lib/qlpack.yml` — extract the `version:` field
5. If the file doesn't exist at that tag (404), the language was not yet supported — record as "N/A"

> **Rate Limiting**: With batch limits in place, each run processes at most 10 releases × 20 files = 200 file reads, which is well within API limits. If you still encounter rate limit errors, save progress to cache and call `noop`.

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
- `oldest_processed`: The oldest CodeQL version string that has been processed (e.g., `"2.20.0"`). This helps the backfill step know where to resume paginating from.
- `backfill_complete`: Boolean. Set to `true` once a run finds no more unprocessed releases older than `oldest_processed`. This tells future runs to skip backfill pagination entirely.

Always save state, even if no new releases were found.

### Step 6: Create Pull Request

If new data was added, create a pull request with:
- **Title:** "Update CodeQL version tracker with <N> new release(s)"
- **Branch name:** `update-codeql-version-tracker`
- **Body:** Include:
  - Summary of new releases added
  - List of CodeQL versions that were added
  - A link to the rendered markdown: `https://github.com/${{ github.repository }}/blob/update-codeql-version-tracker/codeql/codeql-version-tracker.md`

If no new releases were found, do NOT create a PR. Simply log that the tracker is up to date.

## Important Notes

- The `github/codeql` repo tags use format `codeql-cli/v<VERSION>` (with a slash), not `codeql-bundle-v<VERSION>`
- Parse `qlpack.yml` files as YAML — the `version:` field is what you need
- Some very old CodeQL versions may have different directory structures — if a language path doesn't exist, skip it
- Ensure all three tables have consistent rows (same set of CodeQL versions in the same order)
- Preserve the existing markdown formatting when updating
