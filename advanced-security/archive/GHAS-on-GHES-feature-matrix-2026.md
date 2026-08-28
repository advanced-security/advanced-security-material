# GitHub Advanced Security (GHAS) Feature Matrix

This document helps answer the question "is this GHAS feature available in my version of GitHub Enterprise Server?".  

The following tables include notable feature releases for GitHub Advanced Security.  Each row represents a feature.  The columns in the row indicate the level of support for each **supported** Enterprise Server release.  Are your repositories hosted on github.com? All of these features are already available for you :+1:.

#### How do I read this document?
Each section of this document represents a different capability of the GitHub security features.  Each row in the tables represent a different feature of GHAS.  The columns indicate if that feature is available in each version of GitHub Enterprise Server.  

Cells with ☑️ indicate [Public Preview](https://github.blog/changelog/2024-10-18-new-terminology-for-github-previews/) support. ✅ indicates General Availability.

## Release notes
* [Releases of GitHub Enterprise Server](https://docs.github.com/en/enterprise-server/admin/all-releases#releases-of-github-enterprise-server)

|Version  |3.14|3.15|3.16|
|---------|----|----|----|
|Release date| 2024-08-27 | 2024-12-03 | 2025-03-11 |
|Deprecation date | 2026-04-09 | 2026-04-09 | 2026-06-02 |
|| [Notes](https://docs.github.com/en/enterprise-server@3.14/admin/release-notes) | [Notes](https://docs.github.com/en/enterprise-server@3.15/admin/release-notes) | [Notes](https://docs.github.com/en/enterprise-server@3.16/admin/release-notes) |

## Secret Protection
Secret scanning identifies plain text credentials inside your code repository.  Learn more about secret scanning
* [Secret scanning documentation](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/about-secret-scanning)
* [Secret scanning API documentation](https://docs.github.com/en/enterprise-server/rest/secret-scanning?apiVersion=2022-11-28)

|Feature  |3.14|3.15|3.16|
|------------------------------------------------------------|-----|-----|-----|
|[Partner pattern count](https://docs.github.com/en/enterprise-server/code-security/secret-scanning/secret-scanning-patterns)|274|286|289|
|[Non-provider patterns](https://github.blog/changelog/2023-11-06-secret-scanning-expands-detection-to-include-non-provider-patterns-beta/)|☑️|☑️|✅|
| [User-space secret scanning](https://docs.github.com/en/enterprise-server@3.13/admin/code-security/managing-github-advanced-security-for-your-enterprise/managing-github-advanced-security-features-for-your-enterprise)|✅|✅|✅|
| [Push Protection Bypass](https://docs.github.com/en/enterprise-server@3.14/code-security/secret-scanning/push-protection-for-repositories-and-organizations#enabling-delegated-bypass-for-push-protection) | ☑️|☑️|✅|
| [Detect secrets leaked in discussions and in pull request titles, bodies, and comments](https://docs.github.com/en/enterprise-server@3.14/code-security/secret-scanning/about-secret-scanning) |☑️|✅|✅|
| Push protection on file upload |☑️|☑️|✅|
| Audit log events for non-provider patterns |✅|✅|✅|
| [Create a push protection bypass API endpoint](https://github.blog/changelog/2024-08-13-secret-scanning-push-protection-is-supported-for-content-upload-rest-api-endpoints/) |✅|✅|✅|
| [Enabling detection of non-provider patterns for an organization](https://docs.github.com/en/enterprise-server@3.15/code-security/secret-scanning/using-advanced-secret-scanning-and-push-protection-features/non-provider-patterns/enabling-secret-scanning-for-non-provider-patterns#enabling-detection-of-non-provider-patterns-for-an-organization) |☑️|✅|✅|
| [REST API endpoint for secret scanning scan history](https://docs.github.com/en/enterprise-server@3.16/rest/secret-scanning/secret-scanning?apiVersion=2022-11-28#get-secret-scanning-scan-history-for-a-repository) | |✅|✅|
| [Delegated alert dismissal for secret scanning](https://github.blog/changelog/2025-03-05-delegated-alert-dismissal-for-code-scanning-and-secret-scanning-now-available-in-public-preview/) | |||
| [Secret scanning scan events via audit log and webhooks](https://github.blog/changelog/2024-12-20-audit-log-and-webhook-events-for-secret-scan-completions/) ||||
| [Base64-encoded GitHub tokens detection](https://github.blog/changelog/2025-02-14-secret-scanning-detects-base64-encoded-github-tokens/) ||||
| [Push protection bypass requests management via REST API](https://github.blog/changelog/2025-02-27-manage-push-protection-bypass-requests-for-secret-scanning-with-the-rest-api/) ||||
| [Free secret risk assessment for organization and security admins](https://docs.github.com/en/enterprise-server@3.18/code-security/secret-scanning/managing-alerts-from-secret-scanning) ||||
| [Configurable push protection patterns](https://github.blog/changelog/2025-08-19-secret-scanning-configuring-patterns-in-push-protection-is-now-generally-available/) ||||
| [Secret scanning in GitHub wikis](https://docs.github.com/en/enterprise-server@3.19/code-security/secret-scanning/about-secret-scanning) ||||
| [REST API first_location_detected and has_more_locations fields](https://docs.github.com/en/enterprise-server@3.19/rest/secret-scanning) ||||
| [Secret scanning validity checks](https://docs.github.com/en/enterprise-server@latest/code-security/concepts/secret-security/about-validity-checks) ||||
| [Secret scanning alert assignment](https://docs.github.com/en/enterprise-server@latest/code-security/secret-scanning/managing-alerts-from-secret-scanning/viewing-alerts#assigning-alerts) ||||
| [Enterprise-level push protection delegated bypass](https://docs.github.com/en/enterprise-server@latest/code-security/secret-scanning/using-advanced-secret-scanning-and-push-protection-features/delegated-bypass-for-push-protection) ||||
| [Push protection exemptions for apps, teams, and roles](https://github.blog/changelog/2026-03-17-push-protection-exemptions-for-apps-teams-and-roles/) ||||

## Code Security

### Code Scanning
Code scanning is a feature that you use to analyze the code in a GitHub repository to find security vulnerabilities and coding errors. Any problems identified by the analysis are shown in GitHub.
* [Code scanning documentation](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning)
* [Code scanning API documentation](https://docs.github.com/en/rest/code-scanning?apiVersion=2022-11-28)

|Feature  |3.14|3.15|3.16|
|------------------------------------------------------------|----|----|----|
|[CodeQL "toolcache" Version](https://docs.github.com/en/enterprise-server/admin/code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance#provisioning-the-actions-for-code-scanning)|[2.17.6](https://codeql.github.com/docs/codeql-overview/codeql-changelog/codeql-cli-2.17.6/)|[2.18.4](https://docs.github.com/en/enterprise-server@3.15/admin/release-notes#code-scanning)|[2.20.3](https://docs.github.com/en/enterprise-server@3.16/admin/managing-code-security/managing-github-advanced-security-for-your-enterprise/configuring-code-scanning-for-your-appliance)|
|[Kotlin language support](https://github.blog/changelog/2022-11-28-codeql-code-scanning-launches-kotlin-analysis-support-beta/)|☑️|✅|✅|
|[CodeQL supports Swift programming language](https://github.blog/changelog/2023-06-01-codeql-code-scanning-now-supports-swift-beta/)|☑️|✅|✅|
|[CodeQL threat models for detecting relevant alerts](https://docs.github.com/en/enterprise-server@3.13/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/customizing-your-advanced-setup-for-code-scanning#extending-codeql-coverage-with-threat-models)|☑️|☑️|☑️|
|[Code Scanning merge protection rulesets](https://docs.github.com/en/enterprise-server@3.14/code-security/code-scanning/managing-your-code-scanning-configuration/set-code-scanning-merge-protection)|☑️|☑️|☑️|
|[CodeQL threat models for default setup](https://docs.github.com/en/enterprise-server@3.14/code-security/code-scanning/managing-your-code-scanning-configuration/editing-your-configuration-of-default-setup#including-local-sources-of-tainted-data-in-default-setup)|☑️|☑️|☑️|
|[CodeQL model packs for organization/repo](https://docs.github.com/en/enterprise-server@3.14/code-security/code-scanning/managing-your-code-scanning-configuration/editing-your-configuration-of-default-setup#extending-codeql-coverage-with-codeql-model-packs-in-default-setup)|☑️|☑️|☑️|
|[CodeQL can scan Java projects without a build](https://docs.github.com/en/enterprise-server@3.15/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages#codeql-build-modes)|☑️|☑️|☑️|
|[CodeQL can scan C# projects without a build](https://docs.github.com/en/enterprise-server@3.15/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages#codeql-build-modes)  |☑️|☑️|✅|
|[CodeQL dependency caching for advanced setup](https://docs.github.com/en/enterprise-server@3.16/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages#about-dependency-caching-for-codeql) | |✅|✅|
|[Zstandard archive for CodeQL tools](https://docs.github.com/en/enterprise-server@3.16/code-security/codeql-cli/getting-started-with-the-codeql-cli/setting-up-the-codeql-cli#1-download-the-codeql-cli-tar-archive) | |✅|✅|
| [Delegated alert dismissal for code scanning](https://github.blog/changelog/2025-03-05-delegated-alert-dismissal-for-code-scanning-and-secret-scanning-now-available-in-public-preview/) ||||
| [Code scanning alert-related events in audit log](https://github.blog/changelog/2024-12-03-code-scanning-now-creates-alert-related-events-in-audit-log/) ||||
| [Development section to track code scanning alert resolution progress](https://docs.github.com/en/enterprise-server@3.18/code-security/code-scanning/managing-code-scanning-alerts/managing-code-scanning-alerts-for-your-repository) ||||
| [CodeQL code scanning to detect security vulnerabilities in GitHub Actions workflows](https://docs.github.com/en/enterprise-server@3.18/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages) ||||
| [CodeQL Rust language support](https://github.blog/changelog/2025-07-03-codeql-2-22-1-bring-rust-support-to-public-preview/) ||||
| [CodeQL can scan C/C++ projects without a build](https://docs.github.com/en/enterprise-server@latest/code-security/code-scanning/creating-an-advanced-setup-for-code-scanning/codeql-code-scanning-for-compiled-languages#codeql-build-modes) ||||
| [Code scanning alert assignment](https://docs.github.com/en/enterprise-server@latest/code-security/code-scanning/managing-code-scanning-alerts/managing-code-scanning-alerts-for-your-repository#assigning-an-alert-to-a-team-member) ||||

### Dependabot Alerts
Dependabot alerts tell you that your code depends on a package that is insecure.
* [Dependabot alerts documentation](https://docs.github.com/en/code-security/dependabot/dependabot-alerts/about-dependabot-alerts)
* [Dependabot alerts API](https://docs.github.com/en/enterprise-server/rest/dependabot/alerts?apiVersion=2022-11-28)

|Feature  |3.14|3.15|3.16|
|------------------------------------------------------------|----|----|----|
|[Dependabot alerts show vulnerable function calls](https://web.archive.org/web/20230922181508/https://github.blog/2022-04-14-dependabot-alerts-now-surface-if-code-is-calling-vulnerability/)|☑️|☑️|☑️|
|[Dependabot auto-triage rules](https://docs.github.com/en/enterprise-server@3.12/code-security/dependabot/dependabot-auto-triage-rules/about-dependabot-auto-triage-rules)|✅|✅|✅|
|[Security advisories can use the new CVSS 4.0 schema to calculate a base vulnerability score](https://docs.github.com/en/enterprise-server@3.16/code-security/security-advisories/working-with-global-security-advisories-from-the-github-advisory-database/about-the-github-advisory-database#about-cvss-levels)| |✅|✅|
|[Added Exploit Prediction Scoring System (EPSS) to advisories to show estimated probability that a vulnerability will be exploited over the next 30 days](https://docs.github.com/en/enterprise-server@3.16/code-security/security-advisories/working-with-global-security-advisories-from-the-github-advisory-database/about-the-github-advisory-database#about-epss-scores)| |✅|✅|
| [EPSS scores for vulnerability prioritization in Dependabot alerts](https://github.blog/changelog/2025-02-19-dependabot-helps-users-focus-on-the-most-important-alerts-by-including-epss-scores-that-indicate-likelihood-of-exploitation-now-generally-available/) ||||
| [Dependabot metrics page for prioritizing security fixes](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/working-with-dependabot/viewing-and-updating-dependabot-alerts) ||||
| [Dependabot alert assignment](https://docs.github.com/en/enterprise-server@3.21/code-security/dependabot/dependabot-alerts/viewing-and-updating-dependabot-alerts) ||||
| [Delegated alert dismissal for Dependabot](https://github.blog/changelog/2025-12-19-you-can-now-require-reviews-before-closing-dependabot-alerts-with-delegated-alert-dismissal/) ||||


### Dependabot Updates
|Feature  |3.14|3.15|3.16|
|------------------------------------------------------------|----|----|----|
|[Dependabot supports `devcontainer.json` files](https://docs.github.com/en/enterprise-server@3.13/code-security/dependabot/dependabot-version-updates/about-dependabot-version-updates#dev-containers)|✅|✅|✅|
|[Dependabot access to Cargo private registries](https://docs.github.com/en/enterprise-server@3.14/code-security/dependabot/working-with-dependabot/guidance-for-the-configuration-of-private-registries-for-dependabot#about-configuring-private-registries-for-dependabot)|✅|✅|✅|
|Dependabot pauses scheduled jobs after 15 failures.|✅|✅|✅|
|[Dependabot grouped security updates](https://docs.github.com/en/enterprise-server@3.14/code-security/dependabot/dependabot-security-updates/about-dependabot-security-updates#about-grouped-security-updates)|✅|✅|✅|
|[Private registry support for target-branch configuration](https://docs.github.com/en/enterprise-server@3.14/code-security/dependabot/working-with-dependabot/configuring-access-to-private-registries-for-dependabot)|✅|✅|✅|
|[Updates support pnpm workspace catalogs](https://github.blog/changelog/2025-02-04-dependabot-now-supports-pnpm-workspace-catalogs-ga/)| |✅|✅|
|[Version updates support .NET SDK in global.json](https://docs.github.com/en/enterprise-server@3.16/admin/release-notes#dependabot)| |✅|✅|
| [Dependabot version updates support for bun dependencies](https://docs.github.com/en/code-security/dependabot/ecosystems-supported-by-dependabot/supported-ecosystems-and-repositories#supported-ecosystems-and-repositories) ||||
| [Dependabot version updates support for Docker Compose dependencies](https://docs.github.com/en/code-security/dependabot/ecosystems-supported-by-dependabot/supported-ecosystems-and-repositories#supported-ecosystems-and-repositories) ||||
| [Dependabot version updates support for uv dependencies](https://docs.github.com/en/code-security/dependabot/ecosystems-supported-by-dependabot/supported-ecosystems-and-repositories#supported-ecosystems-and-repositories) ||||
| [Organization administrators can grant Dependabot access to repositories at scale](https://docs.github.com/en/enterprise-server@3.18/code-security/dependabot/working-with-dependabot/managing-dependabot-on-self-hosted-runners) ||||
| [Dependabot version updates support for Helm dependencies](https://docs.github.com/en/enterprise-server@3.18/code-security/dependabot/dependabot-version-updates/about-dependabot-version-updates) ||||
| [Custom update frequencies for Dependabot using cron expressions](https://docs.github.com/en/enterprise-server@3.18/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file#scheduleinterval) ||||
| [Dependabot supports Gradle lockfiles](https://github.blog/changelog/2025-06-24-dependabot-support-for-gradle-lockfiles-is-now-generally-available/) ||||
| [Minimum package age configuration](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file) ||||
| [Cross-ecosystem grouped pull requests](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file) ||||
| [Central management of private registry configurations](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/working-with-dependabot/configuring-access-to-private-registries-for-dependabot) ||||
| Version updates support [vcpkg dependencies](https://github.blog/changelog/2025-08-12-dependabot-version-updates-now-support-vcpkg/) and [Rust toolchain](https://github.blog/changelog/2025-08-19-dependabot-now-supports-rust-toolchain-updates/) ||||
| [Dependabot can update private Go modules](https://docs.github.com/en/enterprise-server@3.19/code-security/dependabot/working-with-dependabot/guidance-for-the-configuration-of-private-registries-for-dependabot) ||||
| [Dependabot version updates support for Conda dependencies](https://docs.github.com/en/enterprise-server@latest/code-security/dependabot/ecosystems-supported-by-dependabot/supported-ecosystems-and-repositories) ||||
| [Dependabot OIDC authentication for private registries](https://github.blog/changelog/2026-02-03-dependabot-now-supports-oidc-authentication/) ||||
| [Dependabot security updates support for uv (Python)](https://docs.github.com/en/enterprise-server@3.21/code-security/dependabot/dependabot-security-updates/about-dependabot-security-updates) ||||
| [Dependabot version updates support for OpenTofu](https://github.blog/changelog/2025-12-16-dependabot-version-updates-now-support-opentofu/) ||||
| [Dependabot version updates support for Bazel](https://github.blog/changelog/2025-12-16-dependabot-version-updates-now-support-bazel/) ||||
| [Dependabot version updates support for Julia](https://github.blog/changelog/2025-12-16-dependabot-version-updates-now-support-julia/) ||||
| [Dependabot version updates support for pre-commit hooks](https://docs.github.com/en/enterprise-server@3.21/code-security/dependabot/dependabot-version-updates/about-dependabot-version-updates) ||||

### Dependency Graph, Dependency Review and snapshot submission API
Dependency review helps you understand dependency changes and the security impact of these changes at every pull request.
* [Dependency review docs](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/configuring-dependency-review)
* [Dependency review API docs](https://docs.github.com/en/rest/dependency-graph/dependency-review?apiVersion=2022-11-28)

|Feature  |3.14|3.15|3.16|
|------------------------------------------------------------|----|----|----|
|SBOM generated for a package now includes the package URL for more packages|✅|✅|✅|

## Security Overview
Security overview provides high-level summaries of the security status of an organization or enterprise and makes it easy to identify repositories that require intervention.
* [Security Overview documentation](https://docs.github.com/en/enterprise-server/code-security/security-overview/about-security-overview)

|Feature  |3.14|3.15|3.16|
|------------------------------------------------------------|----|----|----|
|[Enablement trends dashboard is available](https://docs.github.com/en/enterprise-server@3.13/code-security/security-overview/assessing-adoption-code-security#viewing-enablement-trends-for-an-organization-beta)|✅|✅|✅|
|[Enterprise level secret scanning metrics and enablement trend dashboards](https://docs.github.com/en/enterprise-server@3.14/code-security/security-overview/viewing-security-insights)|✅|✅|✅|
|[Security overview dashboard group by tool](https://docs.github.com/en/enterprise-server@3.14/code-security/security-overview/viewing-security-insights#viewing-the-security-overview-dashboard-for-your-organization)|✅|✅|✅|
|Security overview dashboard filter by security tool|☑️|✅|✅|
|[CodeQL pull request alerts view](https://docs.github.com/en/enterprise-server@3.15/code-security/security-overview/viewing-metrics-for-pull-request-alerts)| |✅|✅|
|[Security overview dashboard adds SAST vulnerabilities summary table](https://docs.github.com/en/enterprise-server@3.16/code-security/security-overview/viewing-security-insights)| | |✅|
|[Security overview dashboard adds Prevention metrics alongside Detection and Remediation metrics at both the organization and enterprise levels](https://github.blog/changelog/2024-09-19-enhanced-security-overview-dashboard-detection-remediation-and-prevention-at-the-forefront/)| | |✅|
|[Export CSV data from the "CodeQL pull request alerts" view](https://docs.github.com/en/enterprise-server@3.16/code-security/security-overview/viewing-metrics-for-pull-request-alerts)| | |✅|
|[Security overview dashboard accessibility enhancements](https://github.blog/changelog/2024-11-20-accessibility-improvements-for-security-overview/)| | |✅|


## Administration
Security Configurations and Global Settings for Advanced Security configuration and policy enforcement at scale!
|Feature  |3.14|3.15|3.16|
|------------------------------------------------------------|----|----|----|
|[Enable at scale - security configurations](https://docs.github.com/en/enterprise-server@3.15/code-security/securing-your-organization/introduction-to-securing-your-organization-at-scale/about-enabling-security-features-at-scale)| |✅|✅|
|[Enterprise-level security configurations](https://docs.github.com/en/enterprise-server@3.16/code-security/securing-your-organization/introduction-to-securing-your-organization-at-scale/about-enabling-security-features-at-scale#about-enterprise-level-security-configurations)| | |✅|
|[Security configurations for archived repositories](https://docs.github.com/en/enterprise-server@3.16/code-security/securing-your-organization/introduction-to-securing-your-organization-at-scale/about-enabling-security-features-at-scale)| | |✅|
|[Advanced filtering for repository selection by security feature status](https://docs.github.com/en/enterprise-server@3.16/code-security/securing-your-organization/introduction-to-securing-your-organization-at-scale/creating-security-configurations-for-your-organization)| | |✅|
|[Security manager role can be assigned directly to individual users](https://docs.github.com/en/enterprise-server@3.16/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)| | |✅|
|[Standalone SKUs for Code Security and Secret Protection](https://github.blog/changelog/2025-04-01-github-secret-protection-and-github-code-security-for-github-enterprise/#when-will-the-standalone-plans-be-available-for-enterprise-server)| | | |
| ["Not set" option for security configurations](https://docs.github.com/en/enterprise-server@3.19/code-security/securing-your-organization/enabling-security-features-in-your-organization/creating-a-custom-security-configuration) | | | |
| [Security configurations support default or advanced CodeQL setup](https://github.blog/changelog/2025-07-15-security-configurations-support-for-running-codeql-in-either-default-or-advanced-setup/) | | | |
| [Enterprise Security Manager role](https://docs.github.com/en/enterprise-server@latest/admin/managing-accounts-and-repositories/managing-users-in-your-enterprise/roles-in-an-enterprise#security-managers) | | | |
| [Code scanning default setup can override Actions policies](https://docs.github.com/en/enterprise-server@latest/admin/enforcing-policies/enforcing-policies-for-your-enterprise/enforcing-policies-for-github-actions-in-your-enterprise) | | | |
| [Audit log events for Dependabot configuration changes](https://github.blog/changelog/2026-02-10-track-additional-dependabot-configuration-changes-in-audit-logs/) ||||
