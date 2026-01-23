# CodeQL CWE Coverage in the MITRE Top 10 KEV

## Overview

This document provides a mapping between the MITRE Top 10 Known Exploited Vulnerabilities (KEV) weaknesses and available CodeQL queries through their Common Weakness Enumeration (CWE) identifiers.

The query mappings below are derived from [codeql_cwe_coverage.md](codeql_cwe_coverage.md).

## MITRE Top 10 KEV Weaknesses

| CWE-ID | Name | 2024 CWE Top 25 Rank | Top 10 KEV Weaknesses Rank |
| --- | --- | --- | --- |
| CWE-787 | Out-of-bounds Write | 2nd | 1st |
| CWE-843 | Access of Resource Using Incompatible Type ('Type Confusion') | - (39th) | 2nd |
| CWE-78 | Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection’) | 7th | 3rd |
| CWE-94 | Improper Control of Generation of Code ('Code Injection') | 11th | 4th |
| CWE-502 | Deserialization of Untrusted Data | 16th | 5th |
| CWE-22 | Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal') | 5th | 6th |
| CWE-306 | Missing Authentication for Critical Function | 25th | 7th |
| CWE-89 | Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection') | 3rd | 8th |
| CWE-416 | Use After Free | 8th | 9th |
| CWE-77 | Improper Neutralization of Special Elements used in a Command ('Command Injection') | 13th | 10th |

## Comprehensive CodeQL Query Mapping by CWE

### CWE-787: Out-of-bounds Write

| Language | Query |
| --- | --- |
| C/C++ | `cpp/allocation-too-small` |
| C/C++ | `cpp/suspicious-allocation-size` |
| C/C++ | `cpp/overflow-buffer` |
| C/C++ | `cpp/badly-bounded-write` |
| C/C++ | `cpp/overrunning-write` |
| C/C++ | `cpp/overrunning-write-with-float` |
| C/C++ | `cpp/unbounded-write` |
| C/C++ | `cpp/very-likely-overrunning-write` |
| C/C++ | `cpp/unterminated-variadic-call` |
| C/C++ | `cpp/no-space-for-terminator` |
| C/C++ | `cpp/invalid-pointer-deref` |
| C/C++ | `cpp/sign-conversion-pointer-arithmetic` |
| C# | `cs/unvalidated-local-pointer-arithmetic` |

### CWE-843: Access of Resource Using Incompatible Type ('Type Confusion')

| Language | Query |
| --- | --- |
| C/C++ | `cpp/upcast-array-pointer-arithmetic` |
| C/C++ | `cpp/type-confusion` |
| JavaScript/TypeScript | `js/type-confusion-through-parameter-tampering` |

### CWE-78: Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection’)

| Language | Query |
| --- | --- |
| GitHub Actions | `actions/command-injection/critical` |
| GitHub Actions | `actions/command-injection/medium` |
| C/C++ | `cpp/command-line-injection` |
| C/C++ | `cpp/wordexp-injection` |
| C# | `cs/command-line-injection` |
| Go | `go/command-injection` |
| Go | `go/stored-command` |
| Go | `go/unsafe-quoting` |
| Java/Kotlin | `java/relative-path-command` |
| Java/Kotlin | `java/command-line-injection` |
| Java/Kotlin | `java/exec-tainted-environment` |
| Java/Kotlin | `java/concatenated-command-line` |
| Java/Kotlin | `java/command-line-injection-extra` |
| Java/Kotlin | `java/command-line-injection-extra-local` |
| Java/Kotlin | `java/command-line-injection-experimental` |
| JavaScript/TypeScript | `js/command-line-injection` |
| JavaScript/TypeScript | `js/indirect-command-line-injection` |
| JavaScript/TypeScript | `js/second-order-command-line-injection` |
| JavaScript/TypeScript | `js/shell-command-injection-from-environment` |
| JavaScript/TypeScript | `js/shell-command-constructed-from-input` |
| JavaScript/TypeScript | `js/unnecessary-use-of-cat` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment` |
| JavaScript/TypeScript | `js/prototype-pollution-utility` |
| JavaScript/TypeScript | `js/prototype-pollution` |
| JavaScript/TypeScript | `js/command-line-injection-more-sources` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment-more-sources` |
| Python | `py/command-line-injection` |
| Python | `py/shell-command-constructed-from-input` |
| Ruby | `rb/command-line-injection` |
| Ruby | `rb/kernel-open` |
| Ruby | `rb/non-constant-kernel-open` |
| Ruby | `rb/shell-command-constructed-from-input` |
| Swift | `swift/command-line-injection` |

