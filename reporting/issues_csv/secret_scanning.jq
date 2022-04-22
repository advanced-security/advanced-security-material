### the csv headers
["repo","type","created","fixed","resolution","state","url","topics"], 
(.[] | select(.rule.severity!="severity")| 
### the json path
[.repository.name,.secret_type,.created_at,.resolved_at,.resolution,.state,.html_url,($topics[][.repository.name]|join(" "))]
) | @csv
