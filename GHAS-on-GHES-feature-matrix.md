# GitHub Advanced Security (GHAS) Feature Matrix

This document helps answer the question "is this GHAS feature available in my version of GitHub Enterprise Server?".  

The following tables include notable feature releases for GitHub Advanced Security.  Each row represents a feature.  The columns in the row indicate the level of support for each **supported** Enterprise Server release.  Are your repositories hosted on github.com? All of these features are already available for you :+1:.

#### Contents
- [GitHub Advanced Security (GHAS) Feature Matrix](#github-advanced-security-ghas-feature-matrix)
      - [Contents](#contents)
      - [How do I read this document?](#how-do-i-read-this-document)
  - [Release notes](#release-notes)
  - [Secret scanning](#secret-scanning)
  - [Code scanning](#code-scanning)
  - [Supply-chain security](#supply-chain-security)
      - [Dependabot Alerts](#dependabot-alerts)
      - [Dependabot Updates](#dependabot-updates)
      - [Dependency Review and submission API](#dependency-review-and-submission-api)
  - [Security Overview](#security-overview)
  - [Administration](#administration)
- [Dependencies](#dependencies)

#### How do I read this document?
Each section of this document represents a different capability of the GitHub security features.  Each row in the tables represent a different feature of GHAS.  The columns indicate if that feature is available in each version of GitHub Enterprise Server.  

Cells with ☑️ indicate beta support. ✅ indicates full support.

#### End of life Archive
- [2022 / 2023 GHES 3.4 - GHES 3.11](./advanced-security/archive/GHAS-on-GHES-feature-matrix-2025.md)

## Release notes
* [Releases of GitHub Enterprise Server](https://docs.github.com/en/enterprise-server/admin/all-releases#releases-of-github-enterprise-server)

|Version  |3.12|3.13|3.14|3.15|3.16|3.17|3.18|3.19|
|---------|----|----|----|----|----|----|-----|-----|
|Release date| 2024-02-13 | 2024-06-18 | 2024-08-06 | 2024-11-12 | 2025-02-25 | 2025-05-20 | 2025-10-14| 2025-12-09|
|Deprecation date | 2025-03-05| 2025-07-18 | 2025-08-27 | 2025-12-19 | 2026-03-11 | 2026-06-03 | 2026-08-25| 2026-12-09|
|| [Notes](https://docs.github.com/en/enterprise-server@3.12/admin/release-notes) | [Notes](https://docs.github.com/en/enterprise-server@3.13/admin/release-notes)| [Notes](https://docs.github.com/en/enterprise-server@3.14/admin/release-notes#3.14.0) | [Notes](https://docs.github.com/en/enterprise-server@3.15/admin/release-notes#3.15.0) | [Notes](https://docs.github.com/en/enterprise-server@3.16/admin/release-notes) | [Notes](https://docs.github.com/en/enterprise-server@3.17/admin/release-notes) | [Notes](https://docs.github.com/en/enterprise-server@3.18/admin/release-notes)| [Notes](https://docs.github.com/en/enterprise-server@3.19/admin/release-notes)|

## Secret scanning
Secret scanning identifies plain text credentials inside your code repository.  Learn more about secret scanning
* [Secret scanning documentation](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/about-secret-scanning)
* [Secret scanning API documentation](https://docs.github.com/en/enterprise-server/rest/secret-scanning?apiVersion=2022-11-28)

|Feature  |3.12|3.13|3.14|3.15|3.16|3.17|3.18|3.19|
|------------------------------------------------------------|-----|-----|-----|-----|-----|-----|-----|-----|
|[Partner pattern count](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/secret-scanning-patterns)|249|274|274|286|289|321|347|370|
|[Non-provider patterns](https://github.blog/changelog/2023-11-06-secret-scanning-expands-detection-to-include-non-provider-patterns-beta/)|☑️|☑️|☑️|☑️|✅|✅|✅|✅|
| [User-space secret scanning](https://docs.github.com/en/enterprise-server@3.13/admin/code-security/managing-github-advanced-security-for-your-enterprise/managing-github-advanced-security-features-for-your-enterprise)||✅|✅|✅|✅|✅|✅|✅|
| [Push Protection Bypass](https://docs.github.com/en/enterprise-server@3.14/code-security/secret-scanning/push-protection-for-repositories-and-organizations#enabling-delegated-bypass-for-push-protection) || | ☑️|☑️|✅|✅|✅|✅|
| [Detect secrets leaked in discussions and in pull request titles, bodies, and comments](https://docs.github.com/en/enterprise-server@3.14/code-security/secret-scanning/about-secret-scanning) | ||☑️|✅|✅|✅|✅|✅|
| Push protection on file upload |||☑️|☑️|✅|✅|✅|✅|
| Audit log events for non-provider patterns || | ✅|✅|✅|✅|✅|✅|
| [Create a push protection bypass API endpoint](https://github.blog/changelog/2024-08-13-secret-scanning-push-protection-is-supported-for-content-upload-rest-api-endpoints/) ||||✅|✅|✅|✅|✅|
| [Enabling detection of non-provider patterns for an organization](https://docs.github.com/en/enterprise-server@3.15/code-security/secret-scanning/using-advanced-secret-scanning-and-push-protection-features/non-provider-patterns/enabling-secret-scanning-for-non-provider-patterns#enabling-detection-of-non-provider-patterns-for-an-organization) ||||☑️|✅|✅|✅|✅|
| [REST API endpoint for secret scanning scan history](https://docs.github.com/en/enterprise-server@3.16/rest/secret-scanning/secret-scanning?apiVersion=2022-11-28#get-secret-scanning-scan-history-for-a-repository) |||| |✅|✅|✅|✅|
| [Delegated alert dismissal for secret scanning](https://github.blog/changelog/2025-03-05-delegated-alert-dismissal-for-code-scanning-and-secret-scanning-now-available-in-public-preview/) | |||||☑️|✅|✅|
| [Secret scanning scan events via audit log and webhooks](https://github.blog/changelog/2024-12-20-audit-log-and-webhook-events-for-secret-scan-completions/) | |||||✅|✅|✅|
| [Base64-encoded GitHub tokens detection](https://github.blog/changelog/2025-02-14-secret-scanning-detects-base64-encoded-github-tokens/) | |||||✅|✅|✅|
| [Push protection bypass requests management via REST API](https://github.blog/changelog/2025-02-27-manage-push-protection-bypass-requests-for-secret-scanning-with-the-rest-api/) | |||||✅|✅|✅|
| [Free secret risk assessment for organization and security admins](https://docs.github.com/en/enterprise-server@3.18/code-security/secret-scanning/managing-alerts-from-secret-scanning) | ||||||✅|✅|
| [Configurable push protection patterns](https://github.blog/changelog/2025-08-19-secret-scanning-configuring-patterns-in-push-protection-is-now-generally-available/) |||||||✅|✅|
| [Secret scanning in GitHub wikis](https://docs.github.com/en/enterprise-server@3.19/code-security/secret-scanning/about-secret-scanning) ||||||||✅|
| [REST API first_location_detected and has_more_locations fields](https://docs.github.com/en/enterprise-server@3.19/rest/secret-scanning) ||||||||✅|

## Code scanning
Code scanning is a feature that you use to analyze the code in a GitHub repository to find security vulnerabilities and coding errors. Any problems identified by the analysis are shown in GitHub.
* [Code scanning documentation](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning)
* [Code scanning API documentation](https://docs.github.com/en/rest/code-scanning?apiVersion=2022-11-28)

|Feature  |3.12|3.13|3.14|3.15|3.16|3.17|3.18|3.19|
|------------------------------------------------------------|----|----|----|----|-----|-----|-----|-----|
|[CodeQL "toolcache" Version](https://docs.github.com/en/enterprise-server/admin/code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance#provisioning-the-actions-for-code-scanning)|[2.15.5](https://codeql.github.com/docs/codeql-overview/codeql-changelog/codeql-cli-2.15.5/)|[2.16.5](https://github.blog/changelog/2024-01-23-codeql-2-16-python-dependency-installation-disabled-new-queries-and-bug-fixes/)|[2.17.6](https://codeql.github.com/docs/codeql-overview/codeql-changelog/codeql-cli-2.17.6/)|[2.18.4](https://docs.github.com/en/enterprise-server@3.15/admin/release-notes#code-scanning)|[2.20.3](https://docs.github.com/en/enterprise-server@3.16/admin/managing-code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance)|[2.20.7](https://docs.github.com/en/enterprise-server@3.17/admin/release-notes#code-security)|[2.21.4](https://github.blog/changelog/2025-06-10-codeql-2-21-4-adds-swift-6-1-1-support/)|[2.22.4](https://github.blog/changelog/2025-09-03-codeql-2-22-4-adds-support-for-go-1-25-and-accuracy-improvements/)|
|[Kotlin language support](https://github.blog/changelog/2022-11-28-codeql-code-scanning-launches-kotlin-analysis-support-beta/)|☑️|☑️|☑️|✅|✅|✅|✅|✅|
|[CodeQL supports Swift programming language](https://github.blog/changelog/2023-06-01-codeql-code-scanning-now-supports-swift-beta/)|☑️|☑️|☑️|✅|✅|✅|✅|✅|
|[CodeQL threat models for detecting relevant alerts](https://docs.github.com/en/enterprise-server@3.13/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/customizing-your-advanced-setup-for-code-scanning#extending-codeql-coverage-with-threat-models)||☑️|☑️|☑️|☑️|✅|✅|✅|
|[Code Scanning merge protection rulesets](https://docs.github.com/en/enterprise-server@3.14/code-security/code-scanning/managing-your-code-scanning-configuration/set-code-scanning-merge-protection)|||☑️|☑️|☑️|✅|✅|✅|
|[CodeQL threat models for default setup](https://docs.github.com/en/enterprise-server@3.14/code-security/code-scanning/managing-your-code-scanning-configuration/editing-your-configuration-of-default-setup#including-local-sources-of-tainted-data-in-default-setup)|||☑️|☑️|☑️|✅|✅|✅|
|[CodeQL model packs for organization/repo](https://docs.github.com/en/enterprise-server@3.14/code-security/code-scanning/managing-your-code-scanning-configuration/editing-your-configuration-of-default-setup#extending-codeql-coverage-with-codeql-model-packs-in-default-setup)|||☑️|☑️|☑️|✅|✅|✅|
|[CodeQL can scan Java projects without a build](https://docs.github.com/en/enterprise-server@3.15/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages#codeql-build-modes)|||☑️|☑️|☑️|✅|✅|✅|
|[CodeQL can scan C# projects without a build](https://docs.github.com/en/enterprise-server@3.15/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages#codeql-build-modes)  ||||☑️|☑️|✅|✅|✅|
|[CodeQL dependency caching for advanced setup](https://docs.github.com/en/enterprise-server@3.16/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages#about-dependency-caching-for-codeql) |||||✅|✅|✅|✅|
|[Zstandard archive for CodeQL tools](https://docs.github.com/en/enterprise-server@3.16/code-security/codeql-cli/getting-started-with-the-codeql-cli/setting-up-the-codeql-cli#1-download-the-codeql-cli-tar-archive) |||||✅|✅|✅|✅|
| [Delegated alert dismissal for code scanning](https://github.blog/changelog/2025-03-05-delegated-alert-dismissal-for-code-scanning-and-secret-scanning-now-available-in-public-preview/) ||||||☑️|✅|✅|
| [Code scanning alert-related events in audit log](https://github.blog/changelog/2024-12-03-code-scanning-now-creates-alert-related-events-in-audit-log/) ||||||✅|✅|✅|
| [Development section to track code scanning alert resolution progress](https://docs.github.com/en/enterprise-server@3.18/code-security/code-scanning/managing-code-scanning-alerts/managing-code-scanning-alerts-for-your-repository) |||||||✅|✅|
| [CodeQL code scanning to detect security vulnerabilities in GitHub Actions workflows](https://docs.github.com/en/enterprise-server@3.18/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages) |||||||✅|✅|
| [CodeQL Rust language support](https://github.blog/changelog/2025-07-03-codeql-2-22-1-bring-rust-support-to-public-preview/) ||||||||☑️|
| [Improved Go generics and dataflow analysis](https://github.blog/changelog/2025-06-12-codeql-2-22-0-improves-coverage-for-go-and-adds-support-for-swift-6-1-2/) ||||||||✅|
| [CodeQL supports Swift 6.1.2](https://github.blog/changelog/2025-06-12-codeql-2-22-0-improves-coverage-for-go-and-adds-support-for-swift-6-1-2/) ||||||||✅|
| [CodeQL supports Go 1.25](https://github.blog/changelog/2025-09-03-codeql-2-22-4-adds-support-for-go-1-25-and-accuracy-improvements/) ||||||||✅|
| [Multiple SARIF runs processed as separate scans](https://github.blog/changelog/2025-07-21-code-scanning-will-stop-combining-multiple-sarif-runs-uploaded-in-the-same-sarif-file/) ||||||||✅|
| [Security configurations support default or advanced CodeQL setup](https://github.blog/changelog/2025-07-15-security-configurations-support-for-running-codeql-in-either-default-or-advanced-setup/) ||||||||✅|

## Supply-chain security

#### Dependabot Alerts
Dependabot alerts tell you that your code depends on a package that is insecure.
* [Dependabot alerts documentation](https://docs.github.com/en/code-security/dependabot/dependabot-alerts/about-dependabot-alerts)
* [Dependabot alerts API](https://docs.github.com/en/enterprise-server/rest/dependabot/alerts?apiVersion=2022-11-28)

|Feature  |3.12|3.13|3.14|3.15|3.16|3.17|3.18|3.19|
|------------------------------------------------------------|----|----|----|----|-----|-----|-----|-----|
|[Dependabot alerts show vulnerable function calls](https://github.blog/2022-04-14-dependabot-alerts-now-surface-if-code-is-calling-vulnerability/)|☑️|☑️|☑️|☑️|☑️||||
|[Dependabot auto-triage rules](https://docs.github.com/en/enterprise-server@3.12/code-security/dependabot/dependabot-auto-triage-rules/about-dependabot-auto-triage-rules)|✅|✅|✅|✅|✅|✅|✅|✅|
|[Security advisories can use the new CVSS 4.0 schema to calculate a base vulnerability score](https://docs.github.com/en/enterprise-server@3.16/code-security/security-advisories/working-with-global-security-advisories-from-the-github-advisory-database/about-the-github-advisory-database#about-cvss-levels)|||||✅|✅|✅|✅|
|[Added Exploit Prediction Scoring System (EPSS) to advisories to show estimated probability that a vulnerability will be exploited over the next 30 days](https://docs.github.com/en/enterprise-server@3.16/code-security/security-advisories/working-with-global-security-advisories-from-the-github-advisory-database/about-the-github-advisory-database#about-epss-scores)|||||✅|✅|✅|✅|
| [EPSS scores for vulnerability prioritization in Dependabot alerts](https://github.blog/changelog/2025-02-19-dependabot-helps-users-focus-on-the-most-important-alerts-by-including-epss-scores-that-indicate-likelihood-of-exploitation-now-generally-available/) ||||||✅|✅|✅|
| [Dependabot metrics page for prioritizing security fixes](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/working-with-dependabot/viewing-and-updating-dependabot-alerts) ||||||||✅|


#### Dependabot Updates
|Feature  |3.12|3.13|3.14|3.15|3.16|3.17|3.18|3.19|
|------------------------------------------------------------|----|----|----|----|-----|-----|-----|-----|
|[Dependabot supports `devcontainer.json` files](https://docs.github.com/en/enterprise-server@3.13/code-security/dependabot/dependabot-version-updates/about-dependabot-version-updates#dev-containers)||✅|✅|✅|✅|✅|✅|✅|
|[Dependabot access to Cargo private registries](https://docs.github.com/en/enterprise-server@3.14/code-security/dependabot/working-with-dependabot/guidance-for-the-configuration-of-private-registries-for-dependabot#about-configuring-private-registries-for-dependabot)|||✅|✅|✅|✅|✅|✅|
|Dependabot pauses scheduled jobs after 15 failures.|||✅|✅|✅|✅|✅|✅|
|[Dependabot grouped security updates](https://docs.github.com/en/enterprise-server@3.14/code-security/dependabot/dependabot-security-updates/about-dependabot-security-updates#about-grouped-security-updates)|||✅|✅|✅|✅|✅|✅|
|[Private registry support for target-branch configuration](https://docs.github.com/en/enterprise-server@3.14/code-security/dependabot/working-with-dependabot/configuring-access-to-private-registries-for-dependabot)|||✅|✅|✅|✅|✅|✅|
|[Updates support pnpm workspace catalogs](https://github.blog/changelog/2025-02-04-dependabot-now-supports-pnpm-workspace-catalogs-ga/)|||||✅|✅|✅|✅|
|[Version updates support .NET SDK in global.json](https://docs.github.com/en/enterprise-server@3.16/admin/release-notes#dependabot)|||||✅|✅|✅|✅|
| [Dependabot version updates support for bun dependencies](https://docs.github.com/en/code-security/dependabot/ecosystems-supported-by-dependabot/supported-ecosystems-and-repositories#supported-ecosystems-and-repositories) ||||||✅|✅|✅|
| [Dependabot version updates support for Docker Compose dependencies](https://docs.github.com/en/code-security/dependabot/ecosystems-supported-by-dependabot/supported-ecosystems-and-repositories#supported-ecosystems-and-repositories) ||||||✅|✅|✅|
| [Dependabot version updates support for uv dependencies](https://docs.github.com/en/code-security/dependabot/ecosystems-supported-by-dependabot/supported-ecosystems-and-repositories#supported-ecosystems-and-repositories) ||||||✅|✅|✅|
| [Organization administrators can grant Dependabot access to repositories at scale](https://docs.github.com/en/enterprise-server@3.18/code-security/dependabot/working-with-dependabot/managing-dependabot-on-self-hosted-runners) |||||||✅|✅|
| [Dependabot version updates support for Helm dependencies](https://docs.github.com/en/enterprise-server@3.18/code-security/dependabot/dependabot-version-updates/about-dependabot-version-updates) |||||||✅|✅|
| [Custom update frequencies for Dependabot using cron expressions](https://docs.github.com/en/enterprise-server@3.18/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file#scheduleinterval) |||||||✅|✅|
| [Dependabot supports Gradle lockfiles](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/dependabot-version-updates/about-dependabot-version-updates) ||||||||✅|
| [Minimum package age configuration](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file) ||||||||✅|
| [Cross-ecosystem grouped pull requests](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file) ||||||||✅|
| [Central management of private registry configurations](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/working-with-dependabot/configuring-access-to-private-registries-for-dependabot) ||||||||✅|
| [Dependabot version updates support for vcpkg dependencies](https://github.blog/changelog/2025-08-12-dependabot-version-updates-now-support-vcpkg/) ||||||||✅|
| [Dependabot version updates support for Rust toolchain](https://github.blog/changelog/2025-08-19-dependabot-now-supports-rust-toolchain-updates/) ||||||||✅|
| [Exclude automatic PRs for manifests in selected subdirectories](https://github.blog/changelog/2025-08-26-dependabot-can-now-exclude-automatic-pull-requests-for-manifests-in-selected-subdirectories/) ||||||||✅|
| [Dependabot can update private Go modules](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/working-with-dependabot/guidance-for-the-configuration-of-private-registries-for-dependabot) ||||||||✅|

#### Dependency Graph, Dependency Review and snapshot submission API
Dependency review helps you understand dependency changes and the security impact of these changes at every pull request.
* [Dependency review docs](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/configuring-dependency-review)
* [Dependency review API docs](https://docs.github.com/en/rest/dependency-graph/dependency-review?apiVersion=2022-11-28)

|Feature  |3.12|3.13|3.14|3.15|3.16|3.17|3.18|3.19|
|------------------------------------------------------------|----|----|----|----|-----|-----|-----|-----|
|SBOM generated for a package now includes the package URL for more packages|||✅|✅|✅|✅|✅|✅|

## Security Overview
Security overview provides high-level summaries of the security status of an organization or enterprise and makes it easy to identify repositories that require intervention.
* [Security Overview documentation](https://docs.github.com/en/enterprise-server/code-security/security-overview/about-security-overview)

|Feature  |3.12|3.13|3.14|3.15|3.16|3.17|3.18|3.19|
|------------------------------------------------------------|----|----|----|----|-----|-----|-----|-----|
|[Enablement trends dashboard is available](https://docs.github.com/en/enterprise-server@3.13/code-security/security-overview/assessing-adoption-code-security#viewing-enablement-trends-for-an-organization-beta)||✅|✅|✅|✅|✅|✅|✅|
|[Enterprise level secret scanning metrics and enablement trend dashboards](https://docs.github.com/en/enterprise-server@3.14/code-security/security-overview/viewing-security-insights)|||✅|✅|✅|✅|✅|✅|
|[Security overview dashboard group by tool](https://docs.github.com/en/enterprise-server@3.14/code-security/security-overview/viewing-security-insights#viewing-the-security-overview-dashboard-for-your-organization)|||✅|✅|✅|✅|✅|✅|
|Security overview dashboard filter by security tool|||☑️|✅|✅|✅|✅|✅|
|[CodeQL pull request alerts view](https://docs.github.com/en/enterprise-server@3.15/code-security/security-overview/viewing-metrics-for-pull-request-alerts)||||✅|✅|✅|✅|✅|
|[Security overview dashboard adds SAST vulnerabilities summary table](https://docs.github.com/en/enterprise-server@3.16/code-security/security-overview/viewing-security-insights)|||||✅|✅|✅|✅|
|[Security overview dashboard adds Prevention metrics alongside Detection and Remediation metrics at both the organization and enterprise levels](https://github.blog/changelog/2024-09-19-enhanced-security-overview-dashboard-detection-remediation-and-prevention-at-the-forefront/)|||||✅|✅|✅|✅|
|[Export CSV data from the "CodeQL pull request alerts" view](https://docs.github.com/en/enterprise-server@3.16/code-security/security-overview/viewing-metrics-for-pull-request-alerts)|||||✅|✅|✅|✅|
|[Security overview dashboard accessibility enhancements](https://github.blog/changelog/2024-11-20-accessibility-improvements-for-security-overview/)|||||✅|✅|✅|✅|


## Administration
|Feature  |3.12 |3.13|3.14|3.15|3.16|3.17|3.18|3.19|
|------------------------------------------------------------|----|----|----|----|-----|-----|-----|-----|
|[Enable at scale - security configurations](https://docs.github.com/en/enterprise-server@3.15/code-security/securing-your-organization/introduction-to-securing-your-organization-at-scale/about-enabling-security-features-at-scale)||||✅|✅|✅|✅|✅|
|[Enterprise-level security configurations](https://docs.github.com/en/enterprise-server@3.16/code-security/securing-your-organization/introduction-to-securing-your-organization-at-scale/about-enabling-security-features-at-scale#about-enterprise-level-security-configurations)|||||✅|✅|✅|✅|
|[Security configurations for archived repositories](https://docs.github.com/en/enterprise-server@3.16/code-security/securing-your-organization/introduction-to-securing-your-organization-at-scale/about-enabling-security-features-at-scale)|||||✅|✅|✅|✅|
|[Advanced filtering for repository selection by security feature status](https://docs.github.com/en/enterprise-server@3.16/code-security/securing-your-organization/introduction-to-securing-your-organization-at-scale/creating-security-configurations-for-your-organization)|||||✅|✅|✅|✅|
|[Security manager role can be assigned directly to individual users](https://docs.github.com/en/enterprise-server@3.16/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)|||||✅|✅|✅|✅|
| ["Not set" option for security configurations](https://docs.github.com/en/enterprise-server@3.19/code-security/securing-your-organization/enabling-security-features-in-your-organization/creating-a-custom-security-configuration) ||||||||✅|

# Dependencies
This section calls out the dependencies required to enable GitHub Advanced Security on GitHub Enterprise Server.

| Feature | GHAS license<br>required? | GitHub Actions<br>required? | GitHub Connect<br>required? | Documentation | Notes |
|---|---|---|---|---|---|
| Security Overview<br><br><details><summary>Description</summary>Know what needs attention throughout the entire SDLC</details> | No * | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/security-overview/about-the-security-overview) | * Features not needing a GHAS license will still show up |
| Dependency Graph<br><br><details><summary>Description</summary>Parse manifest and lock files in your repository</details> | No | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/admin/code-security/managing-supply-chain-security-for-your-enterprise/enabling-the-dependency-graph-for-your-enterprise) | Enabling this feature will reload some services on the appliance. |
| Dependabot Alerts<br><br><details><summary>Description</summary>Know which of :point_up: have open CVEs</details> | No | No | Yes | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/dependabot/dependabot-alerts/about-dependabot-alerts) | [GitHub Connect](https://docs.github.com/en/enterprise-server@latest/admin/configuration/configuring-github-connect/enabling-dependabot-for-your-enterprise) dependency and data transmission details |
| Dependabot Security Updates<br><br><details><summary>Description</summary>One-click "enable all" to send PRs updating :point_up: </details> | No | Yes | Yes | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/dependabot/dependabot-security-updates/about-dependabot-security-updates) | Requires a runner with Docker and internet connectivity to open PRs ([specs](https://docs.github.com/en/enterprise-server@latest/admin/github-actions/enabling-github-actions-for-github-enterprise-server/managing-self-hosted-runners-for-dependabot-updates))<br><br>As of GHES 3.8, will not require internet connectivity _if_ private registry is configured |
| Dependabot Updates<br><br><details><summary>Description</summary>Allows Dependabot to process optional updates using `~/.github/dependabot.yml` file</details> | No | Yes | Yes | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/dependabot/dependabot-version-updates) | Same requirements as :point_up: - this just allows the same "non-security" updates using the same flexible configuration file as GitHub.com |
| Dependency Review<br><br><details><summary>Description</summary>Inspect dependencies at pull request, blocking merges that add more security vulnerabilities</details> | Yes | Yes | Yes | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/admin/code-security/managing-github-advanced-security-for-your-enterprise/configuring-dependency-review-for-your-appliance) | Does not require the build to be moved into GitHub Actions, but needs a runner to inspect manifests. <br><br>  Dependency "snapshots" submitted through the dependency submission API for non-default branches are not supported on GitHub Enterprise Server. <br><br>  Checking for licenses is not supported on GitHub Enterprise Server because the API does not return license information. |
| CodeQL<br><br><details><summary>Description</summary>Highly accurate static analysis tool, flexible and extensible query language</details> | Yes | No * | No * | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning-with-codeql) | * CodeQL can be installed in your existing build system ([directions](https://docs.github.com/en/enterprise-server@latest/code-security/code-scanning/using-codeql-code-scanning-with-your-existing-ci-system/installing-codeql-cli-in-your-ci-system)) and/or be used on GitHub Actions with self-hosted runners ([directions](https://docs.github.com/en/enterprise-server@latest/admin/code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance#running-code-scanning-using-github-actions))<br><br>* GitHub Connect is not required, but it makes keeping the CodeQL queries up-to-date easier.<br><br>* [codeql-action-sync-tool](https://github.com/github/codeql-action-sync-tool) is the offline updater without Connect.<br><br>* Code Scanning default setup requires runners with the `code-scanning` label applied. |
| Upload SARIF files from other tools<br><br><details><summary>Description</summary>View security results from other tools using SARIF file uploads</details> | Yes | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/code-scanning/integrating-with-code-scanning/uploading-a-sarif-file-to-github) | Many other tools support the SARIF interchange format.  This feature provides a single pane of glass into the entire codebase. |
| Secret scanning<br><br><details><summary>Description</summary>Look at the present and all history for secrets, including partner patterns and custom regex</details> | Yes | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/secret-scanning) |  |
| Push protection for secrets<br><br><details><summary>Description</summary>Block commits containing partner patterns and custom regex from GitHub, preventing compromise</details> | Yes | No | No | [Feature Docs](https://docs.github.com/en/enterprise-server@latest/code-security/secret-scanning/protecting-pushes-with-secret-scanning) | Bare metal hypervisors may require an additional CPU flag, as outlined [here](https://docs.github.com/en/enterprise-server@latest/admin/code-security/managing-github-advanced-security-for-your-enterprise/configuring-secret-scanning-for-your-appliance) |
