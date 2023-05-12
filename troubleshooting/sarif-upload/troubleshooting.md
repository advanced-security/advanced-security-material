## SARIF Upload Errors
* Test environment - GHES 3.2.1 + CodeQL CLI 2.7.2

:gift: wrong ref:
```
codeql github upload-results --github-url=https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/ --sarif=results.sarif --ref=ref/heads/main --commit=5f538e43c27e91cd3e31c5a12b136b69d61a744f --repository=santa-foss/jubilant-octo-pancake --github-auth-stdin=ghp_somethingsomethingsomething
A fatal error occurred: Error uploading SARIF to 'https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/api/v3/repos/santa-foss/jubilant-octo-pancake/code-scanning/sarifs' from '/Users/cmboling/Desktop/jubilant-octo-pancake/results.sarif'. REASON: HTTP/1.1 422 Unprocessable Entity:::{"message":"Invalid request.\n\nref/heads/main does not match /^refs\\/(heads|pull|tags)\\/.*$/.","documentation_url":"https://docs.github.com/enterprise/3.2/rest/reference/code-scanning#upload-a-sarif-file"}
```

:santa: bad credentials:
```
codeql github upload-results --github-url=https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/ --sarif=results.sarif --ref=refs/heads/main --commit=5f538e43c27e91cd3e31c5a12b136b69d61a744f --repository=santa-foss/jubilant-octo-pancake --github-auth-stdin=ghp_somethingsomethingsomethin
A fatal error occurred: Error uploading SARIF to 'https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/api/v3/repos/santa-foss/jubilant-octo-pancake/code-scanning/sarifs' from '/Users/cmboling/Desktop/jubilant-octo-pancake/results.sarif'. REASON: HTTP/1.1 401 Unauthorized:::{"message":"Bad credentials","documentation_url":"https://docs.github.com/enterprise/3.2/rest"}
```

:gift: missing token:
```
codeql github upload-results --github-url=https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/ --sarif=results.sarif --ref=refs/heads/main --commit=5f538e43c27e91cd3e31c5a12b136b69d61a744f --repository=santa-foss/jubilant-octo-pancake
A fatal error occurred: A GitHub token is required to upload SARIF results but none was specified.
(eventual cause: MissingTokenException "An operation was attempted that requires a GitHub token but one could not be fou..."
```

:santa: misspelled repo name:
```
codeql github upload-results --github-url=https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/ --sarif=results.sarif --ref=refs/heads/main --commit=5f538e43c27e91cd3e31c5a12b136b69d61a744f --repository=santa-foss/jubilant-octo-pancak --github-auth-stdin=ghp_somethingsomethingsomething
A fatal error occurred: Error uploading SARIF to 'https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/api/v3/repos/santa-foss/jubilant-octo-pancak/code-scanning/sarifs' from '/Users/cmboling/Desktop/jubilant-octo-pancake/results.sarif'. REASON: HTTP/1.1 404 Not Found:::{"message":"Not Found","documentation_url":"https://docs.github.com/enterprise/3.2/rest/reference/code-scanning#upload-a-sarif-file"}
```

:gift: bad token (no security event scope):
```
codeql github upload-results --github-url=https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/ --sarif=results.sarif --ref=refs/heads/main --commit=5f538e43c27e91cd3e31c5a12b136b69d61a744f --repository=santa-foss/jubilant-octo-pancake --github-auth-stdin=ghp_falalalala
A fatal error occurred: Error uploading SARIF to 'https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/api/v3/repos/santa-foss/jubilant-octo-pancake/code-scanning/sarifs' from '/Users/cmboling/Desktop/jubilant-octo-pancake/results.sarif'. REASON: HTTP/1.1 403 Forbidden:::{"message":"You are not authorized to write security events.","documentation_url":"https://docs.github.com/enterprise/3.2/rest/reference/code-scanning#upload-a-sarif-file"}
```

