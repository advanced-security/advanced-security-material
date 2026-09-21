# SANS Top 25 Most Dangerous Software Weaknesses to CodeQL Queries Mapping

## Overview
This document provides a mapping between the SANS Top 25 Most Dangerous Software Weaknesses and available CodeQL queries through their Common Weakness Enumeration (CWE) identifiers. The SANS Top 25 represents the most widespread and critical software security weaknesses.

The ranking below preserves the 25 CWEs supplied in the original request; the filename does not indicate a verified 2025 ranking. Query mappings were checked against the [CodeQL full CWE coverage index](https://codeql.github.com/codeql-query-help/full-cwe/) on 2026-09-21.

Each table includes every language/query ID pair listed under that CWE in the index, including experimental, diagnostic, and model-generation queries where listed. Language labels follow the index, including combined Java/Kotlin and JavaScript/TypeScript labels and GitHub Actions.

The index is not a list of explicit query metadata tags only. The [CodeQL CWE coverage methodology](https://codeql.github.com/codeql-query-help/codeql-cwe-coverage/) includes both the most precise CWEs associated with a query and their ancestors in the CWE Research View. For example, [`cpp/toctou-race-condition`](https://codeql.github.com/codeql-query-help/cpp/cpp-toctou-race-condition/) explicitly tags CWE-367 and appears here under its ancestor CWE-362; [`java/unsafe-cert-trust`](https://codeql.github.com/codeql-query-help/java/java-unsafe-cert-trust/) explicitly tags CWE-273 and appears under CWE-269. These are indexed ancestor associations, not additional explicit tags or claims that the CWEs are interchangeable.

This is an inventory of indexed mappings, not a guarantee of complete vulnerability detection or inclusion in a particular query suite. Query availability depends on the CodeQL version, installed query packs, and selected suite.

## SANS Top 25 CWE List

| Rank | Name | CWE ID |
|------|------|--------|
| 1 | Out-of-bounds Write | [CWE-787](https://cwe.mitre.org/data/definitions/787.html) |
| 2 | Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting') | [CWE-79](https://cwe.mitre.org/data/definitions/79.html) |
| 3 | Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection') | [CWE-89](https://cwe.mitre.org/data/definitions/89.html) |
| 4 | Use After Free | [CWE-416](https://cwe.mitre.org/data/definitions/416.html) |
| 5 | Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection') | [CWE-78](https://cwe.mitre.org/data/definitions/78.html) |
| 6 | Improper Input Validation | [CWE-20](https://cwe.mitre.org/data/definitions/20.html) |
| 7 | Out-of-bounds Read | [CWE-125](https://cwe.mitre.org/data/definitions/125.html) |
| 8 | Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal') | [CWE-22](https://cwe.mitre.org/data/definitions/22.html) |
| 9 | Cross-Site Request Forgery (CSRF) | [CWE-352](https://cwe.mitre.org/data/definitions/352.html) |
| 10 | Unrestricted Upload of File with Dangerous Type | [CWE-434](https://cwe.mitre.org/data/definitions/434.html) |
| 11 | Missing Authorization | [CWE-862](https://cwe.mitre.org/data/definitions/862.html) |
| 12 | NULL Pointer Dereference | [CWE-476](https://cwe.mitre.org/data/definitions/476.html) |
| 13 | Improper Authentication | [CWE-287](https://cwe.mitre.org/data/definitions/287.html) |
| 14 | Integer Overflow or Wraparound | [CWE-190](https://cwe.mitre.org/data/definitions/190.html) |
| 15 | Deserialization of Untrusted Data | [CWE-502](https://cwe.mitre.org/data/definitions/502.html) |
| 16 | Improper Neutralization of Special Elements used in a Command ('Command Injection') | [CWE-77](https://cwe.mitre.org/data/definitions/77.html) |
| 17 | Improper Restriction of Operations within the Bounds of a Memory Buffer | [CWE-119](https://cwe.mitre.org/data/definitions/119.html) |
| 18 | Use of Hard-coded Credentials | [CWE-798](https://cwe.mitre.org/data/definitions/798.html) |
| 19 | Server-Side Request Forgery (SSRF) | [CWE-918](https://cwe.mitre.org/data/definitions/918.html) |
| 20 | Missing Authentication for Critical Function | [CWE-306](https://cwe.mitre.org/data/definitions/306.html) |
| 21 | Concurrent Execution using Shared Resource with Improper Synchronization ('Race Condition') | [CWE-362](https://cwe.mitre.org/data/definitions/362.html) |
| 22 | Improper Privilege Management | [CWE-269](https://cwe.mitre.org/data/definitions/269.html) |
| 23 | Improper Control of Generation of Code ('Code Injection') | [CWE-94](https://cwe.mitre.org/data/definitions/94.html) |
| 24 | Incorrect Authorization | [CWE-863](https://cwe.mitre.org/data/definitions/863.html) |
| 25 | Incorrect Default Permissions | [CWE-276](https://cwe.mitre.org/data/definitions/276.html) |

---

## Comprehensive CodeQL Query Mapping by CWE

### CWE-20: Improper Input Validation
| Language | Query |
|----------|-------|
| GitHub Actions | `actions/composite-action-sinks` |
| GitHub Actions | `actions/composite-action-sources` |
| GitHub Actions | `actions/composite-action-summaries` |
| GitHub Actions | `actions/reusable-workflow-sinks` |
| GitHub Actions | `actions/reusable-workflow-sources` |
| GitHub Actions | `actions/reusable-workflow-summaries` |
| GitHub Actions | `actions/envpath-injection/critical` |
| GitHub Actions | `actions/envpath-injection/medium` |
| GitHub Actions | `actions/envvar-injection/critical` |
| GitHub Actions | `actions/envvar-injection/medium` |
| C/C++ | `cpp/count-untrusted-data-external-api` |
| C/C++ | `cpp/count-untrusted-data-external-api-ir` |
| C/C++ | `cpp/untrusted-data-to-external-api-ir` |
| C/C++ | `cpp/untrusted-data-to-external-api` |
| C/C++ | `cpp/uncontrolled-process-operation` |
| C/C++ | `cpp/unclear-array-index-validation` |
| C/C++ | `cpp/uncontrolled-allocation-size` |
| C/C++ | `cpp/late-check-of-function-argument` |
| C/C++ | `cpp/linux-kernel-no-check-before-unsafe-put-user` |
| C# | `cs/count-untrusted-data-external-api` |
| C# | `cs/serialization-check-bypass` |
| C# | `cs/untrusted-data-to-external-api` |
| C# | `cs/xml/missing-validation` |
| C# | `cs/assembly-path-injection` |
| Go | `go/constant-length-comparison` |
| Go | `go/count-untrusted-data-external-api` |
| Go | `go/incomplete-hostname-regexp` |
| Go | `go/incomplete-url-scheme-check` |
| Go | `go/regex/missing-regexp-anchor` |
| Go | `go/suspicious-character-in-regex` |
| Go | `go/untrusted-data-to-external-api` |
| Go | `go/untrusted-data-to-unknown-external-api` |
| Java/Kotlin | `java/count-untrusted-data-external-api` |
| Java/Kotlin | `java/overly-large-range` |
| Java/Kotlin | `java/untrusted-data-to-external-api` |
| Java/Kotlin | `java/improper-validation-of-array-construction` |
| Java/Kotlin | `java/improper-validation-of-array-construction-code-specified` |
| Java/Kotlin | `java/improper-validation-of-array-index` |
| Java/Kotlin | `java/improper-validation-of-array-index-code-specified` |
| Java/Kotlin | `java/log4j-injection` |
| JavaScript/TypeScript | `js/count-untrusted-data-external-api` |
| JavaScript/TypeScript | `js/incomplete-hostname-regexp` |
| JavaScript/TypeScript | `js/incomplete-url-scheme-check` |
| JavaScript/TypeScript | `js/incomplete-url-substring-sanitization` |
| JavaScript/TypeScript | `js/incorrect-suffix-check` |
| JavaScript/TypeScript | `js/missing-origin-check` |
| JavaScript/TypeScript | `js/regex/missing-regexp-anchor` |
| JavaScript/TypeScript | `js/overly-large-range` |
| JavaScript/TypeScript | `js/untrusted-data-to-external-api` |
| JavaScript/TypeScript | `js/useless-regexp-character-escape` |
| JavaScript/TypeScript | `js/bad-tag-filter` |
| JavaScript/TypeScript | `js/double-escaping` |
| JavaScript/TypeScript | `js/incomplete-html-attribute-sanitization` |
| JavaScript/TypeScript | `js/incomplete-multi-character-sanitization` |
| JavaScript/TypeScript | `js/incomplete-sanitization` |
| JavaScript/TypeScript | `js/untrusted-data-to-external-api-more-sources` |
| Python | `py/count-untrusted-data-external-api` |
| Python | `py/untrusted-data-to-external-api` |
| Python | `py/cookie-injection` |
| Python | `py/incomplete-hostname-regexp` |
| Python | `py/incomplete-url-substring-sanitization` |
| Python | `py/overly-large-range` |
| Python | `py/bad-tag-filter` |
| Ruby | `rb/incomplete-hostname-regexp` |
| Ruby | `rb/incomplete-url-substring-sanitization` |
| Ruby | `rb/regex/badly-anchored-regexp` |
| Ruby | `rb/regex/missing-regexp-anchor` |
| Ruby | `rb/overly-large-range` |
| Ruby | `rb/bad-tag-filter` |
| Ruby | `rb/incomplete-multi-character-sanitization` |
| Ruby | `rb/incomplete-sanitization` |
| Rust | `rust/regex-injection` |
| Rust | `rust/uncontrolled-allocation-size` |
| Swift | `swift/incomplete-hostname-regexp` |
| Swift | `swift/missing-regexp-anchor` |
| Swift | `swift/bad-tag-filter` |

### CWE-22: Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')
| Language | Query |
|----------|-------|
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

### CWE-77: Improper Neutralization of Special Elements used in a Command ('Command Injection')
| Language | Query |
|----------|-------|
| GitHub Actions | `actions/envpath-injection/critical` |
| GitHub Actions | `actions/envpath-injection/medium` |
| GitHub Actions | `actions/envvar-injection/critical` |
| GitHub Actions | `actions/envvar-injection/medium` |
| GitHub Actions | `actions/command-injection/critical` |
| GitHub Actions | `actions/command-injection/medium` |
| GitHub Actions | `actions/argument-injection/critical` |
| GitHub Actions | `actions/argument-injection/medium` |
| C/C++ | `cpp/command-line-injection` |
| C/C++ | `cpp/uncontrolled-process-operation` |
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
| Rust | `rust/command-line-injection` |
| Swift | `swift/command-line-injection` |

### CWE-78: Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')
| Language | Query |
|----------|-------|
| GitHub Actions | `actions/command-injection/critical` |
| GitHub Actions | `actions/command-injection/medium` |
| C/C++ | `cpp/command-line-injection` |
| C/C++ | `cpp/uncontrolled-process-operation` |
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
| Rust | `rust/command-line-injection` |
| Swift | `swift/command-line-injection` |

### CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
| Language | Query |
|----------|-------|
| C/C++ | `cpp/cgi-xss` |
| C# | `cs/web/xss` |
| Go | `go/html-template-escaping-bypass-xss` |
| Go | `go/reflected-xss` |
| Go | `go/stored-xss` |
| Java/Kotlin | `java/android/webview-addjavascriptinterface` |
| Java/Kotlin | `java/android/websettings-javascript-enabled` |
| Java/Kotlin | `java/xss` |
| Java/Kotlin | `java/android/unsafe-android-webview-fetch` |
| JavaScript/TypeScript | `js/disabling-electron-websecurity` |
| JavaScript/TypeScript | `js/xss-through-exception` |
| JavaScript/TypeScript | `js/reflected-xss` |
| JavaScript/TypeScript | `js/stored-xss` |
| JavaScript/TypeScript | `js/html-constructed-from-input` |
| JavaScript/TypeScript | `js/unsafe-jquery-plugin` |
| JavaScript/TypeScript | `js/xss` |
| JavaScript/TypeScript | `js/xss-through-dom` |
| JavaScript/TypeScript | `js/code-injection` |
| JavaScript/TypeScript | `js/bad-code-sanitization` |
| JavaScript/TypeScript | `js/unsafe-code-construction` |
| JavaScript/TypeScript | `js/bad-tag-filter` |
| JavaScript/TypeScript | `js/incomplete-html-attribute-sanitization` |
| JavaScript/TypeScript | `js/incomplete-multi-character-sanitization` |
| JavaScript/TypeScript | `js/incomplete-sanitization` |
| JavaScript/TypeScript | `js/unsafe-html-expansion` |
| JavaScript/TypeScript | `js/client-side-unvalidated-url-redirection` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment` |
| JavaScript/TypeScript | `js/prototype-pollution-utility` |
| JavaScript/TypeScript | `js/prototype-pollution` |
| JavaScript/TypeScript | `js/code-injection-dynamic-import` |
| JavaScript/TypeScript | `js/xss-more-sources` |
| JavaScript/TypeScript | `js/code-injection-more-sources` |
| JavaScript/TypeScript | `js/prototype-polluting-assignment-more-sources` |
| Python | `py/jinja2/autoescape-false` |
| Python | `py/reflective-xss` |
| Python | `py/http-response-splitting` |
| Python | `py/reflective-xss-email` |
| Ruby | `rb/reflected-xss` |
| Ruby | `rb/stored-xss` |
| Ruby | `rb/html-constructed-from-input` |
| Ruby | `rb/unsafe-code-construction` |
| Ruby | `rb/incomplete-multi-character-sanitization` |
| Ruby | `rb/incomplete-sanitization` |
| Rust | `rust/xss` |
| Swift | `swift/unsafe-webview-fetch` |

### CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
| Language | Query |
|----------|-------|
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

### CWE-94: Improper Control of Generation of Code ('Code Injection')
| Language | Query |
|----------|-------|
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

### CWE-119: Improper Restriction of Operations within the Bounds of a Memory Buffer
| Language | Query |
|----------|-------|
| C/C++ | `cpp/offset-use-before-range-check` |
| C/C++ | `cpp/double-free` |
| C/C++ | `cpp/late-negative-test` |
| C/C++ | `cpp/missing-negativity-test` |
| C/C++ | `cpp/overflow-calculated` |
| C/C++ | `cpp/overflow-destination` |
| C/C++ | `cpp/static-buffer-overflow` |
| C/C++ | `cpp/allocation-too-small` |
| C/C++ | `cpp/suspicious-allocation-size` |
| C/C++ | `cpp/use-after-free` |
| C/C++ | `cpp/upcast-array-pointer-arithmetic` |
| C/C++ | `cpp/return-stack-allocated-memory` |
| C/C++ | `cpp/bad-strncpy-size` |
| C/C++ | `cpp/unsafe-strncat` |
| C/C++ | `cpp/unsafe-strcat` |
| C/C++ | `cpp/using-expired-stack-address` |
| C/C++ | `cpp/overflow-buffer` |
| C/C++ | `cpp/overrun-write` |
| C/C++ | `cpp/badly-bounded-write` |
| C/C++ | `cpp/overrunning-write` |
| C/C++ | `cpp/overrunning-write-with-float` |
| C/C++ | `cpp/unbounded-write` |
| C/C++ | `cpp/very-likely-overrunning-write` |
| C/C++ | `cpp/unterminated-variadic-call` |
| C/C++ | `cpp/no-space-for-terminator` |
| C/C++ | `cpp/invalid-pointer-deref` |
| C/C++ | `cpp/openssl-heartbleed` |
| C/C++ | `cpp/iterator-to-expired-container` |
| C/C++ | `cpp/use-of-string-after-lifetime-ends` |
| C/C++ | `cpp/use-of-unique-pointer-after-lifetime-ends` |
| C/C++ | `cpp/memory-unsafe-function-scan` |
| C/C++ | `cpp/dangerous-use-convert-function` |
| C/C++ | `cpp/experimental-double-free` |
| C/C++ | `cpp/use-after-expired-lifetime` |
| C/C++ | `cpp/dangerous-use-of-exception-blocks` |
| C/C++ | `cpp/sign-conversion-pointer-arithmetic` |
| C/C++ | `cpp/access-memory-location-after-end-buffer-strlen` |
| C/C++ | `cpp/buffer-access-with-incorrect-length-value` |
| C# | `cs/unvalidated-local-pointer-arithmetic` |
| Go | `go/wrong-usage-of-unsafe` |
| Rust | `rust/access-after-lifetime-ended` |
| Rust | `rust/access-invalid-pointer` |

### CWE-125: Out-of-bounds Read
| Language | Query |
|----------|-------|
| C/C++ | `cpp/offset-use-before-range-check` |
| C/C++ | `cpp/overflow-buffer` |
| C/C++ | `cpp/invalid-pointer-deref` |
| C/C++ | `cpp/dangerous-use-convert-function` |
| Go | `go/wrong-usage-of-unsafe` |

### CWE-190: Integer Overflow or Wraparound
| Language | Query |
|----------|-------|
| C/C++ | `cpp/ambiguously-signed-bit-field` |
| C/C++ | `cpp/bad-addition-overflow-check` |
| C/C++ | `cpp/integer-multiplication-cast-to-long` |
| C/C++ | `cpp/signed-overflow-check` |
| C/C++ | `cpp/overflowing-snprintf` |
| C/C++ | `cpp/tainted-arithmetic` |
| C/C++ | `cpp/uncontrolled-arithmetic` |
| C/C++ | `cpp/arithmetic-with-extreme-values` |
| C/C++ | `cpp/comparison-with-wider-type` |
| C/C++ | `cpp/integer-overflow-tainted` |
| C/C++ | `cpp/uncontrolled-allocation-size` |
| C/C++ | `cpp/multiplication-overflow-in-alloc` |
| C/C++ | `cpp/dangerous-use-of-transformation-after-operation` |
| C/C++ | `cpp/signed-bit-field` |
| C# | `cs/loss-of-precision` |
| Go | `go/allocation-size-overflow` |
| Go | `go/incorrect-integer-conversion` |
| Java/Kotlin | `java/implicit-cast-in-compound-assignment` |
| Java/Kotlin | `java/integer-multiplication-cast-to-long` |
| Java/Kotlin | `java/tainted-arithmetic` |
| Java/Kotlin | `java/uncontrolled-arithmetic` |
| Java/Kotlin | `java/extreme-value-arithmetic` |
| Java/Kotlin | `java/comparison-with-wider-type` |

### CWE-269: Improper Privilege Management
| Language | Query |
|----------|-------|
| C/C++ | `cpp/wrong-use-of-the-umask` |
| C/C++ | `cpp/drop-linux-privileges-outoforder` |
| Java/Kotlin | `java/android/intent-uri-permission-manipulation` |
| Java/Kotlin | `java/unsafe-cert-trust` |
| JavaScript/TypeScript | `js/remote-property-injection` |
| JavaScript/TypeScript | `js/remote-property-injection-more-sources` |

### CWE-276: Incorrect Default Permissions
**Note:** No query is listed under CWE-276 in the CodeQL full CWE coverage index as of the verification date. This does not rule out related checks under other CWEs or in custom query packs. Review default file and resource permissions manually.

### CWE-287: Improper Authentication
| Language | Query |
|----------|-------|
| C/C++ | `cpp/user-controlled-bypass` |
| C/C++ | `cpp/cleartext-storage-file` |
| C# | `cs/empty-password-in-configuration` |
| C# | `cs/password-in-configuration` |
| C# | `cs/hard-coded-symmetric-encryption-key` |
| C# | `cs/session-reuse` |
| C# | `cs/hardcoded-connection-string-credentials` |
| C# | `cs/hardcoded-credentials` |
| C# | `cs/user-controlled-bypass` |
| C# | `cs/web/broad-cookie-domain` |
| C# | `cs/web/broad-cookie-path` |
| Go | `go/email-injection` |
| Go | `go/hardcoded-credentials` |
| Go | `go/improper-ldap-auth` |
| Go | `go/parse-jwt-with-hardcoded-key` |
| Go | `go/sensitive-condition-bypass` |
| Java/Kotlin | `java/android/insecure-local-key-gen` |
| Java/Kotlin | `java/android/insecure-local-authentication` |
| Java/Kotlin | `java/insecure-basic-auth` |
| Java/Kotlin | `java/insecure-ldap-auth` |
| Java/Kotlin | `java/hardcoded-credential-api-call` |
| Java/Kotlin | `java/hardcoded-credential-comparison` |
| Java/Kotlin | `java/hardcoded-credential-sensitive-call` |
| Java/Kotlin | `java/hardcoded-password-field` |
| Java/Kotlin | `java/user-controlled-bypass` |
| Java/Kotlin | `java/tainted-permissions-check` |
| Java/Kotlin | `java/credentials-in-properties` |
| Java/Kotlin | `java/password-in-configuration` |
| JavaScript/TypeScript | `js/password-in-configuration-file` |
| JavaScript/TypeScript | `js/session-fixation` |
| JavaScript/TypeScript | `js/host-header-forgery-in-email-generation` |
| JavaScript/TypeScript | `js/missing-rate-limiting` |
| JavaScript/TypeScript | `js/hardcoded-credentials` |
| JavaScript/TypeScript | `js/user-controlled-bypass` |
| JavaScript/TypeScript | `js/different-kinds-comparison-bypass` |
| JavaScript/TypeScript | `js/empty-password-in-configuration-file` |
| JavaScript/TypeScript | `js/user-controlled-data-decompression` |
| JavaScript/TypeScript | `js/user-controlled-bypass-more-sources` |
| Python | `py/hardcoded-credentials` |
| Python | `py/flask-constant-secret-key` |
| Python | `py/improper-ldap-auth` |
| Python | `py/insecure-ldap-auth` |
| Ruby | `rb/user-controlled-bypass` |
| Ruby | `rb/improper-ldap-auth` |
| Ruby | `rb/hardcoded-credentials` |
| Rust | `rust/hard-coded-cryptographic-value` |
| Swift | `swift/constant-password` |
| Swift | `swift/hardcoded-key` |

### CWE-306: Missing Authentication for Critical Function
**Note:** No query is listed under CWE-306 in the CodeQL full CWE coverage index as of the verification date. Related authentication queries under CWE-287 and CWE-798 are not counted as direct mappings for CWE-306. Review authentication requirements for critical functions manually.

### CWE-352: Cross-Site Request Forgery (CSRF)
| Language | Query |
|----------|-------|
| C# | `cs/web/missing-token-validation` |
| Go | `go/constant-oauth2-state` |
| Java/Kotlin | `java/csrf-unprotected-request-type` |
| Java/Kotlin | `java/spring-disabled-csrf-protection` |
| Java/Kotlin | `java/jsonp-injection` |
| JavaScript/TypeScript | `js/missing-token-validation` |
| Python | `py/csrf-protection-disabled` |
| Ruby | `rb/csrf-protection-disabled` |
| Ruby | `rb/csrf-protection-not-enabled` |

### CWE-362: Concurrent Execution using Shared Resource with Improper Synchronization ('Race Condition')
| Language | Query |
|----------|-------|
| GitHub Actions | `actions/untrusted-checkout-toctou/critical` |
| GitHub Actions | `actions/untrusted-checkout-toctou/high` |
| C/C++ | `cpp/toctou-race-condition` |
| C/C++ | `cpp/linux-kernel-double-fetch-vulnerability` |
| C# | `cs/unsafe-sync-on-field` |
| C# | `cs/unsynchronized-static-access` |
| C# | `cs/thread-unsafe-icryptotransform-field-in-class` |
| C# | `cs/thread-unsafe-icryptotransform-captured-in-lambda` |
| Java/Kotlin | `java/toctou-race-condition` |
| Java/Kotlin | `java/socket-auth-race-condition` |
| JavaScript/TypeScript | `js/file-system-race` |

### CWE-416: Use After Free
| Language | Query |
|----------|-------|
| C/C++ | `cpp/use-after-free` |
| C/C++ | `cpp/iterator-to-expired-container` |
| C/C++ | `cpp/use-of-string-after-lifetime-ends` |
| C/C++ | `cpp/use-of-unique-pointer-after-lifetime-ends` |
| C/C++ | `cpp/use-after-expired-lifetime` |

### CWE-434: Unrestricted Upload of File with Dangerous Type
| Language | Query |
|----------|-------|
| C# | `cs/web/file-upload` |
| JavaScript/TypeScript | `js/http-to-file-access` |
| Ruby | `rb/http-to-file-access` |

### CWE-476: NULL Pointer Dereference
| Language | Query |
|----------|-------|
| C/C++ | `cpp/inconsistent-nullness-testing` |
| C/C++ | `cpp/missing-null-test` |
| C/C++ | `cpp/inconsistent-null-check` |
| C/C++ | `cpp/redundant-null-check-simple` |
| C/C++ | `cpp/deref-null-result` |
| C/C++ | `cpp/redundant-null-check-param` |
| C/C++ | `cpp/dangerous-use-of-exception-blocks` |
| C# | `cs/dereferenced-value-is-always-null` |
| C# | `cs/dereferenced-value-may-be-null` |
| Java/Kotlin | `java/dereferenced-value-is-always-null` |
| Java/Kotlin | `java/dereferenced-expr-may-be-null` |
| Java/Kotlin | `java/dereferenced-value-may-be-null` |
| JavaScript/TypeScript | `js/call-to-non-callable` |
| JavaScript/TypeScript | `js/property-access-on-non-object` |
| Rust | `rust/access-invalid-pointer` |

### CWE-502: Deserialization of Untrusted Data
| Language | Query |
|----------|-------|
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

### CWE-787: Out-of-bounds Write
| Language | Query |
|----------|-------|
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

### CWE-798: Use of Hard-coded Credentials
| Language | Query |
|----------|-------|
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

### CWE-862: Missing Authorization
| Language | Query |
|----------|-------|
| C# | `cs/empty-password-in-configuration` |
| C# | `cs/web/missing-function-level-access-control` |
| C# | `cs/web/insecure-direct-object-reference` |
| Java/Kotlin | `java/incorrect-url-verification` |
| JavaScript/TypeScript | `js/cors-misconfiguration-for-credentials` |
| JavaScript/TypeScript | `js/empty-password-in-configuration-file` |
| JavaScript/TypeScript | `js/cors-misconfiguration-for-credentials-more-sources` |

### CWE-863: Incorrect Authorization
| Language | Query |
|----------|-------|
| Java/Kotlin | `java/permissive-dot-regex` |

### CWE-918: Server-Side Request Forgery (SSRF)
| Language | Query |
|----------|-------|
| GitHub Actions | `actions/request-forgery` |
| C# | `cs/request-forgery` |
| Go | `go/request-forgery` |
| Go | `go/ssrf` |
| Java/Kotlin | `java/ssrf` |
| JavaScript/TypeScript | `js/client-side-request-forgery` |
| JavaScript/TypeScript | `js/request-forgery` |
| JavaScript/TypeScript | `javascript/ssrf` |
| JavaScript/TypeScript | `javascript/ssrf-ipv6-transition-incomplete-guard` |
| Python | `py/full-ssrf` |
| Python | `py/partial-ssrf` |
| Ruby | `rb/request-forgery` |
| Rust | `rust/request-forgery` |

---

## Summary Statistics

### CodeQL Query Coverage by SANS Top 25 Rank

Counts reflect the mappings above, not detection effectiveness. A language count is the number of distinct language labels in the index, so Java/Kotlin and JavaScript/TypeScript each count as one, and GitHub Actions counts as one.

| Rank | CWE | Indexed Query IDs | Language Labels |
|------|-----|-------------------|-----------------|
| 1 | CWE-787 (Out-of-bounds Write) | 13 | 2 |
| 2 | CWE-79 (Cross-site Scripting) | 45 | 9 |
| 3 | CWE-89 (SQL Injection) | 16 | 9 |
| 4 | CWE-416 (Use After Free) | 5 | 1 |
| 5 | CWE-78 (OS Command Injection) | 35 | 10 |
| 6 | CWE-20 (Improper Input Validation) | 76 | 10 |
| 7 | CWE-125 (Out-of-bounds Read) | 5 | 2 |
| 8 | CWE-22 (Path Traversal) | 24 | 9 |
| 9 | CWE-352 (CSRF) | 9 | 6 |
| 10 | CWE-434 (Unrestricted Upload) | 3 | 3 |
| 11 | CWE-862 (Missing Authorization) | 7 | 3 |
| 12 | CWE-476 (NULL Pointer Dereference) | 15 | 5 |
| 13 | CWE-287 (Improper Authentication) | 48 | 9 |
| 14 | CWE-190 (Integer Overflow) | 23 | 4 |
| 15 | CWE-502 (Deserialization) | 13 | 5 |
| 16 | CWE-77 (Command Injection) | 42 | 10 |
| 17 | CWE-119 (Buffer Errors) | 42 | 4 |
| 18 | CWE-798 (Hard-coded Credentials) | 15 | 8 |
| 19 | CWE-918 (SSRF) | 13 | 8 |
| 20 | CWE-306 (Missing Authentication) | 0 | 0 |
| 21 | CWE-362 (Race Condition) | 11 | 5 |
| 22 | CWE-269 (Improper Privilege Management) | 6 | 3 |
| 23 | CWE-94 (Code Injection) | 40 | 8 |
| 24 | CWE-863 (Incorrect Authorization) | 1 | 1 |
| 25 | CWE-276 (Incorrect Default Permissions) | 0 | 0 |

### Coverage Overview

- **CWEs with at least one indexed mapping**: 23 out of 25 (92%).
- **CWEs without an indexed mapping**: 2 out of 25 (8%), CWE-276 and CWE-306.
- **CWE/query mappings**: 507, representing 400 unique query IDs. A query can appear under multiple CWEs.

These percentages measure the presence of indexed mappings only, not the percentage of vulnerabilities CodeQL can detect.

### Language Coverage Statistics

**Most Language Labels in the Index** (10 each):
- CWE-20 (Improper Input Validation)
- CWE-77 (Command Injection)
- CWE-78 (OS Command Injection)

**Memory Safety Mappings**:
- CWE-119 (Buffer Errors): C/C++, C#, Go, Rust
- CWE-125 (Out-of-bounds Read): C/C++, Go
- CWE-416 (Use After Free): C/C++
- CWE-787 (Out-of-bounds Write): C/C++, C#

### Notes on Coverage Gaps

1. **CWE-276 (Incorrect Default Permissions)** and **CWE-306 (Missing Authentication)**: The index contains no direct mappings at the verification date. Use configuration reviews and application-specific authentication testing.

2. **CWE-362 (Race Condition)**: Indexed queries detect specific concurrency patterns, not all possible races. Supplement static analysis with dynamic analysis and manual code review.

3. **CWE-269 (Improper Privilege Management)** and **CWE-287 (Improper Authentication)**: Indexed queries address specific patterns. Platform permissions and application-specific authentication logic still require manual assessment.

4. **CWE-862/863 (Authorization Issues)**: Indexed queries do not establish that every endpoint enforces the intended authorization policy. Review access control logic manually.

## Recommendations

1. **Prioritize by Application Risk**: Use the mappings to identify relevant checks, but do not infer comprehensive protection from query counts.

2. **Supplement with Manual Reviews**: Review weaknesses without direct mappings (CWE-276 and CWE-306), and application-specific authorization, authentication, privilege, and concurrency requirements even where queries exist.

3. **Select Relevant Queries**: Review the queries included in your installed packs and selected suite. Consider `security-extended` or `security-and-quality` where appropriate, but do not assume either includes every entry in this full index, particularly experimental, diagnostic, or model-generation queries.

4. **Language-Specific Focus**:
   - For C/C++ applications: Pay special attention to memory safety issues (CWE-119, CWE-125, CWE-416, CWE-787)
   - For Web applications: Focus on injection vulnerabilities (CWE-79, CWE-89, CWE-78) and SSRF (CWE-918)
   - For all applications: Monitor for hard-coded credentials (CWE-798) and deserialization issues (CWE-502)

5. **Continuous Improvement**: Regularly update CodeQL to benefit from new queries and improved detection capabilities.

## References

- [SANS Top 25 Most Dangerous Software Weaknesses](https://www.sans.org/top25-software-errors/)
- [CodeQL Query Help - Full CWE](https://codeql.github.com/codeql-query-help/full-cwe/)
- [CodeQL Documentation](https://codeql.github.com/docs/)
- [CWE - Common Weakness Enumeration](https://cwe.mitre.org/)
- [GitHub Code Scanning Documentation](https://docs.github.com/en/code-security/code-scanning)
