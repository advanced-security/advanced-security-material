### SQL queries for Advanced Security metrics
Normally you would use the APIs to get this data, use the Security Overview page to review GHAS rollout and/or use the webhooks to sync GHAS related information to Slack or some centralised security platform. 
If you're on GHES, you can get into the `ghes-console` and run some SQL queries to get pretty much the same data.

If at all possible use the available APIs and webhooks to get this data. The method described here is reserved for users who have access to the `ghe-dbconsole` and have the intention of reading/getting information about Advanced Security rollout.

The syntax to run this on the appliance is `echo '<sql query>;' | ghe-dbconsole -y` OR run `ghe-dbconsole -y` and a `mysql` prompt will come up for you to run some queries.
