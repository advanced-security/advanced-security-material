### the csv headers
["repo","severity","created","fixed","dismissed","dismissed reason","state","url","topics"], 
(.[]| 
### the json path
[.repository.name,.rule.severity,.created_at,.fixed_at,.dismissed_at,.dismissed_reason,.state,.html_url,($topics[][.repository.name]|join(" "))]
) | @csv
