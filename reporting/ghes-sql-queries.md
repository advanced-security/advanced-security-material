### SQL queries for Advanced Security metrics
Normally you would use the APIs to get this data, use the Security Overview page to review GHAS rollout and/or use the webhooks to sync GHAS related information to Slack or some centralised security platform. 
If you're on GHES, you can get into the `ghes-console` and run some SQL queries to get pretty much the same data.

If at all possible use the available APIs and webhooks to get this data. The method described here is reserved for users who have access to the `ghe-dbconsole`.

The syntax to run this on the appliance is `echo '<sql query>;' | ghe-dbconsole -y` OR run `ghe-dbconsole -y` and a `mysql` prompt will come up for you to run some queries.

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
      code_scanning_alerts as c);
```

#### Security overview configs
```sql
select 
  r.repository_id, 
  r.organization_id, 
  r.name, 
  r.ghas_enabled, 
  r.last_push, 
  r.risk_level 
from 
  repository_security_center_configs as r;
```

#### List contributors of GHAS enabled repositories
```sql
select 
  r.owner_login as org_name,  
  r.name as repo_name, 
  u.login as gh_handle 
from 
  ghas_repository_contributions as grc, 
  repositories as r, users as u 
where 
  u.id = grc.user_id 
  and r.id = grc.repository_id;
```

#### Lookup a particular dependency vulnerability
```sql
select 
  id,
  status, 
  ghsa_id,  
  cve_id, 
  created_at 
from 
  vulnerabilities 
where 
  id = 4765;
```

```
+------+-----------+---------------------+----------------+---------------------+
| id   | status    | ghsa_id             | cve_id         | created_at          |
+------+-----------+---------------------+----------------+---------------------+
| 4765 | published | GHSA-68w8-qjq3-2gfm | CVE-2021-33203 | 2021-06-10 14:57:28 |
+------+-----------+---------------------+----------------+---------------------+
```

#### Show dependabot alerts across enterprise

```sql
select
  rva.id,
  r.owner_login as org_name,  
  r.name as repo_name,
  rva.vulnerable_manifest_path,
  rva.vulnerable_requirements,
  v.cve_id,
  v.ghsa_id,
  v.status as cve_status,
  rva.created_at,
  rva.updated_at,
  rva.last_detected_at,
  rva.dismisser_id,
  rva.dismiss_reason,
  rva.dismissed_at
from 
  repository_vulnerability_alerts as rva,
  repositories as r,
  vulnerabilities as v
where 
  r.id = rva.repository_id
  and v.id = rva.vulnerability_id;
