# GitHub Advanced Security (GHAS) Feature Matrix

This document helps answer the question "is this GHAS feature available in my version of GitHub Enterprise Server?".  

The following tables include notable feature releases for GitHub Advanced Security.  Each row represents a feature.  The columns in the row indicate the level of support for each **supported** Enterprise Server release.  Are your repositories hosted on github.com? All of these features are already available for you :+1:.

#### Contents
- [Secret scanning](#secret-scanning)
- [Code scanning](#code-scanning)
- [Supply-chain security](#supply-chain-security)
  - [Dependabot alerts](#dependabot-alerts)
  - [Dependabot security updates](#dependabot-updates)
  - [Dependency review and submission api](#dependency-review-and-submission-api) 
- [Security Overview](#security-overview)
- [Administration](#administration)
- [Dependencies](#dependencies)

#### How do I read this document?
Each section of this document represents a different capability of the GitHub security features.  Each row in the tables represent a different feature of GHAS.  The columns indicate if that feature is available in each version of GitHub Enterprise Server.  

Cells with ☑️ indicate beta support. ✅ indicates full support.

## Release notes
* [Releases of GitHub Enterprise Server](https://docs.github.com/en/enterprise-server/admin/all-releases#releases-of-github-enterprise-server)

|Version  |3.4 |3.5 |3.6 |3.7 |3.8 |3.9| 3.10|
|---------|-----|-----|-----|-----|-----|-----|----|
|Release date| 2022-02-15	| 2022-05-10 | 2022-07-26	|2022-10-25	|2023-02-07 | 2023-06-08 | 	2023-08-08 |
|Deprecation date | 2023-03-23 | 2023-06-29 | 2023-08-16 | 2023-11-08	| 2024-03-07 | 2024-06-29 | 2024-08-29	|
|| [Release notes](https://docs.github.com/en/enterprise-server@3.4/admin/release-notes)|[Release notes](https://docs.github.com/en/enterprise-server@3.5/admin/release-notes)|[Release notes](https://docs.github.com/en/enterprise-server@3.6/admin/release-notes)|[Release notes](https://docs.github.com/en/enterprise-server@3.7/admin/release-notes)|[Release notes](https://docs.github.com/en/enterprise-server@3.8/admin/release-notes)|[Release notes](https://docs.github.com/en/enterprise-server@3.9/admin/release-notes)|[Release notes](https://docs.github.com/en/enterprise-server@3.10/admin/release-notes)

## Secret scanning
Secret scanning identifies plain text credentials inside your code repository.  Learn more about secret scanning
* [Secret scanning documentation](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/about-secret-scanning)
* [Secret scanning API documentation](https://docs.github.com/en/enterprise-server/rest/secret-scanning?apiVersion=2022-11-28)

|Feature  |3.4 |3.5 |3.6 |3.7 |3.8 |3.9 | 3.10 |
|------------------------------------------------------------|-----|-----|-----|-----|-----|-----|-----|
|Partner pattern count|155|169|173|173|183|200|🚩|
|[User defined (custom) patterns](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/defining-custom-patterns-for-secret-scanning)|✅|✅|✅|✅|✅|✅|
|[Enterprise level API for secret scanning](https://docs.github.com/en/enterprise-server/rest/secret-scanning?apiVersion=2022-11-28#list-secret-scanning-alerts-for-an-enterprise)|✅|✅|✅|✅|✅|✅|
|[Secret scanning push protection](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/protecting-pushes-with-secret-scanning)||✅|✅|✅|✅|✅|
|[Dry runs for secret scanning push protection (repo level)](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/defining-custom-patterns-for-secret-scanning)||✅|✅|✅|✅|✅|
|[Secret scanning support for archived repos](https://github.blog/changelog/2022-02-16-secret-scanning-now-supports-archived-repositories/)||✅|✅|✅|✅|✅|
|[Custom pattern events in the audit log](https://github.blog/changelog/2022-04-06-secret-scanning-custom-pattern-events-now-in-the-audit-log/)||✅|✅|✅|✅|✅|
|[Push protection events in the audit log](https://docs.github.com/en/organizations/keeping-your-organization-secure/managing-security-settings-for-your-organization/audit-log-events-for-your-organization#secret_scanning_push_protection-category-actions)|||✅|✅|✅|✅|
|[Push protection in the web editor](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/protecting-pushes-with-secret-scanning#using-secret-scanning-as-a-push-protection-from-the-web-ui)|||✅|✅|✅|✅|
|[Enable secret scanning at the enterprise level](https://github.blog/changelog/2022-10-06-enable-secret-scanning-for-an-enterprise-with-one-click/)||||✅|✅|✅|
|[Dry runs for secret scanning custom patterns (org level)](https://github.blog/changelog/2022-02-11-secret-scanning-dry-runs-for-repository-level-custom-pattern/)||||✅|✅|✅|
|[Email notification for push protection bypass](https://github.blog/changelog/2022-07-27-secret-scanning-admins-now-receive-emails-when-contributors-bypass-a-push-protection-block/)||||✅|✅|✅|
|[Custom links in push protection notification](https://github.blog/changelog/2022-08-24-secret-scanning-admins-can-now-provide-a-link-to-display-when-a-push-is-blocked/)||||✅|✅|✅|
|[View secret scanning enablement status at the org-level via API](https://github.blog/changelog/2021-08-24-secret-scanning-org-level-rest-api/)||||✅|✅|✅|
|[Enable secret scanning at the enterprise level using the REST API](https://github.blog/changelog/2022-12-13-enable-secret-scanning-with-the-enterprise-level-rest-api/)|||||✅|✅|
|[Add comment when dismissing a secret scanning alert in UI or API](https://github.blog/changelog/2022-09-29-secret-scanning-alerts-now-have-a-timeline-and-users-can-add-a-comment-when-resolving/)|||||✅|✅|
|[Custom pattern creation at the enterprise level](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/defining-custom-patterns-for-secret-scanning)||||||✅|


## Code scanning
Code scanning is a feature that you use to analyze the code in a GitHub repository to find security vulnerabilities and coding errors. Any problems identified by the analysis are shown in GitHub.
* [Code scanning documentation](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning)
* [Code scanning API documentation](https://docs.github.com/en/rest/code-scanning?apiVersion=2022-11-28)

|Feature  |3.4 |3.5 |3.6 |3.7 |3.8 |3.9 |3.10 |
|------------------------------------------------------------|-----|-----|-----|-----|-----|-----|----|
|[CodeQL "toolcache" Installed Version](https://docs.github.com/en/enterprise-server/admin/code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance#provisioning-the-actions-for-code-scanning)|2.7.6|2.11.6|2.11.7|2.11.7|2.11.7|2.11.7|🚩|
|[Language support: Python, Javascript, Java, Go, C/C++, C#, Typescript](https://codeql.github.com/docs/codeql-overview/supported-languages-and-frameworks/)|✅|✅|✅|✅|✅|✅|
|[Ruby Support](https://codeql.github.com/docs/codeql-overview/supported-languages-and-frameworks/)|☑️|☑️|☑️|☑️|✅|✅|
|[Apple M1 support for CodeQL](https://github.blog/changelog/2021-11-10-codeql-now-supports-apple-silicon-m1/)|☑️|☑️|☑️|☑️|✅|✅|
|[Org-wide code scanning alerts via the REST API](https://docs.github.com/en/rest/code-scanning?apiVersion=2022-11-28#list-code-scanning-alerts-for-an-organization)||✅|✅|✅|✅|✅|
|[Add comments when dismissing alerts](https://docs.github.com/en/enterprise-server/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/managing-code-scanning-alerts-for-your-repository#dismissing--alerts)|||✅|✅|✅|✅|
|[Code scanning alert comments in the pull request conversation tab](https://github.blog/changelog/2022-06-02-users-can-view-and-comment-on-code-scanning-alerts-on-the-conversation-tab-in-a-pull-request/)||||✅|✅|✅|
|[Users can publish CodeQL packs to the container registry](https://docs.github.com/en/code-security/codeql-cli/using-the-codeql-cli/publishing-and-using-codeql-packs)||||✅|✅|✅|
|[CodeQL query filters to exclude individual queries](https://github.blog/changelog/2022-08-31-code-scanning-customize-your-codeql-analysis-using-query-filters/)||||✅|✅|✅|
|[Enterprise-wide code scanning alerts via the REST API](https://docs.github.com/en/enterprise-server/rest/code-scanning?apiVersion=2022-11-28#list-code-scanning-alerts-for-an-enterprise)||||✅|✅|✅|
|[Filter API results by severity](https://github.blog/changelog/2022-11-25-filter-code-scanning-api-results-by-alert-severity/)|||||✅|✅|
|[Kotlin language support](https://github.blog/changelog/2022-11-28-codeql-code-scanning-launches-kotlin-analysis-support-beta/)|||||☑️|☑️|
|[Default CodeQL setup](https://docs.github.com/en/enterprise-server/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/configuring-code-scanning-for-a-repository#configuring-code-scanning-automatically)||||||✅|
|[Default CodeQL setup via API](https://docs.github.com/en/enterprise-server/rest/code-scanning#update-a-code-scanning-default-setup-configuration)||||||✅|
|["Enable all" functionality at the org level (API and UI)](https://docs.github.com/en/enterprise-server/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/configuring-code-scanning-at-scale)||||||✅|
|[Tool status page](https://docs.github.com/en/enterprise-server/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-the-tool-status-page)||||||✅|
|[View org-level enablement status via the API ](https://docs.github.com/en/enterprise-server/rest/repos/repos?apiVersion=2022-11-28#list-organization-repositories)||||||✅|




## Supply-chain security

#### Dependabot Alerts
Dependabot alerts tell you that your code depends on a package that is insecure.
* [Dependabot alerts documentation](https://docs.github.com/en/code-security/dependabot/dependabot-alerts/about-dependabot-alerts)
* [Dependabot alerts API](https://docs.github.com/en/enterprise-server/rest/dependabot/alerts?apiVersion=2022-11-28)

|Feature  |3.4 |3.5 |3.6 |3.7 |3.8 |3.9 |3.10 |
|------------------------------------------------------------|-----|-----|-----|-----|-----|-----|----|
|[Dependabot Alerts](https://docs.github.com/en/code-security/dependabot/dependabot-alerts/about-dependabot-alerts)|✅|✅|✅|✅|✅|✅|🚩|
|[Go modules support](https://docs.github.com/en/enterprise-server/get-started/learning-about-github/github-language-support#core-languages-supported-by-github-features)|✅|✅|✅|✅|✅|✅|
|[Poetry support](https://docs.github.com/en/enterprise-server/get-started/learning-about-github/github-language-support#core-languages-supported-by-github-features)|✅|✅|✅|✅|✅|✅|
|[Cargo support](https://docs.github.com/en/enterprise-server/get-started/learning-about-github/github-language-support#core-languages-supported-by-github-features)|||✅|✅|✅|✅|
|[Reopen dismissed alerts](https://github.blog/changelog/2022-03-07-reopen-dismissed-dependabot-alerts/)|||✅|✅|✅|✅|
|[Dependabot alerts show vulnerable function calls](https://github.blog/2022-04-14-dependabot-alerts-now-surface-if-code-is-calling-vulnerability/)|||☑️|☑️|☑️|☑️|
|[Dependabot Alert timeline](https://github.blog/changelog/2022-07-28-dependabot-alerts-timeline-of-events-on-the-alert-details-page/)||||✅|✅|✅|
|[Bulk Editing of Alerts](https://docs.github.com/en/code-security/dependabot/dependabot-alerts/viewing-and-updating-dependabot-alerts)||||✅|✅|✅|
|[Add comment when dismissing dependabot alert](https://github.blog/changelog/2022-08-22-dependabot-alerts-optional-dismissal-comment-2/)||||✅|✅|✅|
|[Dev Dependencies label](https://github.blog/2023-05-02-dependabot-relieves-alert-fatigue-from-npm-devdependencies/)	||||✅|✅|✅|
|[View Dependabot enablement status via org-level API](https://github.blog/changelog/2023-02-28-dependabot-alerts-enterprise-enablement-and-status-checking/)||||✅|✅|✅|
|[Receive alerts for vulnerable GitHub Actions](https://docs.github.com/en/code-security/dependabot/working-with-dependabot/keeping-your-actions-up-to-date-with-dependabot)||||✅|✅|✅|
|[Dependabot alert webhooks](https://github.blog/changelog/2022-10-06-new-dependabot-alerts-webhook/)||||✅|✅|✅|
|[Dependabot alerts REST API endpoint for repository org and enterprise](https://docs.github.com/en/rest/dependabot/alerts?apiVersion=2022-11-28)|||||☑️|✅|
|[Export SBOM from dependency graph](https://docs.github.com/en/enterprise-server/code-security/supply-chain-security/understanding-your-software-supply-chain/exporting-a-software-bill-of-materials-for-your-repository)||||||✅|
|[Dependabot can parse and update Gradle version catalogs in `settings.gradle`](https://docs.github.com/en/enterprise-server/code-security/dependabot/dependabot-version-updates/about-dependabot-version-updates)||||||✅|


#### Dependabot Updates
|Feature  |3.4 |3.5 |3.6 |3.7 |3.8 |3.9 |3.10 |
|------------------------------------------------------------|-----|-----|-----|-----|-----|-----|----|
|[Dependabot Updates](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuring-dependabot-version-updates)|☑️|✅|✅|✅|✅|✅|🚩|
|Actions authors can automatically update dependencies within workflow files|||||✅|✅|
|Dart and Flutter (using Pub) support for updates|||||✅|✅|
|[Automatically pause pull request activity after 90 days of inactivity](https://docs.github.com/en/enterprise-server/code-security/dependabot/dependabot-security-updates/about-dependabot-security-updates#about-automatic-deactivation-of-dependabot-updates)||||||✅|

#### Dependency Review and submission API
Dependency review helps you understand dependency changes and the security impact of these changes at every pull request.
* [Dependency review docs](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/configuring-dependency-review)
* [Dependency review API docs](https://docs.github.com/en/rest/dependency-graph/dependency-review?apiVersion=2022-11-28)

|Feature  |3.4 |3.5 |3.6 |3.7 |3.8 |3.9 |3.10 |
|------------------------------------------------------------|-----|-----|-----|-----|-----|-----|----|
|[Dependency Review](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/configuring-dependency-review)|✅|✅|✅|✅|✅|✅|🚩|
|[Enforcement Action](https://github.blog/changelog/2022-04-06-github-action-for-dependency-review-enforcement/)|||✅|✅|✅|✅|
|[Dependency Submission API](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/using-the-dependency-submission-api)||||✅|✅|✅|


## Security Overview
Security overview provides high-level summaries of the security status of an organization or enterprise and makes it easy to identify repositories that require intervention.
* [Security Overview documentation](https://docs.github.com/en/enterprise-server/code-security/security-overview/about-security-overview)

|Feature  |3.4 |3.5 |3.6 |3.7 |3.8 |3.9 |3.10|
|------------------------------------------------------------|-----|-----|-----|-----|-----|-----|----|
|[Security Overview](https://docs.github.com/en/enterprise-server/code-security/security-overview/about-security-overview)|✅|✅|✅|✅|✅|✅|🚩|
|Organization view|☑️|✅|✅|✅|✅|✅|
|Enterprise view||☑️|☑️|✅|✅|✅|
|Organization-level Code Scanning Alert View||✅|✅|✅|✅|✅|
|Organization-level Dependabot Alert View||✅|✅|✅|✅|✅|
|Enterprse-level view of Dependabot alerts|||✅|✅|✅|✅|
|Enterprse-level view of code scanning alerts||||✅|✅|✅|
|Enterprse-level view of secret scanning alerts||||✅|✅|✅|
|Coverage and Risk Security Overview pages|||||☑️|☑️|
|[Filter alerts by repo topic](https://docs.github.com/en/enterprise-server/code-security/security-overview/filtering-alerts-in-security-overview)||||||✅|
|[Filter alerts by team](https://docs.github.com/en/enterprise-server/code-security/security-overview/filtering-alerts-in-security-overview)||||||✅|
|[Enable GHAS features in security overview](https://docs.github.com/en/enterprise-server/code-security/security-overview/about-security-overview)||||||✅|


## Administration
|Feature  |3.4 |3.5 |3.6 |3.7 |3.8 |3.9 |3.10
|------------------------------------------------------------|-----|-----|-----|-----|-----|-----|----|
|[Security Managers Role](https://docs.github.com/en/enterprise-server/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)|✅|✅|✅|✅|✅|✅|🚩|
|[Manage Security Managers role via the API](https://docs.github.com/en/enterprise-server/rest/orgs/security-managers?apiVersion=2022-11-28)||||✅|✅|✅|

## Dependencies
| Feature | GHAS license<br>required? | GitHub Actions<br>required? | GitHub Connect<br>required? | Documentation | Notes |
|---|---|---|---|---|---|
| Security Overview<br><br><details><summary>Description</summary>Know what needs attention throughout the entire SDLC</details> | No * | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/security-overview/about-the-security-overview) | * Features not needing a GHAS license will still show up |
| Dependency Graph<br><br><details><summary>Description</summary>Parse manifest and lock files in your repository</details> | No | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/admin/code-security/managing-supply-chain-security-for-your-enterprise/enabling-the-dependency-graph-for-your-enterprise) | Enabling this feature will reload some services on the appliance. |
| Dependabot Alerts<br><br><details><summary>Description</summary>Know which of :point_up: have open CVEs</details> | No | No | Yes | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/dependabot/dependabot-alerts/about-dependabot-alerts) | [GitHub Connect](https://docs.github.com/en/enterprise-server@latest/admin/configuration/configuring-github-connect/enabling-dependabot-for-your-enterprise) dependency and data transmission details |
| Dependabot Security Updates<br><br><details><summary>Description</summary>One-click "enable all" to send PRs updating :point_up: </details> | No | Yes | Yes | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/dependabot/dependabot-security-updates/about-dependabot-security-updates) | Requires a runner with Docker and internet connectivity to open PRs ([specs](https://docs.github.com/en/enterprise-server@latest/admin/github-actions/enabling-github-actions-for-github-enterprise-server/managing-self-hosted-runners-for-dependabot-updates))<br><br>As of GHES 3.8, will not require internet connectivity _if_ private registry is configured |
| Dependabot Updates<br><br><details><summary>Description</summary>Allows Dependabot to process optional updates using `~/.github/dependabot.yml` file</details> | No | Yes | Yes | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/dependabot/dependabot-version-updates) | Same requirements as :point_up: - this just allows the same "non-security" updates using the same flexible configuration file as GitHub.com |
| Dependency Review<br><br><details><summary>Description</summary>Inspect dependencies at pull request, blocking merges that add more security vulnerabilities</details> | Yes | Yes | Yes | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/admin/code-security/managing-github-advanced-security-for-your-enterprise/configuring-dependency-review-for-your-appliance) | Does not require the build to be moved into GitHub Actions, but needs a runner to inspect manifests |
| CodeQL<br><br><details><summary>Description</summary>Highly accurate static analysis tool, flexible and extensible query language</details> | Yes | No * | No * | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning-with-codeql) | * CodeQL can be installed in your existing build system ([directions](https://docs.github.com/en/enterprise-server@latest/code-security/code-scanning/using-codeql-code-scanning-with-your-existing-ci-system/installing-codeql-cli-in-your-ci-system)) and/or be used on GitHub Actions with self-hosted runners ([directions](https://docs.github.com/en/enterprise-server@latest/admin/code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance#running-code-scanning-using-github-actions))<br><br>* GitHub Connect is not required, but it makes keeping the CodeQL queries up-to-date easier.<br><br>* [codeql-action-sync-tool](https://github.com/github/codeql-action-sync-tool) is the offline updater without Connect.<br><br>* Code Scanning default setup requires runners with the `code-scanning` label applied. |
| Upload SARIF files from other tools<br><br><details><summary>Description</summary>View security results from other tools using SARIF file uploads</details> | Yes | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/code-scanning/integrating-with-code-scanning/uploading-a-sarif-file-to-github) | Many other tools support the SARIF interchange format.  This feature provides a single pane of glass into the entire codebase. |
| Secret scanning<br><br><details><summary>Description</summary>Look at the present and all history for secrets, including partner patterns and custom regex</details> | Yes | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/secret-scanning) |  |
| Push protection for secrets<br><br><details><summary>Description</summary>Block commits containing partner patterns and custom regex from GitHub, preventing compromise</details> | Yes | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/secret-scanning/protecting-pushes-with-secret-scanning) | Bare metal hypervisors may require an additional CPU flag, as outlined [here](https://docs.github.com/en/enterprise-server@latest/admin/code-security/managing-github-advanced-security-for-your-enterprise/configuring-secret-scanning-for-your-appliance) |
