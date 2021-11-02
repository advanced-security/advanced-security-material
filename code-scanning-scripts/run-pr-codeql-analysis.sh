#!/usr/bin/env bash

set -o errexit
set -o noglob
set -o nounset
set -o pipefail

GH_TOKEN=$1
GH_ORG=advanced-security
GH_REPO=potential-barnacle
GH_PULL_REQUEST_NUMBER=3
GH_REF=refs/pull/$GH_PULL_REQUEST_NUMBER/merge

CODEQL_DATABASE=db
CODEQL_LANGUAGE=go
CODEQL_QUERY_SUITE=go-security-and-quality.qls
CODEQL_SARIF_RESULTS=codeql-go-results.sarif
CODEQL_SARIF_CATEGORY=.github/workflows/codeql-analysis.yml:analyze/language:go

# run a single language analysis for a PR

# get merge commit sha
GH_MERGE_COMMIT_SHA=$(curl -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $GH_TOKEN" https://api.github.com/repos/$GH_ORG/$GH_REPO/pulls/$GH_PULL_REQUEST_NUMBER | jq '.merge_commit_sha' | sed -e 's/^"//' -e 's/"$//')

# check codeql --version
codeql --version

# codeql database create
codeql database create $CODEQL_DATABASE --language=$CODEQL_LANGUAGE --overwrite

# codeql database analyze
codeql database analyze $CODEQL_DATABASE $CODEQL_QUERY_SUITE --output=$CODEQL_SARIF_RESULTS --sarif-category=$CODEQL_SARIF_CATEGORY --format=sarif-latest

# codeql github upload-results
codeql github upload-results --repository=$GH_ORG/$GH_REPO --ref=$GH_REF --sarif=$CODEQL_SARIF_RESULTS --github-auth-stdin=$GH_TOKEN --commit=$GH_MERGE_COMMIT_SHA