```

```
+----+----------+-------------------------+--------------------------+-------------------------+----------------+---------------------+-----------------------------------------------------------------------------------------+------------+---------------------+---------------------+------------------+--------------+----------------+--------------+
| id | org_name | repo_name               | vulnerable_manifest_path | vulnerable_requirements | cve_id         | ghsa_id             | external_reference                                                                      | cve_status | created_at          | updated_at          | last_detected_at | dismisser_id | dismiss_reason | dismissed_at |
+----+----------+-------------------------+--------------------------+-------------------------+----------------+---------------------+-----------------------------------------------------------------------------------------+------------+---------------------+---------------------+------------------+--------------+----------------+--------------+
|  1 | elves    | urban-computing-machine | requirements.txt         | = 2.2.13                | CVE-2021-33203 | GHSA-68w8-qjq3-2gfm | https://nvd.nist.gov/vuln/detail/CVE-2021-33203                                         | published  | 2021-12-02 01:17:36 | 2021-12-02 01:17:36 | NULL             |         NULL | NULL           | NULL         |
|  2 | elves    | urban-computing-machine | requirements.txt         | = 2.2.13                | CVE-2021-33571 | GHSA-p99v-5w3c-jqq9 | https://nvd.nist.gov/vuln/detail/CVE-2021-33571                                         | published  | 2021-12-02 01:17:37 | 2021-12-02 01:17:37 | NULL             |         NULL | NULL           | NULL         |
|  3 | elves    | urban-computing-machine | requirements.txt         | = 2.2.13                | CVE-2021-31542 | GHSA-rxjp-mfm9-w4wr | https://nvd.nist.gov/vuln/detail/CVE-2021-31542                                         | published  | 2021-12-02 01:17:48 | 2021-12-02 01:17:48 | NULL             |         NULL | NULL           | NULL         |
|  4 | elves    | urban-computing-machine | requirements.txt         | = 2.2.13                | CVE-2021-32052 | GHSA-qm57-vhq3-3fwf | https://nvd.nist.gov/vuln/detail/CVE-2021-32052                                         | published  | 2021-12-02 01:17:49 | 2021-12-02 01:17:49 | NULL             |         NULL | NULL           | NULL         |
|  5 | elves    | urban-computing-machine | requirements.txt         | = 2.2.13                | CVE-2021-28658 | GHSA-xgxc-v2qg-chmh | https://nvd.nist.gov/vuln/detail/CVE-2021-28658                                         | published  | 2021-12-02 01:18:53 | 2021-12-02 01:18:53 | NULL             |         NULL | NULL           | NULL         |
|  6 | elves    | urban-computing-machine | requirements.txt         | = 2.2.13                | CVE-2021-3281  | GHSA-fvgf-6h6h-3322 | https://nvd.nist.gov/vuln/detail/CVE-2021-3281                                          | published  | 2021-12-02 01:19:08 | 2021-12-02 01:19:08 | NULL             |         NULL | NULL           | NULL         |
|  7 | elves    | urban-computing-machine | requirements.txt         | = 2.2.13                | CVE-2020-24584 | GHSA-fr28-569j-53c4 | https://nvd.nist.gov/vuln/detail/CVE-2020-24584                                         | published  | 2021-12-02 01:19:09 | 2021-12-02 01:19:09 | NULL             |         NULL | NULL           | NULL         |
|  8 | elves    | urban-computing-machine | requirements.txt         | = 2.2.13                | CVE-2020-24583 | GHSA-m6gj-h9gm-gw44 | https://nvd.nist.gov/vuln/detail/CVE-2020-24583                                         | published  | 2021-12-02 01:19:09 | 2021-12-02 01:19:09 | NULL             |         NULL | NULL           | NULL         |
|  9 | elves    | urban-computing-machine | requirements.txt         | = 1.11                  | CVE-2020-15105 | GHSA-vhr6-pvjm-9qwf | https://github.com/Bouke/django-two-factor-auth/security/advisories/GHSA-vhr6-pvjm-9qwf | published  | 2021-12-02 01:20:10 | 2021-12-02 01:20:10 | NULL             |         NULL | NULL           | NULL         |
| 12 | elves    | urban-computing-machine | requirements.txt         | = 0.2.0                 | CVE-2011-4103  | GHSA-pvhp-v9qp-xf5r | https://nvd.nist.gov/vuln/detail/CVE-2011-4103                                          | published  | 2021-12-02 23:17:53 | 2021-12-02 23:17:53 | NULL             |         NULL | NULL           | NULL         |
+----+----------+-------------------------+--------------------------+-------------------------+----------------+---------------------+-----------------------------------------------------------------------------------------+------------+---------------------+---------------------+------------------+--------------+----------------+--------------+
```

#### List secret scanning alerts across the enterprise
```sql
select 
  r.owner_login as org_name,  
  r.name as repo_name,
  tsr.*
from 
  token_scan_results as tsr,
  repositories as r
where
  r.id = tsr.repository_id;
```

```
+----------+-------------------------+----+---------------+---------------------+---------------------+------------+------------------------------------------------------------------+------------+-------------+-------------+--------+------------+
| org_name | repo_name               | id | repository_id | created_at          | updated_at          | token_type | token_signature                                                  | resolution | resolver_id | resolved_at | number | scan_scope |
+----------+-------------------------+----+---------------+---------------------+---------------------+------------+------------------------------------------------------------------+------------+-------------+-------------+--------+------------+
| elves    | urban-computing-machine |  1 |             2 | 2021-12-02 01:10:09 | 2021-12-02 01:10:09 | cp_1       | blah |       NULL |        NULL | NULL        |      1 |          2 |
+----------+-------------------------+----+---------------+---------------------+---------------------+------------+------------------------------------------------------------------+------------+-------------+-------------+--------+------------+
```


#### Helper tables
- github_enterprise.repositories
- github_enterprise.users
