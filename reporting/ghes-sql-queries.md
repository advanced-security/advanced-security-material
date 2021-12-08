### SQL queries for Advanced Security metrics
Normally you would use the APIs to get this data, use the Security Overview page to review GHAS rollout and/or use the webhooks to sync GHAS related information to Slack or some centralised security platform. 
If you're on GHES, you can get into the `ghes-console` and run some SQL queries to get pretty much the same data.

If at all possible use the available APIs and webhooks to get this data. The method described here is reserved for users who have access to the `ghe-dbconsole`.

The syntax to run this on the appliance is `echo '<sql query>;' | ghe-dbconsole -y`

#### Latest code scanning records
```sql
select 
  r.id, 
  r.name, 
  c.alert_number as 'number_of_code_scanning_alerts', 
  c.check_run_id, c.created_at as 'code_scanning_analysis_latest_date' 
from 
  repositories as r, 
  code_scanning_alerts as c 
where 
  r.id  = c.repository_id 
  and c.check_run_id=(
    select 
      max(c.check_run_id) 
    from 
      code_scanning_alerts as c)
```