:santa:  GHAS not enabled but have a valid token:
```
codeql github upload-results --github-url=https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/ --sarif=results.sarif --ref=refs/heads/main --commit=5f538e43c27e91cd3e31c5a12b136b69d61a744f --repository=santa-foss/jubilant-octo-pancake --github-auth-stdin=ghp_somethingsomethingsomething
A fatal error occurred: Error uploading SARIF to 'https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/api/v3/repos/santa-foss/jubilant-octo-pancake/code-scanning/sarifs' from '/Users/cmboling/Desktop/jubilant-octo-pancake/results.sarif'. REASON: HTTP/1.1 403 Forbidden:::{"message":"Advanced Security must be enabled for this repository to use code scanning.","documentation_url":"https://docs.github.com/enterprise/3.2/rest/reference/code-scanning#upload-a-sarif-file"}
```

:gift:  posting SARIF to the wrong repo (where GHAS isn’t enabled):
```
codeql github upload-results --github-url=https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/ --sarif=results.sarif --ref=refs/heads/main --commit=5f538e43c27e91cd3e31c5a12b136b69d61a744f --repository=santa-foss/fluffy-potato --github-auth-stdin=ghp_somethingsomethingsomething
A fatal error occurred: Error uploading SARIF to 'https://cmboling-0bd0debab4ff16db0.ghe-test.ninja/api/v3/repos/santa-foss/fluffy-potato/code-scanning/sarifs' from '/Users/cmboling/Desktop/jubilant-octo-pancake/results.sarif'. REASON: HTTP/1.1 403 Forbidden:::{"message":"Advanced Security must be enabled for this repository to use code scanning.","documentation_url":"https://docs.github.com/enterprise/3.2/rest/reference/code-scanning#upload-a-sarif-file"}
```

:gift: posting SARIF when the SSL certificate is not trusted:
```dotnetcli
curl \
  -X POST \
  -k \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/OWNER/REPO/code-scanning/sarifs \
  -d '{"commit_sha":"<SHA>","ref":"refs/heads/master","sarif":"<Base64_sarif>"}'
```
More information on the API can be found [here](https://docs.github.com/en/rest/code-scanning?apiVersion=2022-11-28#upload-an-analysis-as-sarif-data)

### Test environments
- GHES 3.2.1 + CodeQL CLI 2.7.2
=======
## SARIF Parsing Errors

### Code Scanning could not process the submitted SARIF file: rejecting SARIF, as there are more runs than allowed (123 > 15)
The GitHub api for accepting SARIF uploads has a limiter to prevent that number from being greater than specified (>15) for each upload.

See limits for various thresholds on the [REST API documentation](https://docs.github.com/en/rest/code-scanning?apiVersion=2022-11-28#upload-an-analysis-as-sarif-data)
* Runs per file
* Results per run
* Rules per run	
* Tool extensions per run
* Thread Flow Locations per result
* Location per result
* Tags per rule	

### A fatal error occurred: SARIF file is too large. The GitHub code scanning API accepts a max file size of 2000MB. This file is xxxxMB. File: "xyz.sarif"
- aleternatively - `failed decompressing file from the path: "upload /xyz.sarif.gz": maximum SARIF size exceeded`

First, review recommendedations per language to reduce the amount of code being scanned (e.g. removing test or demo code from the scan in an attempt to remove unwanted detections from SARIF). A detailed analysis of the SARIF file may indicate a massive number of a single rule, in this case [excluding a specific rule from the analysis](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/customizing-code-scanning#excluding-specific-queries-from-analysis) would be the best solution.  Alternatively, use a tool like [filter-sarif action](https://github.com/advanced-security/filter-sarif) to rewrite the SARIF file to exclude specific detections via an exclusion pattern. 

If there are many deep code paths highlighted in the SARIF, use `--max-path=0` (or 1) passed into the analyze step or `database analyze` cli command to get rid of the dataflow paths and reduce the SARIF size that way (NOTE this will impact all rules). 

```yml
- name: Perform CodeQL Analysis
  uses: github/codeql-action/analyze@v2
  env: 
     CODEQL_ACTION_EXTRA_OPTIONS: '{"database":{"interpret-results":["--max-paths", 1]}}'
```

## Tools to rewrite SARIF
- `jq`
- [Microsoft's SARIF tool](https://github.com/microsoft/sarif-sdk/blob/main/docs/multitool-usage.md)
- [Dr. House's SARIF CLI](https://github.com/hohn/sarif-cli)
- [advanced-security/filter-sarif action](https://github.com/advanced-security/filter-sarif)
