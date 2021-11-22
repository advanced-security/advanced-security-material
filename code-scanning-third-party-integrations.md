# Code Scanning 3rd Party Integrations List

## Public Projects

| Name                                                                                               | Technologies        | Tools                           |
| :------------------------------------------------------------------------------------------------- | :------------------ | :------------------------------ |
| [Android (AndroGoat)](https://github.com/octodemo/advance-security-mobile-android/)                | `Kotlin`            | `MobSF`                         |
| [iOS (OWASP/iGoat-Swift)](https://github.com/octodemo/advance-security-mobile-ios)                 | `Swift`             | `MobSF`                         |
| [JavaScript (bkimminich/juice-shop)](https://github.com/bkimminich/juice-shop)                     | `JavaScript`        | `CodeQL`                        |
| [PHP (OWASP/OWASPWebGoatPHP)](https://github.com/octodemo/advance-security-php)                    | `PHP`, `JavaScript` | `CodeQL`, `SL Scan (ShiftLeft)` |
| [IaC / Terraform (bridgecrewio/terragoat)](https://github.com/octodemo/advance-security-terraform) | `Terraform`         | `Bridgecrew (Checkov)`, `TFSec` |

## Code Scanning - Languages

### Apache Velocity

- [PDM](https://github.com/pmd/pmd)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### Apex

- [CodeScan](https://github.com/codescan-io/codescan-scanner-action)
- [PDM](https://github.com/pmd/pmd)
  - [Apex Example](https://github.com/Moose0621/apex-recipes/blob/main/.github/workflows/pmd-apex.yml)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### Bash

- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### Go

- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### JSP

- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### Java

- [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF)
- [PDM](https://github.com/pmd/pmd)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### JavaScript

- [CodeScan](https://github.com/codescan-io/codescan-scanner-action)
- [ESLint (OSSAR)](https://github.com/github/ossar-action)
- [PDM](https://github.com/pmd/pmd)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### Kotlin

- [Detekt](https://github.com/detekt/detekt) (Code Quality)
  - [Kotlin Example](https://github.com/octodemo/KotlinGoat/blob/master/.github/workflows/detekt-analysis.yml)
- [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)
  - [Kotlin Example](https://github.com/octodemo/KotlinGoat/blob/master/.github/workflows/shiftleft-analysis.yml)  

### Lightning (Aura and LWC)

- [CodeScan](https://github.com/codescan-io/codescan-scanner-action)

### Modelica

- [PDM](https://github.com/pmd/pmd)

### ObjectiveC

- [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF)

### PHP

- [psalm](https://github.com/psalm/psalm-github-security-scan)
  - [PHP Example](https://github.com/psalm/psalm-github-security-scan#psalm-github-security-scan)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)
  - [PHP Example](https://github.com/octodemo/advance-security-php)

### PL/SQL

- [PDM](https://github.com/pmd/pmd)
  - [PL/SQL Example](https://github.com/Moose0621/sql-project/blob/master/.github/workflows/pmd-plsql.yml)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### Python

- [Bandit (OSSAR)](https://github.com/github/ossar-action)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### Ruby

- [Rubocop](https://github.com/arthurnn/code-scanning-rubocop)
  - [Ruby Example](https://github.com/arthurnn/code-scanning-rubocop#action-installation)

### Salesforce Metadata

- [CodeScan](https://github.com/codescan-io/codescan-scanner-action)

### Scala

- [PDM](https://github.com/pmd/pmd)

### Swift

- [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF)

### T-SQL

- [TSQLLint](https://github.com/tsqllint/tsqllint) via [Codacy](https://github.com/codacy/codacy-analysis-cli-action) action

### Visualforce

- [CodeScan](https://github.com/codescan-io/codescan-scanner-action)
- [PDM](https://github.com/pmd/pmd)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### XSL

- [PDM](https://github.com/pmd/pmd)


## Code Scanning - Technologies
<!-- TODO: Do we hide competitors tools? And if so, under what requirements/conditions? -->

### Ansible

- [KICS](https://github.com/Checkmarx/kics)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### Binaries Analysis

- [BinSkim (OSSAR)](https://github.com/github/ossar-action)

### CloudFormation

- [KICS](https://github.com/Checkmarx/kics)
- [Action for CloudFormation Linter](https://github.com/ScottBrenner/cfn-lint-action)

### Docker

- [Anchore](https://github.com/anchore/scan-action)
- [KICS](https://github.com/Checkmarx/kics)
- [Trivy](https://github.com/aquasecurity/trivy-action)

### Kubernetes

- [Accurics](https://github.com/accurics/accurics-action)
  - Commercial Requirement for Private Repositories
- [KICS](https://github.com/Checkmarx/kics)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)

### Mobile

- [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF)
  - [Mobile-iOS Example](https://github.com/Moose0621/iGoat-Swift)
  - [Mobile-Android Example](https://github.com/octodemo/advance-security-mobile-android)

### Terraform

- [Accurics](https://github.com/accurics/accurics-action)
  - Commercial Requirement for Private Repositories
- [Bridgecrew (Checkov)](https://github.com/bridgecrewio/checkov)
  - Commercial Requirement for Private Repositories
  - [Terraform Example](https://github.com/octodemo/advance-security-terraform/blob/master/.github/workflows/bridgecrew-action.yml)
- [CodeScan](https://github.com/codescan-io/codescan-scanner-action)
- [KICS](https://github.com/Checkmarx/kics)
- [Kubesec](https://github.com/controlplaneio/kubesec-action)
  - [Terraform Example](https://github.com/controlplaneio/kubesec-action#using-kubesec-with-github-code-scanning)
- [ShiftLeft](https://github.com/ShiftLeftSecurity/scan-action)
- [TFSec](https://github.com/tfsec/tfsec)
  - [Terraform Example](https://github.com/octodemo/advance-security-terraform/blob/master/.github/workflows/tfsec-action.yml)

### Windows Containers

- [Anchore](https://github.com/anchore/scan-action)
