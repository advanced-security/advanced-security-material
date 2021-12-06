### SARIF Upload Errors

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

### Test environments
- GHES 3.2.1 + CodeQL CLI 2.7.2