### CWE-94: Improper Control of Generation of Code ('Code Injection')

| Language | Query |
| --- | --- |
| GitHub Actions | `actions/code-injection/critical` |
| GitHub Actions | `actions/code-injection/medium` |
| GitHub Actions | `actions/cache-poisoning/code-injection` |
| C# | `cs/code-injection` |
| Go | `go/unsafe-quoting` |
| Java/Kotlin | `java/android/arbitrary-apk-installation` |
| Java/Kotlin | `java/groovy-injection` |
| Java/Kotlin | `java/insecure-bean-validation` |
| Java/Kotlin | `java/jexl-expression-injection` |
| Java/Kotlin | `java/mvel-expression-injection` |
| Java/Kotlin | `java/spel-expression-injection` |
| Java/Kotlin | `java/server-side-template-injection` |
| Java/Kotlin | `java/beanshell-injection` |
| Java/Kotlin | `java/android-insecure-dex-loading` |
| Java/Kotlin | `java/jshell-injection` |
| Java/Kotlin | `java/javaee-expression-injection` |
| Java/Kotlin | `java/jython-injection` |
| Java/Kotlin | `java/unsafe-eval` |
| Java/Kotlin | `java/spring-view-manipulation-implicit` |
| Java/Kotlin | `java/spring-view-manipulation` |
| JavaScript/TypeScript | `js/enabling-electron-renderer-node-integration` |
| JavaScript/TypeScript | `js/template-object-injection` |
| JavaScript/TypeScript | `js/code-injection` |
| JavaScript/TypeScript | `js/bad-code-sanitization` |
| JavaScript/TypeScript | `js/unsafe-code-construction` |
| JavaScript/TypeScript | `js/unsafe-dynamic-method-access` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment` |
| JavaScript/TypeScript | `js/prototype-pollution-utility` |
| JavaScript/TypeScript | `js/prototype-pollution` |
| JavaScript/TypeScript | `js/code-injection-dynamic-import` |
| JavaScript/TypeScript | `js/code-injection-more-sources` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment-more-sources` |
| Python | `py/use-of-input` |
| Python | `py/code-injection` |
| Python | `py/js2py-rce` |
| Ruby | `rb/server-side-template-injection` |
| Ruby | `rb/code-injection` |
| Ruby | `rb/unsafe-code-construction` |
| Swift | `swift/unsafe-webview-fetch` |
| Swift | `swift/unsafe-js-eval` |

### CWE-502: Deserialization of Untrusted Data

| Language | Query |
| --- | --- |
| C# | `cs/deserialized-delegate` |
| C# | `cs/unsafe-deserialization` |
| C# | `cs/unsafe-deserialization-untrusted-input` |
| Java/Kotlin | `java/unsafe-deserialization` |
| Java/Kotlin | `java/log4j-injection` |
| Java/Kotlin | `java/unsafe-deserialization-rmi` |
| Java/Kotlin | `java/unsafe-deserialization-spring-exporter-in-configuration-class` |
| Java/Kotlin | `java/unsafe-deserialization-spring-exporter-in-xml-configuration` |
| JavaScript/TypeScript | `js/unsafe-deserialization` |
| JavaScript/TypeScript | `js/unsafe-deserialization-more-sources` |
| Python | `py/unsafe-deserialization` |
| Ruby | `rb/unsafe-unsafeyamldeserialization` |
| Ruby | `rb/unsafe-deserialization` |

### CWE-22: Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')

| Language | Query |
| --- | --- |
| C/C++ | `cpp/path-injection` |
| C# | `cs/path-injection` |
| C# | `cs/zipslip` |
| C# | `cs/webclient-path-injection` |
| Go | `go/path-injection` |
| Go | `go/unsafe-unzip-symlink` |
| Go | `go/zipslip` |
| Java/Kotlin | `java/path-injection` |
| Java/Kotlin | `java/zipslip` |
| Java/Kotlin | `java/partial-path-traversal` |
| Java/Kotlin | `java/partial-path-traversal-from-remote` |
| Java/Kotlin | `java/openstream-called-on-tainted-url` |
| JavaScript/TypeScript | `js/path-injection` |
| JavaScript/TypeScript | `js/zipslip` |
| Python | `py/path-injection` |
| Python | `py/tarslip` |
| Python | `py/zipslip` |
| Python | `py/tarslip-extended` |
| Python | `py/unsafe-unpacking` |
| Ruby | `rb/zip-slip` |
| Ruby | `rb/path-injection` |
| Rust | `rust/path-injection` |
| Swift | `swift/unsafe-unpacking` |
| Swift | `swift/path-injection` |

