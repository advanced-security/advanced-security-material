# SANS Top 25 Software Errors to CodeQL Queries Mapping

## Overview

This document provides a mapping between the [SANS Top 25 Software Errors](https://www.sans.org/top25-software-errors) and available CodeQL queries.

## SANS Top 25 CWE List

- **CWE-787**: Out-of-bounds Write
- **CWE-79**: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
- **CWE-89**: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
- **CWE-416**: Use After Free
- **CWE-78**: Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')
- **CWE-20**: Improper Input Validation
- **CWE-125**: Out-of-bounds Read
- **CWE-22**: Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')
- **CWE-352**: Cross-Site Request Forgery (CSRF)
- **CWE-434**: Unrestricted Upload of File with Dangerous Type
- **CWE-862**: Missing Authorization
- **CWE-476**: NULL Pointer Dereference
- **CWE-287**: Improper Authentication
- **CWE-190**: Integer Overflow or Wraparound
- **CWE-502**: Deserialization of Untrusted Data
- **CWE-77**: Improper Neutralization of Special Elements used in a Command ('Command Injection')
- **CWE-119**: Improper Restriction of Operations within the Bounds of a Memory Buffer
- **CWE-798**: Use of Hard-coded Credentials
- **CWE-918**: Server-Side Request Forgery (SSRF)
- **CWE-306**: Missing Authentication for Critical Function
- **CWE-362**: Concurrent Execution using Shared Resource with Improper Synchronization ('Race Condition')
- **CWE-269**: Improper Privilege Management
- **CWE-94**: Improper Control of Generation of Code ('Code Injection')
- **CWE-863**: Incorrect Authorization
- **CWE-276**: Incorrect Default Permissions

---

## Comprehensive CodeQL Query Mapping by CWE

### CWE-787: Out-of-bounds Write

| Language | Query |
| ---------- | ------- |
| C# | `cs/unvalidated-local-pointer-arithmetic` |
| C/C++ | `cpp/allocation-too-small` |
| C/C++ | `cpp/badly-bounded-write` |
| C/C++ | `cpp/invalid-pointer-deref` |
| C/C++ | `cpp/no-space-for-terminator` |
| C/C++ | `cpp/overflow-buffer` |
| C/C++ | `cpp/overrunning-write` |
| C/C++ | `cpp/overrunning-write-with-float` |
| C/C++ | `cpp/sign-conversion-pointer-arithmetic` |
| C/C++ | `cpp/suspicious-allocation-size` |
| C/C++ | `cpp/unbounded-write` |
| C/C++ | `cpp/unterminated-variadic-call` |
| C/C++ | `cpp/very-likely-overrunning-write` |

### CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')

| Language | Query |
| ---------- | ------- |
| C# | `cs/web/xss` |
| C/C++ | `cpp/cgi-xss` |
| Go | `go/html-template-escaping-bypass-xss` |
| Go | `go/reflected-xss` |
| Go | `go/stored-xss` |
| Java/Kotlin | `java/android/unsafe-android-webview-fetch` |
| Java/Kotlin | `java/android/websettings-javascript-enabled` |
| Java/Kotlin | `java/android/webview-addjavascriptinterface` |
| Java/Kotlin | `java/xss` |
| JavaScript/TypeScript | `js/bad-code-sanitization` |
| JavaScript/TypeScript | `js/bad-tag-filter` |
| JavaScript/TypeScript | `js/client-side-unvalidated-url-redirection` |
| JavaScript/TypeScript | `js/code-injection` |
| JavaScript/TypeScript | `js/code-injection-dynamic-import` |
| JavaScript/TypeScript | `js/code-injection-more-sources` |
| JavaScript/TypeScript | `js/disabling-electron-websecurity` |
| JavaScript/TypeScript | `js/html-constructed-from-input` |
| JavaScript/TypeScript | `js/incomplete-html-attribute-sanitization` |
| JavaScript/TypeScript | `js/incomplete-multi-character-sanitization` |
| JavaScript/TypeScript | `js/incomplete-sanitization` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment-more-sources` |
| JavaScript/TypeScript | `js/prototype-pollution` |
| JavaScript/TypeScript | `js/prototype-pollution-utility` |
| JavaScript/TypeScript | `js/reflected-xss` |
| JavaScript/TypeScript | `js/stored-xss` |
| JavaScript/TypeScript | `js/unsafe-code-construction` |
| JavaScript/TypeScript | `js/unsafe-html-expansion` |
| JavaScript/TypeScript | `js/unsafe-jquery-plugin` |
| JavaScript/TypeScript | `js/xss` |
| JavaScript/TypeScript | `js/xss-more-sources` |
| JavaScript/TypeScript | `js/xss-through-dom` |
| JavaScript/TypeScript | `js/xss-through-exception` |
| Python | `py/http-response-splitting` |
| Python | `py/jinja2/autoescape-false` |
| Python | `py/reflective-xss` |
| Python | `py/reflective-xss-email` |
| Ruby | `rb/html-constructed-from-input` |
| Ruby | `rb/incomplete-multi-character-sanitization` |
| Ruby | `rb/incomplete-sanitization` |
| Ruby | `rb/reflected-xss` |
| Ruby | `rb/stored-xss` |
| Ruby | `rb/unsafe-code-construction` |
| Rust | `rust/xss` |
| Swift | `swift/unsafe-webview-fetch` |

### CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')

| Language | Query |
| ---------- | ------- |
| C# | `cs/sql-injection` |
| C/C++ | `cpp/sql-injection` |
| Go | `go/sql-injection` |
| Go | `go/unsafe-quoting` |
| Java/Kotlin | `java/concatenated-sql-query` |
| Java/Kotlin | `java/mybatis-annotation-sql-injection` |
| Java/Kotlin | `java/mybatis-xml-sql-injection` |
| Java/Kotlin | `java/sql-injection` |
| JavaScript/TypeScript | `js/env-key-and-value-injection` |
| JavaScript/TypeScript | `js/env-value-injection` |
| JavaScript/TypeScript | `js/sql-injection` |
| JavaScript/TypeScript | `js/sql-injection-more-sources` |
| Python | `py/sql-injection` |
| Ruby | `rb/sql-injection` |
| Rust | `rust/sql-injection` |
| Swift | `swift/sql-injection` |

### CWE-416: Use After Free

| Language | Query |
| ---------- | ------- |
| C/C++ | `cpp/iterator-to-expired-container` |
| C/C++ | `cpp/use-after-expired-lifetime` |
| C/C++ | `cpp/use-after-free` |
| C/C++ | `cpp/use-of-string-after-lifetime-ends` |
| C/C++ | `cpp/use-of-unique-pointer-after-lifetime-ends` |

### CWE-78: Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')

| Language | Query |
| ---------- | ------- |
| C# | `cs/command-line-injection` |
| C/C++ | `cpp/command-line-injection` |
| C/C++ | `cpp/wordexp-injection` |
| GitHub Actions | `actions/command-injection/critical` |
| GitHub Actions | `actions/command-injection/medium` |
| Go | `go/command-injection` |
| Go | `go/stored-command` |
| Go | `go/unsafe-quoting` |
| Java/Kotlin | `java/command-line-injection` |
| Java/Kotlin | `java/command-line-injection-experimental` |
| Java/Kotlin | `java/command-line-injection-extra` |
| Java/Kotlin | `java/command-line-injection-extra-local` |
| Java/Kotlin | `java/concatenated-command-line` |
| Java/Kotlin | `java/exec-tainted-environment` |
| Java/Kotlin | `java/relative-path-command` |
| JavaScript/TypeScript | `js/command-line-injection` |
| JavaScript/TypeScript | `js/command-line-injection-more-sources` |
| JavaScript/TypeScript | `js/indirect-command-line-injection` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment-more-sources` |
| JavaScript/TypeScript | `js/prototype-pollution` |
| JavaScript/TypeScript | `js/prototype-pollution-utility` |
| JavaScript/TypeScript | `js/second-order-command-line-injection` |
| JavaScript/TypeScript | `js/shell-command-constructed-from-input` |
| JavaScript/TypeScript | `js/shell-command-injection-from-environment` |
| JavaScript/TypeScript | `js/unnecessary-use-of-cat` |
| Python | `py/command-line-injection` |
| Python | `py/shell-command-constructed-from-input` |
| Ruby | `rb/command-line-injection` |
| Ruby | `rb/kernel-open` |
| Ruby | `rb/non-constant-kernel-open` |
| Ruby | `rb/shell-command-constructed-from-input` |
| Swift | `swift/command-line-injection` |

### CWE-20: Improper Input Validation

| Language | Query |
| ---------- | ------- |
| C# | `cs/assembly-path-injection` |
| C# | `cs/count-untrusted-data-external-api` |
| C# | `cs/serialization-check-bypass` |
| C# | `cs/untrusted-data-to-external-api` |
| C# | `cs/xml/missing-validation` |
| C/C++ | `cpp/count-untrusted-data-external-api` |
| C/C++ | `cpp/count-untrusted-data-external-api-ir` |
| C/C++ | `cpp/late-check-of-function-argument` |
| C/C++ | `cpp/linux-kernel-no-check-before-unsafe-put-user` |
| C/C++ | `cpp/unclear-array-index-validation` |
| C/C++ | `cpp/uncontrolled-allocation-size` |
| C/C++ | `cpp/uncontrolled-process-operation` |
| C/C++ | `cpp/untrusted-data-to-external-api` |
| C/C++ | `cpp/untrusted-data-to-external-api-ir` |
| GitHub Actions | `actions/composite-action-sinks` |
| GitHub Actions | `actions/composite-action-sources` |
| GitHub Actions | `actions/composite-action-summaries` |
| GitHub Actions | `actions/envpath-injection/critical` |
| GitHub Actions | `actions/envpath-injection/medium` |
| GitHub Actions | `actions/envvar-injection/critical` |
| GitHub Actions | `actions/envvar-injection/medium` |
| GitHub Actions | `actions/reusable-workflow-sinks` |
| GitHub Actions | `actions/reusable-workflow-sources` |
| GitHub Actions | `actions/reusable-workflow-summaries` |
| Go | `go/constant-length-comparison` |
| Go | `go/count-untrusted-data-external-api` |
| Go | `go/incomplete-hostname-regexp` |
| Go | `go/incomplete-url-scheme-check` |
| Go | `go/regex/missing-regexp-anchor` |
| Go | `go/suspicious-character-in-regex` |
| Go | `go/untrusted-data-to-external-api` |
| Go | `go/untrusted-data-to-unknown-external-api` |
| Java/Kotlin | `java/count-untrusted-data-external-api` |
| Java/Kotlin | `java/improper-validation-of-array-construction` |
| Java/Kotlin | `java/improper-validation-of-array-construction-code-specified` |
| Java/Kotlin | `java/improper-validation-of-array-index` |
| Java/Kotlin | `java/improper-validation-of-array-index-code-specified` |
| Java/Kotlin | `java/log4j-injection` |
| Java/Kotlin | `java/overly-large-range` |
| Java/Kotlin | `java/untrusted-data-to-external-api` |
| JavaScript/TypeScript | `js/bad-tag-filter` |
| JavaScript/TypeScript | `js/count-untrusted-data-external-api` |
| JavaScript/TypeScript | `js/double-escaping` |
| JavaScript/TypeScript | `js/incomplete-hostname-regexp` |
| JavaScript/TypeScript | `js/incomplete-html-attribute-sanitization` |
| JavaScript/TypeScript | `js/incomplete-multi-character-sanitization` |
| JavaScript/TypeScript | `js/incomplete-sanitization` |
| JavaScript/TypeScript | `js/incomplete-url-scheme-check` |
| JavaScript/TypeScript | `js/incomplete-url-substring-sanitization` |
| JavaScript/TypeScript | `js/incorrect-suffix-check` |
| JavaScript/TypeScript | `js/missing-origin-check` |
| JavaScript/TypeScript | `js/overly-large-range` |
| JavaScript/TypeScript | `js/regex/missing-regexp-anchor` |
| JavaScript/TypeScript | `js/untrusted-data-to-external-api` |
| JavaScript/TypeScript | `js/untrusted-data-to-external-api-more-sources` |
| JavaScript/TypeScript | `js/useless-regexp-character-escape` |
| Python | `py/bad-tag-filter` |
| Python | `py/cookie-injection` |
| Python | `py/count-untrusted-data-external-api` |
| Python | `py/incomplete-hostname-regexp` |
| Python | `py/incomplete-url-substring-sanitization` |
| Python | `py/overly-large-range` |
| Python | `py/untrusted-data-to-external-api` |
| Ruby | `rb/bad-tag-filter` |
| Ruby | `rb/incomplete-hostname-regexp` |
| Ruby | `rb/incomplete-multi-character-sanitization` |
| Ruby | `rb/incomplete-sanitization` |
| Ruby | `rb/incomplete-url-substring-sanitization` |
| Ruby | `rb/overly-large-range` |
| Ruby | `rb/regex/badly-anchored-regexp` |
| Ruby | `rb/regex/missing-regexp-anchor` |
| Rust | `rust/regex-injection` |
| Rust | `rust/uncontrolled-allocation-size` |
| Swift | `swift/bad-tag-filter` |
| Swift | `swift/incomplete-hostname-regexp` |
| Swift | `swift/missing-regexp-anchor` |

### CWE-125: Out-of-bounds Read

| Language | Query |
| ---------- | ------- |
| C/C++ | `cpp/dangerous-use-convert-function` |
| C/C++ | `cpp/invalid-pointer-deref` |
| C/C++ | `cpp/offset-use-before-range-check` |
| C/C++ | `cpp/overflow-buffer` |
| Go | `go/wrong-usage-of-unsafe` |

### CWE-22: Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')

| Language | Query |
| ---------- | ------- |
| C# | `cs/path-injection` |
| C# | `cs/webclient-path-injection` |
| C# | `cs/zipslip` |
| C/C++ | `cpp/path-injection` |
| Go | `go/path-injection` |
| Go | `go/unsafe-unzip-symlink` |
| Go | `go/zipslip` |
| Java/Kotlin | `java/openstream-called-on-tainted-url` |
| Java/Kotlin | `java/partial-path-traversal` |
| Java/Kotlin | `java/partial-path-traversal-from-remote` |
| Java/Kotlin | `java/path-injection` |
| Java/Kotlin | `java/zipslip` |
| JavaScript/TypeScript | `js/path-injection` |
| JavaScript/TypeScript | `js/zipslip` |
| Python | `py/path-injection` |
| Python | `py/tarslip` |
| Python | `py/tarslip-extended` |
| Python | `py/unsafe-unpacking` |
| Python | `py/zipslip` |
| Ruby | `rb/path-injection` |
| Ruby | `rb/zip-slip` |
| Rust | `rust/path-injection` |
| Swift | `swift/path-injection` |
| Swift | `swift/unsafe-unpacking` |

### CWE-352: Cross-Site Request Forgery (CSRF)

| Language | Query |
| ---------- | ------- |
| C# | `cs/web/missing-token-validation` |
| Go | `go/constant-oauth2-state` |
| Java/Kotlin | `java/csrf-unprotected-request-type` |
| Java/Kotlin | `java/jsonp-injection` |
| Java/Kotlin | `java/spring-disabled-csrf-protection` |
| JavaScript/TypeScript | `js/missing-token-validation` |
| Python | `py/csrf-protection-disabled` |
| Ruby | `rb/csrf-protection-disabled` |
| Ruby | `rb/csrf-protection-not-enabled` |

### CWE-434: Unrestricted Upload of File with Dangerous Type

| Language | Query |
| ---------- | ------- |
| C# | `cs/web/file-upload` |
| JavaScript/TypeScript | `js/http-to-file-access` |
| Ruby | `rb/http-to-file-access` |

### CWE-862: Missing Authorization

| Language | Query |
| ---------- | ------- |
| C# | `cs/empty-password-in-configuration` |
| C# | `cs/web/insecure-direct-object-reference` |
| C# | `cs/web/missing-function-level-access-control` |
| Java/Kotlin | `java/incorrect-url-verification` |
| JavaScript/TypeScript | `js/cors-misconfiguration-for-credentials` |
| JavaScript/TypeScript | `js/cors-misconfiguration-for-credentials-more-sources` |
| JavaScript/TypeScript | `js/empty-password-in-configuration-file` |

### CWE-476: NULL Pointer Dereference

| Language | Query |
| ---------- | ------- |
| C# | `cs/dereferenced-value-is-always-null` |
| C# | `cs/dereferenced-value-may-be-null` |
| C/C++ | `cpp/dangerous-use-of-exception-blocks` |
| C/C++ | `cpp/deref-null-result` |
| C/C++ | `cpp/inconsistent-null-check` |
| C/C++ | `cpp/inconsistent-nullness-testing` |
| C/C++ | `cpp/missing-null-test` |
| C/C++ | `cpp/redundant-null-check-param` |
| C/C++ | `cpp/redundant-null-check-simple` |
| Java/Kotlin | `java/dereferenced-expr-may-be-null` |
| Java/Kotlin | `java/dereferenced-value-is-always-null` |
| Java/Kotlin | `java/dereferenced-value-may-be-null` |
| JavaScript/TypeScript | `js/call-to-non-callable` |
| JavaScript/TypeScript | `js/property-access-on-non-object` |
| Rust | `rust/access-invalid-pointer` |

### CWE-287: Improper Authentication

| Language | Query |
| ---------- | ------- |
| C# | `cs/empty-password-in-configuration` |
| C# | `cs/hard-coded-symmetric-encryption-key` |
| C# | `cs/hardcoded-connection-string-credentials` |
| C# | `cs/hardcoded-credentials` |
| C# | `cs/password-in-configuration` |
| C# | `cs/session-reuse` |
| C# | `cs/user-controlled-bypass` |
| C# | `cs/web/broad-cookie-domain` |
| C# | `cs/web/broad-cookie-path` |
| C/C++ | `cpp/cleartext-storage-file` |
| C/C++ | `cpp/user-controlled-bypass` |
| Go | `go/email-injection` |
| Go | `go/hardcoded-credentials` |
| Go | `go/improper-ldap-auth` |
| Go | `go/parse-jwt-with-hardcoded-key` |
| Go | `go/sensitive-condition-bypass` |
| Java/Kotlin | `java/android/insecure-local-authentication` |
| Java/Kotlin | `java/android/insecure-local-key-gen` |
| Java/Kotlin | `java/credentials-in-properties` |
| Java/Kotlin | `java/hardcoded-credential-api-call` |
| Java/Kotlin | `java/hardcoded-credential-comparison` |
| Java/Kotlin | `java/hardcoded-credential-sensitive-call` |
| Java/Kotlin | `java/hardcoded-password-field` |
| Java/Kotlin | `java/insecure-basic-auth` |
| Java/Kotlin | `java/insecure-ldap-auth` |
| Java/Kotlin | `java/password-in-configuration` |
| Java/Kotlin | `java/tainted-permissions-check` |
| Java/Kotlin | `java/user-controlled-bypass` |
| JavaScript/TypeScript | `js/different-kinds-comparison-bypass` |
| JavaScript/TypeScript | `js/empty-password-in-configuration-file` |
| JavaScript/TypeScript | `js/hardcoded-credentials` |
| JavaScript/TypeScript | `js/host-header-forgery-in-email-generation` |
| JavaScript/TypeScript | `js/missing-rate-limiting` |
| JavaScript/TypeScript | `js/password-in-configuration-file` |
| JavaScript/TypeScript | `js/session-fixation` |
| JavaScript/TypeScript | `js/user-controlled-bypass` |
| JavaScript/TypeScript | `js/user-controlled-bypass-more-sources` |
| JavaScript/TypeScript | `js/user-controlled-data-decompression` |
| Python | `py/flask-constant-secret-key` |
| Python | `py/hardcoded-credentials` |
| Python | `py/improper-ldap-auth` |
| Python | `py/insecure-ldap-auth` |
| Ruby | `rb/hardcoded-credentials` |
| Ruby | `rb/improper-ldap-auth` |
| Ruby | `rb/user-controlled-bypass` |
| Rust | `rust/hard-coded-cryptographic-value` |
| Swift | `swift/constant-password` |
| Swift | `swift/hardcoded-key` |

### CWE-190: Integer Overflow or Wraparound

| Language | Query |
| ---------- | ------- |
| C# | `cs/loss-of-precision` |
| C/C++ | `cpp/ambiguously-signed-bit-field` |
| C/C++ | `cpp/arithmetic-with-extreme-values` |
| C/C++ | `cpp/bad-addition-overflow-check` |
| C/C++ | `cpp/comparison-with-wider-type` |
| C/C++ | `cpp/dangerous-use-of-transformation-after-operation` |
| C/C++ | `cpp/integer-multiplication-cast-to-long` |
| C/C++ | `cpp/integer-overflow-tainted` |
| C/C++ | `cpp/multiplication-overflow-in-alloc` |
| C/C++ | `cpp/overflowing-snprintf` |
| C/C++ | `cpp/signed-bit-field` |
| C/C++ | `cpp/signed-overflow-check` |
| C/C++ | `cpp/tainted-arithmetic` |
| C/C++ | `cpp/uncontrolled-allocation-size` |
| C/C++ | `cpp/uncontrolled-arithmetic` |
| Go | `go/allocation-size-overflow` |
| Go | `go/incorrect-integer-conversion` |
| Java/Kotlin | `java/comparison-with-wider-type` |
| Java/Kotlin | `java/extreme-value-arithmetic` |
| Java/Kotlin | `java/implicit-cast-in-compound-assignment` |
| Java/Kotlin | `java/integer-multiplication-cast-to-long` |
| Java/Kotlin | `java/tainted-arithmetic` |
| Java/Kotlin | `java/uncontrolled-arithmetic` |

### CWE-502: Deserialization of Untrusted Data

| Language | Query |
| ---------- | ------- |
| C# | `cs/deserialized-delegate` |
| C# | `cs/unsafe-deserialization` |
| C# | `cs/unsafe-deserialization-untrusted-input` |
| Java/Kotlin | `java/log4j-injection` |
| Java/Kotlin | `java/unsafe-deserialization` |
| Java/Kotlin | `java/unsafe-deserialization-rmi` |
| Java/Kotlin | `java/unsafe-deserialization-spring-exporter-in-configuration-class` |
| Java/Kotlin | `java/unsafe-deserialization-spring-exporter-in-xml-configuration` |
| JavaScript/TypeScript | `js/unsafe-deserialization` |
| JavaScript/TypeScript | `js/unsafe-deserialization-more-sources` |
| Python | `py/unsafe-deserialization` |
| Ruby | `rb/unsafe-deserialization` |
| Ruby | `rb/unsafe-unsafeyamldeserialization` |

### CWE-77: Improper Neutralization of Special Elements used in a Command ('Command Injection')

| Language | Query |
| ---------- | ------- |
| C# | `cs/command-line-injection` |
| C/C++ | `cpp/command-line-injection` |
| C/C++ | `cpp/wordexp-injection` |
| GitHub Actions | `actions/argument-injection/critical` |
| GitHub Actions | `actions/argument-injection/medium` |
| GitHub Actions | `actions/command-injection/critical` |
| GitHub Actions | `actions/command-injection/medium` |
| GitHub Actions | `actions/envpath-injection/critical` |
| GitHub Actions | `actions/envpath-injection/medium` |
| GitHub Actions | `actions/envvar-injection/critical` |
| GitHub Actions | `actions/envvar-injection/medium` |
| Go | `go/command-injection` |
| Go | `go/stored-command` |
| Go | `go/unsafe-quoting` |
| Java/Kotlin | `java/command-line-injection` |
| Java/Kotlin | `java/command-line-injection-experimental` |
| Java/Kotlin | `java/command-line-injection-extra` |
| Java/Kotlin | `java/command-line-injection-extra-local` |
| Java/Kotlin | `java/concatenated-command-line` |
| Java/Kotlin | `java/exec-tainted-environment` |
| Java/Kotlin | `java/ognl-injection` |
| Java/Kotlin | `java/relative-path-command` |
| JavaScript/TypeScript | `js/command-line-injection` |
| JavaScript/TypeScript | `js/command-line-injection-more-sources` |
| JavaScript/TypeScript | `js/indirect-command-line-injection` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment-more-sources` |
| JavaScript/TypeScript | `js/prototype-pollution` |
| JavaScript/TypeScript | `js/prototype-pollution-utility` |
| JavaScript/TypeScript | `js/second-order-command-line-injection` |
| JavaScript/TypeScript | `js/shell-command-constructed-from-input` |
| JavaScript/TypeScript | `js/shell-command-injection-from-environment` |
| JavaScript/TypeScript | `js/unnecessary-use-of-cat` |
| Python | `py/command-line-injection` |
| Python | `py/shell-command-constructed-from-input` |
| Ruby | `rb/command-line-injection` |
| Ruby | `rb/kernel-open` |
| Ruby | `rb/non-constant-kernel-open` |
| Ruby | `rb/shell-command-constructed-from-input` |
| Swift | `swift/command-line-injection` |

### CWE-119: Improper Restriction of Operations within the Bounds of a Memory Buffer

| Language | Query |
| ---------- | ------- |
| C# | `cs/unvalidated-local-pointer-arithmetic` |
| C/C++ | `cpp/access-memory-location-after-end-buffer-strlen` |
| C/C++ | `cpp/allocation-too-small` |
| C/C++ | `cpp/bad-strncpy-size` |
| C/C++ | `cpp/badly-bounded-write` |
| C/C++ | `cpp/buffer-access-with-incorrect-length-value` |
| C/C++ | `cpp/dangerous-use-convert-function` |
| C/C++ | `cpp/dangerous-use-of-exception-blocks` |
| C/C++ | `cpp/double-free` |
| C/C++ | `cpp/experimental-double-free` |
| C/C++ | `cpp/invalid-pointer-deref` |
| C/C++ | `cpp/iterator-to-expired-container` |
| C/C++ | `cpp/late-negative-test` |
| C/C++ | `cpp/memory-unsafe-function-scan` |
| C/C++ | `cpp/missing-negativity-test` |
| C/C++ | `cpp/no-space-for-terminator` |
| C/C++ | `cpp/offset-use-before-range-check` |
| C/C++ | `cpp/openssl-heartbleed` |
| C/C++ | `cpp/overflow-buffer` |
| C/C++ | `cpp/overflow-calculated` |
| C/C++ | `cpp/overflow-destination` |
| C/C++ | `cpp/overrun-write` |
| C/C++ | `cpp/overrunning-write` |
| C/C++ | `cpp/overrunning-write-with-float` |
| C/C++ | `cpp/return-stack-allocated-memory` |
| C/C++ | `cpp/sign-conversion-pointer-arithmetic` |
| C/C++ | `cpp/static-buffer-overflow` |
| C/C++ | `cpp/suspicious-allocation-size` |
| C/C++ | `cpp/unbounded-write` |
| C/C++ | `cpp/unsafe-strcat` |
| C/C++ | `cpp/unsafe-strncat` |
| C/C++ | `cpp/unterminated-variadic-call` |
| C/C++ | `cpp/upcast-array-pointer-arithmetic` |
| C/C++ | `cpp/use-after-expired-lifetime` |
| C/C++ | `cpp/use-after-free` |
| C/C++ | `cpp/use-of-string-after-lifetime-ends` |
| C/C++ | `cpp/use-of-unique-pointer-after-lifetime-ends` |
| C/C++ | `cpp/using-expired-stack-address` |
| C/C++ | `cpp/very-likely-overrunning-write` |
| Go | `go/wrong-usage-of-unsafe` |
| Rust | `rust/access-after-lifetime-ended` |
| Rust | `rust/access-invalid-pointer` |

### CWE-798: Use of Hard-coded Credentials

| Language | Query |
| ---------- | ------- |
| C# | `cs/hard-coded-symmetric-encryption-key` |
| C# | `cs/hardcoded-connection-string-credentials` |
| C# | `cs/hardcoded-credentials` |
| Go | `go/hardcoded-credentials` |
| Go | `go/parse-jwt-with-hardcoded-key` |
| Java/Kotlin | `java/hardcoded-credential-api-call` |
| Java/Kotlin | `java/hardcoded-credential-comparison` |
| Java/Kotlin | `java/hardcoded-credential-sensitive-call` |
| Java/Kotlin | `java/hardcoded-password-field` |
| JavaScript/TypeScript | `js/hardcoded-credentials` |
| Python | `py/hardcoded-credentials` |
| Ruby | `rb/hardcoded-credentials` |
| Rust | `rust/hard-coded-cryptographic-value` |
| Swift | `swift/constant-password` |
| Swift | `swift/hardcoded-key` |

### CWE-918: Server-Side Request Forgery (SSRF)

| Language | Query |
| ---------- | ------- |
| C# | `cs/request-forgery` |
| GitHub Actions | `actions/request-forgery` |
| Go | `go/request-forgery` |
| Go | `go/ssrf` |
| Java/Kotlin | `java/ssrf` |
| JavaScript/TypeScript | `javascript/ssrf` |
| JavaScript/TypeScript | `js/client-side-request-forgery` |
| JavaScript/TypeScript | `js/request-forgery` |
| Python | `py/full-ssrf` |
| Python | `py/partial-ssrf` |
| Ruby | `rb/request-forgery` |
| Rust | `rust/request-forgery` |

### CWE-306: Missing Authentication for Critical Function

No direct CodeQL query mapping found in the repository list.

### CWE-362: Concurrent Execution using Shared Resource with Improper Synchronization ('Race Condition')

| Language | Query |
| ---------- | ------- |
| C# | `cs/thread-unsafe-icryptotransform-captured-in-lambda` |
| C# | `cs/thread-unsafe-icryptotransform-field-in-class` |
| C# | `cs/unsafe-sync-on-field` |
| C# | `cs/unsynchronized-static-access` |
| C/C++ | `cpp/linux-kernel-double-fetch-vulnerability` |
| C/C++ | `cpp/toctou-race-condition` |
| GitHub Actions | `actions/untrusted-checkout-toctou/critical` |
| GitHub Actions | `actions/untrusted-checkout-toctou/high` |
| Java/Kotlin | `java/socket-auth-race-condition` |
| Java/Kotlin | `java/toctou-race-condition` |
| JavaScript/TypeScript | `js/file-system-race` |

### CWE-269: Improper Privilege Management

| Language | Query |
| ---------- | ------- |
| C/C++ | `cpp/drop-linux-privileges-outoforder` |
| C/C++ | `cpp/wrong-use-of-the-umask` |
| Java/Kotlin | `java/android/intent-uri-permission-manipulation` |
| Java/Kotlin | `java/unsafe-cert-trust` |
| JavaScript/TypeScript | `js/remote-property-injection` |
| JavaScript/TypeScript | `js/remote-property-injection-more-sources` |

### CWE-94: Improper Control of Generation of Code ('Code Injection')

| Language | Query |
| ---------- | ------- |
| C# | `cs/code-injection` |
| GitHub Actions | `actions/cache-poisoning/code-injection` |
| GitHub Actions | `actions/code-injection/critical` |
| GitHub Actions | `actions/code-injection/medium` |
| Go | `go/unsafe-quoting` |
| Java/Kotlin | `java/android-insecure-dex-loading` |
| Java/Kotlin | `java/android/arbitrary-apk-installation` |
| Java/Kotlin | `java/beanshell-injection` |
| Java/Kotlin | `java/groovy-injection` |
| Java/Kotlin | `java/insecure-bean-validation` |
| Java/Kotlin | `java/javaee-expression-injection` |
| Java/Kotlin | `java/jexl-expression-injection` |
| Java/Kotlin | `java/jshell-injection` |
| Java/Kotlin | `java/jython-injection` |
| Java/Kotlin | `java/mvel-expression-injection` |
| Java/Kotlin | `java/server-side-template-injection` |
| Java/Kotlin | `java/spel-expression-injection` |
| Java/Kotlin | `java/spring-view-manipulation` |
| Java/Kotlin | `java/spring-view-manipulation-implicit` |
| Java/Kotlin | `java/unsafe-eval` |
| JavaScript/TypeScript | `js/bad-code-sanitization` |
| JavaScript/TypeScript | `js/code-injection` |
| JavaScript/TypeScript | `js/code-injection-dynamic-import` |
| JavaScript/TypeScript | `js/code-injection-more-sources` |
| JavaScript/TypeScript | `js/enabling-electron-renderer-node-integration` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment-more-sources` |
| JavaScript/TypeScript | `js/prototype-pollution` |
| JavaScript/TypeScript | `js/prototype-pollution-utility` |
| JavaScript/TypeScript | `js/template-object-injection` |
| JavaScript/TypeScript | `js/unsafe-code-construction` |
| JavaScript/TypeScript | `js/unsafe-dynamic-method-access` |
| Python | `py/code-injection` |
| Python | `py/js2py-rce` |
| Python | `py/use-of-input` |
| Ruby | `rb/code-injection` |
| Ruby | `rb/server-side-template-injection` |
| Ruby | `rb/unsafe-code-construction` |
| Swift | `swift/unsafe-js-eval` |
| Swift | `swift/unsafe-webview-fetch` |

### CWE-863: Incorrect Authorization

| Language | Query |
| ---------- | ------- |
| Java/Kotlin | `java/permissive-dot-regex` |

### CWE-276: Incorrect Default Permissions

No direct CodeQL query mapping found in the repository list.
