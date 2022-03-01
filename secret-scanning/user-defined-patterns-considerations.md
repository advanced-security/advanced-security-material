- overall cost of scans on push is very low. it does not depend on LOC, only the size of the files. so they have a very small memory footprint unless you are pushing 100 mbs on each push.
backfills/full history scans are more expensive, and are relative to the size of the repo, how well its maintained and how costly it is to run git commands. The load here is always one time when scanning is first enabled.
- We provide configurability on how many scans of either type can be run at a given time. It can speeded up or slowed down to control the load on the system. The specific config names have changed from 3.0.
Some key things that are different:
- backfill scans are no longer capped at 15 mins, we run them till completion.
- some of the defaults for how many backfill scans have changed (previously we used to run 10 every 10 mins, now we pick up 1 backfill job every 10 seconds as long as there isnt another active one in flight)..
- everytime a user defined pattern is created, a backfill is triggered for all the repo(s) under scope. That can add additional load ad hoc.
- You should expect to see more network traffic, particularly when backfills are run. thats because scans are no longer run on the file servers, they are run in their own jobs. For single VM, tahts mostly cross the loopback address, for cluster setups that across the job server and file server nodes.
- no concerns for a 1000 repos that was discussed for Infosys.
- If for this or any other customers we are talking about similar or higher scale but with a high number of active monorepos, i can see a raesonable load during backfills. For reference, i would consider that if you have a 1000 very large mono repos in a isntance with 10s of thousands of repos, that would require a bit more thought.
- Note that in none of the cases above incremental or scan on push is a matter of concern.
- To Control backfill traffic, customers can consider a more gradual rollout of scanning across repos in their orgs/instance. when enabled at the org level, we make an attempt to do so using some of the defaults i described, but rollout gives more control.
for user defined patterns, a gradual rollout via enablement is not an option when its created at the org or enterprise level. I would highly recommend doing extensive testing with a repo for a new user defined pattern with data before applying it broadly.  One option here for new customers is to create these first, and then rollout enablement, so that backfills for these are included as part of the backfills that are done at enablement.
- In terms of resources usage
  - with controlled backfills and rollout without using user defined patterns, unless the instances are at the seams and have a couple of Gbs of memory available, you will be :thubs: ..
  -if the customer is also planning to use user defined patterns excessively (and i mean tens or hhundreds of patterns), you would want to have upto 10-20% more resources than the min, especially when the backfills are being run or user defined patterns are being created.
