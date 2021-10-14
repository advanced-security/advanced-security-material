### What is the problem
A recent change to dependabot means that workflows triggered by dependabot run with read-only permissions as if they were run from a fork. Unfortunately this has impacted code scanning workflows that run on push because uploading code scanning results requires write access.

Code scanning workflows that run on the pull_request event are not affected because of an existing features which gives the token provided by actions the ability to upload code scanning results for that pull request and only that pull request. We can't currently and don't plan to do a similarly targeted exception for dependabot pushes, and giving it the ability to upload code scanning results for any ref would be insecure.

Unfortunately pretty much the only thing we can do is to change the error message to be more clear what's going on. In #435 the error message will change to explain the problem and link to some documentation. That change will go live next week. Unfortunately an error message like that is not enough space to explain it fully, so we will also publish a more detailed explanation in the documentation and link to that once it's available.

### Only use the pull_request event for dependabot PRs
The good news is that it's easy to work around the above restrictions. Instead of running code scanning on pushes to every branch, you'll be able to get the same code scanning coverage by only running on pushes to a smaller set of branches (e.g. main, develop, release branches, ...) and then also running on the pull_request event for PRs targeting these branches.

See https://docs.github.com/en/code-security/secure-coding/configuring-code-scanning#scanning-on-push for how we recommend setting up code scanning and see https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#onpushpull_requestbranchestags for more info on the branches/branches-ignore syntax. The default workflow has changed over time so if you set up code scanning a while ago your workflow may be different from what's in those docs.

The simplest set of workflow triggers which will still likely work for a majority of projects might look like:

```
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
```
An alternative approach that runs on all pushes except dependabot would be:

```
on:
  push:
    branches-ignore:
      - 'dependabot/**'
  pull_request:
```

### Analysis still failing on the default branch
You may still run into cases where code scanning fails on commits made by dependabot even once the commit has been merged into the default branch. Quite a few of the examples earlier in this issue are this case. The reason for this is that in some cases the commit that gets merged into the default branch is solely authored by dependabot and thus the workflow runs with read-only permissions.

From what we can tell the only case where this can happen is if the dependabot PR is merged by using the @dependabot squash and merge syntax. Our advice would be to avoid using this syntax if at all possible. Thankfully the new feature to [automatically merge a pull request](https://docs.github.com/en/github/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/automatically-merging-a-pull-request) may be able to help here and fulfill the same functionality.

### Retrying analysis
Another thing to note is that performing certain actions on a workflow run changes its state from having dependabot as the actor that triggered the workflow to being you triggering the workflow. This includes things like merging main into the PR, or retrying the workflow run. When the workflow run retries it'll run with write permissions and code scanning will succeed.

Be aware that you may be running untrusted code, so check what change dependabot has made to avoid security breaches from compromised dependencies. If you are happy though then retrying the failed workflow run should make it succeed.
