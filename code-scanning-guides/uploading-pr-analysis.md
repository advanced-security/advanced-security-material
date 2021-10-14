### Uploading SARIF from CodeQL Analysis via the CodeQL CLI to GitHub Pull Request

Example: https://github.com/advanced-security/potential-barnacle/pulls

0. Set `GH_TOKEN` to access token and other env vars, such as GITHUB_REPOSITORY, REF, etc.

1. Checkout `cmboling-patch-2` branch

2. List current analyses uploaded to repository:

```
curl -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $GH_TOKEN" \
  https://api.github.com/repos/advanced-security/potential-barnacle/code-scanning/analyses
```

Example response:

```
  {
    "ref": "refs/heads/main",
    "commit_sha": "bcc382d080f404d1cabde26f065769a7d370613e",
    "analysis_key": ".github/workflows/codeql-analysis.yml:analyze",
    "environment": "{\"language\":\"go\"}",
    "category": ".github/workflows/codeql-analysis.yml:analyze/language:go",
    "error": "",
    "created_at": "2021-10-04T23:57:52Z",
    "results_count": 4,
    "rules_count": 27,
    "id": 13636724,
    "url": "https://api.github.com/repos/advanced-security/potential-barnacle/code-scanning/analyses/13636724",
    "sarif_id": "e1a0d738-256e-11ec-91ca-90948254c7ec",
    "tool": {
      "name": "CodeQL",
      "guid": null,
      "version": "2.6.2"
    },
    "deletable": true,
    "warning": ""
  }
```

3. Create the CodeQL db:

```
codeql database create db --language=go 
```

4. Run CodeQL analysis and define `--sarif-category` to be the value from the baseline analysis' `category` value
```
codeql database analyze db go-security-and-quality.qls --format=sarif-latest --output=results3.sarif --sarif-category=".github/workflows/codeql-analysis.yml:analyze/language:go"
```

5. Get the merge commit sha and set COMMIT_SHA env var
```
curl -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $GH_TOKEN" \
https://api.github.com/repos/advanced-security/potential-barnacle/pulls/2 | jq '.merge_commit_sha'
```
6. Upload results

```
codeql github upload-results \
  --repository=advanced-security/potential-barnacle \
  --ref=refs/pull/2/merge --sarif=results3.sarif \
  --github-auth-stdin=$GH_TOKEN \
  --commit=$COMMIT_SHA
```

7. List analyses again

```
curl -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $GH_TOKEN" \
  https://api.github.com/repos/advanced-security/potential-barnacle/code-scanning/analyses
```
Example response:
```
[
  {
    "ref": "refs/pull/2/merge",
    "commit_sha": "6632c624919fbc9c607cb442603d92800eaa4f50",
    "analysis_key": "(default)",
    "environment": "{}",
    "category": ".github/workflows/codeql-analysis.yml:analyze/language:go",
    "error": "",
    "created_at": "2021-10-05T00:15:44Z",
    "results_count": 6,
    "rules_count": 48,
    "id": 13637768,
    "url": "https://api.github.com/repos/advanced-security/potential-barnacle/code-scanning/analyses/13637768",
    "sarif_id": "61ac3952-2571-11ec-839e-a7ea85c88149",
    "tool": {
      "name": "CodeQL",
      "guid": null,
      "version": "2.6.2"
    },
    "deletable": true,
    "warning": ""
  },
  {
    "ref": "refs/pull/1/merge",
    "commit_sha": "8f0b5d2dbe425849ba6a9553d1a37fb2c45f7c26",
    "analysis_key": "(default)",
    "environment": "{}",
    "category": "",
    "error": "",
    "created_at": "2021-10-05T00:04:21Z",
    "results_count": 7,
    "rules_count": 48,
    "id": 13637029,
    "url": "https://api.github.com/repos/advanced-security/potential-barnacle/code-scanning/analyses/13637029",
    "sarif_id": "caaef98c-256f-11ec-813f-0d31916b54b7",
    "tool": {
      "name": "CodeQL",
      "guid": null,
      "version": "2.6.2"
    },
    "deletable": true,
    "warning": ""
  },
  {
    "ref": "refs/heads/main",
    "commit_sha": "bcc382d080f404d1cabde26f065769a7d370613e",
    "analysis_key": ".github/workflows/codeql-analysis.yml:analyze",
    "environment": "{\"language\":\"go\"}",
    "category": ".github/workflows/codeql-analysis.yml:analyze/language:go",
    "error": "",
    "created_at": "2021-10-04T23:57:52Z",
    "results_count": 4,
    "rules_count": 27,
    "id": 13636724,
    "url": "https://api.github.com/repos/advanced-security/potential-barnacle/code-scanning/analyses/13636724",
    "sarif_id": "e1a0d738-256e-11ec-91ca-90948254c7ec",
    "tool": {
      "name": "CodeQL",
      "guid": null,
      "version": "2.6.2"
    },
    "deletable": true,
    "warning": ""
  }
]
```

You can see the categories are matched between the default branch and the 2nd PR, whereas the [first PR](https://github.com/advanced-security/potential-barnacle/pull/1) has a blank category value, which is why Code Scanning can't "find" the baseline analysis to match with the analysis from the first PR.
