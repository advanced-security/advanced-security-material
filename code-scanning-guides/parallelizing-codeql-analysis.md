# Parallelizing CodeQL Analysis with GitHub Actions

## Overview

By default, the CodeQL Action builds a database and runs queries sequentially in a single job. 

We will use an example safety-critical codebases that must comply with **MISRA C** and **MISRA C++** standards, running both rule sets sequentially can result in long-running workflows. You can **decouple database creation from query execution** using the [`skip-queries`](https://github.com/github/codeql-action/blob/main/analyze/action.yml#L39-L40) input, then fan out MISRA analysis across parallel jobs using GitHub Actions artifacts.

## Why Parallelize MISRA Analysis?

- **MISRA packs are expensive**: The `codeql/misra-c-coding-standards` and `codeql/misra-cpp-coding-standards` packs each contain hundreds of rules. Running them sequentially can take significant time.
- **Build once, analyze twice**: The C/C++ database build (especially for large embedded/automotive codebases) is often the most expensive step. Building it once and sharing it avoids redundant compilation.
- **Faster compliance feedback**: Get MISRA C and MISRA C++ results at the same time, cutting wall-clock time roughly in half.
- **Separate uploads/reporting**: Each standard gets its own SARIF upload with a distinct category, making it easy to track compliance per standard.  Further, a scan that might generate a large SARIF file that exceeds limits would fail to upload and would require splitting up results to upload properly.

## How It Works

The key is the `skip-queries` input on the `analyze` action:

```yaml name=action.yml url=https://github.com/github/codeql-action/blob/main/analyze/action.yml#L39-L40
  skip-queries:
    description: If this option is set, the CodeQL database will be built but no queries will be run on it. Thus, no results will be produced.
```

When set to `"true"`, the action:

1. Finalizes the CodeQL database (compiles trap files, runs indexing)
2. Skips all query execution
3. Leaves the database on disk, ready to be packaged and shared

The database is stored at `/home/runner/work/_temp/codeql_databases/<language>` on GitHub-hosted runners. The `db-locations` output from the analyze step provides the exact paths.

## Architecture

```
┌───────────────────────────┐
│      build-db job          │
│                            │
│  checkout → init(cpp) →    │
│  autobuild → analyze       │
│  (skip-queries: true) →    │
│  upload-artifact           │
└─────────────┬──────────────┘
              │ artifact: codeql-db
        ┌─────┴──────┐
        ▼            ▼
┌──────────────┐ ┌──────────────┐
│  misra-c     │ │  misra-cpp   │   (parallel)
│  job         │ │  job         │
│              │ │              │
│  download    │ │  download    │
│  codeql      │ │  codeql      │
│  database    │ │  database    │
│  analyze     │ │  analyze     │
│  (misra-c    │ │  (misra-cpp  │
│   @2.56.0)   │ │   @2.56.0)   │
│  upload      │ │  upload      │
│  SARIF       │ │  SARIF       │
└──────────────┘ └──────────────┘
```

## Complete Workflow Example

```yaml name=codeql-misra-parallel.yml
name: "CodeQL MISRA Parallel Analysis"

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  # ──────────────────────────────────────────────
  # Job 1: Build the CodeQL C/C++ database only
  # ──────────────────────────────────────────────
  build-db:
    name: Build CodeQL Database
    runs-on: ubuntu-latest
    permissions:
      security-events: write
    outputs:
      db-locations: ${{ steps.analyze.outputs.db-locations }}
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Initialize CodeQL
        uses: github/codeql-action/init@v4
        with:
          languages: cpp

      # Replace with your project's build commands if autobuild is insufficient.
      # For embedded/automotive projects this is often a cross-compilation step.
      - name: Autobuild
        uses: github/codeql-action/autobuild@v4

      - name: Finalize database (skip queries)
        id: analyze
        uses: github/codeql-action/analyze@v4
        with:
          skip-queries: "true"     # Build DB only — no query execution
          upload: "never"          # No SARIF to upload yet
          upload-database: "false" # Don't upload DB to code scanning yet

      - name: Upload CodeQL database as artifact
        uses: actions/upload-artifact@v4
        with:
          name: codeql-db
          path: ${{ runner.temp }}/codeql_databases/
          retention-days: 1
          compression-level: 6

  # ──────────────────────────────────────────────
  # Job 2a: MISRA C analysis
  # ──────────────────────────────────────────────
  misra-c:
    name: "MISRA C Analysis"
    needs: build-db
    runs-on: ubuntu-latest
    permissions:
      security-events: write
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Download CodeQL database
        uses: actions/download-artifact@v4
        with:
          name: codeql-db
          path: codeql-databases/

      - name: Install MISRA C query pack
        run: codeql pack download codeql/misra-c-coding-standards@2.56.0

      - name: Run MISRA C analysis
        run: |
          codeql database analyze codeql-databases/cpp \
            --format=sarif-latest \
            --output=results-misra-c.sarif \
            codeql/misra-c-coding-standards@2.56.0 \
            --threads=0 \
            --ram=5500

      - name: Upload MISRA C SARIF results
        uses: github/codeql-action/upload-sarif@v4
        if: always()
        with:
          sarif_file: results-misra-c.sarif
          category: misra-c
          wait-for-processing: true

  # ──────────────────────────────────────────────
  # Job 2b: MISRA C++ analysis
  # ──────────────────────────────────────────────
  misra-cpp:
    name: "MISRA C++ Analysis"
    needs: build-db
    runs-on: ubuntu-latest
    permissions:
      security-events: write
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Download CodeQL database
        uses: actions/download-artifact@v4
        with:
          name: codeql-db
          path: codeql-databases/

      - name: Install MISRA C++ query pack
        run: codeql pack download codeql/misra-cpp-coding-standards@2.56.0

      - name: Run MISRA C++ analysis
        run: |
          codeql database analyze codeql-databases/cpp \
            --format=sarif-latest \
            --output=results-misra-cpp.sarif \
            codeql/misra-cpp-coding-standards@2.56.0 \
            --threads=0 \
            --ram=5500

      - name: Upload MISRA C++ SARIF results
        uses: github/codeql-action/upload-sarif@v4
        if: always()
        with:
          sarif_file: results-misra-cpp.sarif
          category: misra-cpp
          wait-for-processing: true
```

## Important Details

### Database Location

On GitHub-hosted runners, the CodeQL Action stores databases at:

```
/home/runner/work/_temp/codeql_databases/<language>
```

For C/C++ projects, the database will be at `/home/runner/work/_temp/codeql_databases/cpp`. You can also reference the exact path via the `db-locations` output from the analyze step, which returns a JSON map of language → path.

### The `category` Input Is Critical

Each parallel job **must** upload its SARIF with a unique `category` value. Code Scanning uses the category to distinguish between result sets. If two jobs upload with the same category, the second upload **replaces** the first.

In this workflow:
- MISRA C results use `category: misra-c`
- MISRA C++ results use `category: misra-cpp`

This ensures both sets of findings appear independently in the Code Scanning alerts tab.

### Pinning Query Pack Versions

Both jobs pin the MISRA packs to `@2.56.0`:

```
codeql/misra-c-coding-standards@2.56.0
codeql/misra-cpp-coding-standards@2.56.0
```

This ensures **reproducible results** across runs. Without pinning, `codeql pack download` fetches the latest version, which may introduce new rules or change severity ratings between runs.

### CodeQL CLI Availability

The `codeql` CLI is pre-installed on all GitHub-hosted runners and is already on the `PATH`. You do not need to run the `init` action in the parallel jobs — just use `codeql` directly.

### Permissions

All jobs that call `upload-sarif` require the `security-events: write` permission.

### Artifact Size and Retention

C/C++ CodeQL databases can be large (hundreds of MB to several GB). Consider:

- **`retention-days: 1`** — These artifacts are ephemeral; no need to keep them.
- **`compression-level: 6`** — Balances upload speed vs. artifact size.

### Using `if: always()` on SARIF Upload

The `upload-sarif` step uses `if: always()` so that even if the analysis step finds violations and returns a non-zero exit code, the SARIF file is still uploaded. This ensures you always see results in Code Scanning.

## Extending: Adding Default Security Queries

You can easily add a third parallel job that runs the standard CodeQL security queries alongside MISRA:

```yaml
  security:
    name: "Security Queries"
    needs: build-db
    runs-on: ubuntu-latest
    permissions:
      security-events: write
    steps:
      - uses: actions/checkout@v4

      - uses: actions/download-artifact@v4
        with:
          name: codeql-db
          path: codeql-databases/

      - name: Run security queries
        run: |
          codeql database analyze codeql-databases/cpp \
            --format=sarif-latest \
            --output=results-security.sarif \
            codeql/cpp-queries:codeql-suites/cpp-security-extended.qls \
            --threads=0

      - uses: github/codeql-action/upload-sarif@v4
        if: always()
        with:
          sarif_file: results-security.sarif
          category: security
```

## Limitations

- **Artifact transfer time**: Uploading and downloading the database artifact adds overhead. For small databases this can exceed the time saved by parallelization.
- **Runner costs**: Each parallel job consumes a separate runner. Ensure the wall-clock savings justify the additional compute minutes.
- **Caching performance**: The CodeQL analysis runtime will cache query/dataflow executions that will not be shared across parallel runs on the same code base.
- **Database compatibility**: The CodeQL CLI version used in parallel jobs must be compatible with the version that created the database without paying upgrade/downgrade penalty. Using GitHub-hosted runners with the same image in all jobs ensures this.

## References

- [`skip-queries` input definition — `analyze/action.yml`](https://github.com/github/codeql-action/blob/main/analyze/action.yml#L39-L40)
- [CodeQL Action repository](https://github.com/github/codeql-action)
- [CodeQL Coding Standards repository](https://github.com/github/codeql-coding-standards)
- [GitHub Actions: `upload-artifact`](https://github.com/actions/upload-artifact)
- [GitHub Actions: `download-artifact`](https://github.com/actions/download-artifact)
- [CodeQL CLI `database analyze` reference](https://docs.github.com/en/code-security/codeql-cli/codeql-cli-manual/database-analyze)
- [Code Scanning SARIF upload](https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/uploading-a-sarif-file-to-github)
