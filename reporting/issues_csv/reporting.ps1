#!/usr/bin/env pwsh
$ORG = "mbaluda-org"

### FETCH TOPICS ###
$topics = gh api --cache 5m orgs/$ORG/repos -q 'map(select(.name)|{(.name):(.topics)})|add' | jq -s 'add'
$topics | Out-File topics_map.json -encoding utf8

### CODE SCANNING ALERTS ###
gh api orgs/$ORG/code-scanning/alerts --method GET --paginate | jq -rf code_scanning.jq --slurpfile topics topics_map.json > code_scanning.csv
 
### SECRET SCANNING ALERTS ###
gh api orgs/$ORG/secret-scanning/alerts --method GET --paginate | jq -rf secret_scanning.jq --slurpfile topics topics_map.json > secret_scanning.csv
 
### DEPENDABOT SCANNING ALERTS ###
$repos = $topics | jq 'keys[]'
$(foreach ($repo in $repos) {
    gh api graphql -F group=$ORG -F repo=$repo -f query='
  query ($endCursor: String, $group: String!, $repo: String!) {
    repository(owner: $group, name: $repo) {
      vulnerabilityAlerts(first: 100, after: $endCursor) {
        edges { node { createdAt fixedAt dismissedAt dismissReason state securityVulnerability { package { name } severity advisory { cvss { score } } } repository { name } number } }
        pageInfo { hasNextPage endCursor }
      }
    }
  }' --paginate
  }) | jq -srf dependabot.jq --slurpfile topics topics_map.json > dependabot.csv