### CWE-306: Missing Authentication for Critical Function

No matching CodeQL query IDs were found for CWE-306 in [codeql_cwe_coverage.md](codeql_cwe_coverage.md).

### CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')

| Language | Query |
| --- | --- |
| C/C++ | `cpp/sql-injection` |
| C# | `cs/sql-injection` |
| Go | `go/sql-injection` |
| Go | `go/unsafe-quoting` |
| Java/Kotlin | `java/concatenated-sql-query` |
| Java/Kotlin | `java/sql-injection` |
| Java/Kotlin | `java/mybatis-annotation-sql-injection` |
| Java/Kotlin | `java/mybatis-xml-sql-injection` |
| JavaScript/TypeScript | `js/sql-injection` |
| JavaScript/TypeScript | `js/env-key-and-value-injection` |
| JavaScript/TypeScript | `js/env-value-injection` |
| JavaScript/TypeScript | `js/sql-injection-more-sources` |
| Python | `py/sql-injection` |
| Ruby | `rb/sql-injection` |
| Rust | `rust/sql-injection` |
| Swift | `swift/sql-injection` |

### CWE-416: Use After Free

| Language | Query |
| --- | --- |
| C/C++ | `cpp/use-after-free` |
| C/C++ | `cpp/iterator-to-expired-container` |
| C/C++ | `cpp/use-of-string-after-lifetime-ends` |
| C/C++ | `cpp/use-of-unique-pointer-after-lifetime-ends` |
| C/C++ | `cpp/use-after-expired-lifetime` |

### CWE-77: Improper Neutralization of Special Elements used in a Command ('Command Injection')

| Language | Query |
| --- | --- |
| GitHub Actions | `actions/envpath-injection/critical` |
| GitHub Actions | `actions/envpath-injection/medium` |
| GitHub Actions | `actions/envvar-injection/critical` |
| GitHub Actions | `actions/envvar-injection/medium` |
| GitHub Actions | `actions/command-injection/critical` |
| GitHub Actions | `actions/command-injection/medium` |
| GitHub Actions | `actions/argument-injection/critical` |
| GitHub Actions | `actions/argument-injection/medium` |
| C/C++ | `cpp/command-line-injection` |
| C/C++ | `cpp/wordexp-injection` |
| C# | `cs/command-line-injection` |
| Go | `go/command-injection` |
| Go | `go/stored-command` |
| Go | `go/unsafe-quoting` |
| Java/Kotlin | `java/relative-path-command` |
| Java/Kotlin | `java/command-line-injection` |
| Java/Kotlin | `java/exec-tainted-environment` |
| Java/Kotlin | `java/concatenated-command-line` |
| Java/Kotlin | `java/ognl-injection` |
| Java/Kotlin | `java/command-line-injection-extra` |
| Java/Kotlin | `java/command-line-injection-extra-local` |
| Java/Kotlin | `java/command-line-injection-experimental` |
| JavaScript/TypeScript | `js/command-line-injection` |
| JavaScript/TypeScript | `js/indirect-command-line-injection` |
| JavaScript/TypeScript | `js/second-order-command-line-injection` |
| JavaScript/TypeScript | `js/shell-command-injection-from-environment` |
| JavaScript/TypeScript | `js/shell-command-constructed-from-input` |
| JavaScript/TypeScript | `js/unnecessary-use-of-cat` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment` |
| JavaScript/TypeScript | `js/prototype-pollution-utility` |
| JavaScript/TypeScript | `js/prototype-pollution` |
| JavaScript/TypeScript | `js/command-line-injection-more-sources` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment-more-sources` |
| Python | `py/command-line-injection` |
| Python | `py/shell-command-constructed-from-input` |
| Ruby | `rb/command-line-injection` |
| Ruby | `rb/kernel-open` |
| Ruby | `rb/non-constant-kernel-open` |
| Ruby | `rb/shell-command-constructed-from-input` |
| Swift | `swift/command-line-injection` |
