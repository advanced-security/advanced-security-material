### the csv headers
["repo","package","severity","CVSS","created","fixed","dismissed","dismissed reason","state","url","topics"], 
(.[].data.repository.vulnerabilityAlerts.edges[0].node | select(.!=null)|
### the json path
[.repository.name,
 .securityVulnerability.package.name,
 .securityVulnerability.severity,
 .securityVulnerability.advisory.cvss.score,
 .createdAt,
 .fixedAt,
 .dismissedAt,
 .dismissReason,
 .state,
 ("https://github.com/beazley/"+.repository.name+"/security/dependabot/"+(.number|tostring)),
 ($topics[][.repository.name]|join(" "))]
)  | @csv
