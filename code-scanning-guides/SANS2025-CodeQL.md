# SANS Top 25 Most Dangerous Software Weaknesses to CodeQL Queries Mapping

## Overview
This document provides a mapping between the SANS Top 25 Most Dangerous Software Weaknesses and available CodeQL queries through their Common Weakness Enumeration (CWE) identifiers. The SANS Top 25 represents the most widespread and critical software security weaknesses.

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
| C/C++ | `cpp/badly-bounded-write` |
| C/C++ | `cpp/late-negative-test` |
| C/C++ | `cpp/overflow-calculated` |
| C/C++ | `cpp/uncontrolled-allocation-size` |
| Java | `java/input-resource-leak` |
| JavaScript | `js/incomplete-url-substring-sanitization` |
| JavaScript | `js/incomplete-multi-character-sanitization` |

### CWE-22: Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')
| Language | Query |
|----------|-------|
| C/C++ | `cpp/path-injection` |
| C# | `cs/path-injection` |
| Go | `go/path-injection` |
| Java | `java/path-injection` |
| JavaScript | `js/path-injection` |
| Python | `py/path-injection` |
| Ruby | `rb/path-injection` |
| Swift | `swift/path-injection` |

### CWE-77: Improper Neutralization of Special Elements used in a Command ('Command Injection')
| Language | Query |
|----------|-------|
| C/C++ | `cpp/command-line-injection` |
| C# | `cs/command-line-injection` |
| Go | `go/command-injection` |
| Java | `java/command-line-injection` |
| JavaScript | `js/command-line-injection` |
| Python | `py/command-injection` |
| Ruby | `rb/command-line-injection` |
| Swift | `swift/command-line-injection` |

**Note:** CWE-77 (Command Injection) queries are often covered by CWE-78 (OS Command Injection) queries as they address the same fundamental security issue.

### CWE-78: Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')
| Language | Query |
|----------|-------|
| C/C++ | `cpp/command-line-injection` |
| C# | `cs/command-line-injection` |
| Go | `go/command-injection` |
| Java | `java/command-line-injection` |
| JavaScript | `js/command-line-injection` |
| Python | `py/command-injection` |
| Ruby | `rb/command-line-injection` |
| Swift | `swift/command-line-injection` |

### CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
| Language | Query |
|----------|-------|
| C# | `cs/web/xss` |
| Go | `go/reflected-xss` |
| Go | `go/stored-xss` |
| Java | `java/xss` |
| JavaScript | `js/xss` |
| JavaScript | `js/reflected-xss` |
| JavaScript | `js/stored-xss` |
| JavaScript | `js/xss-through-dom` |
| JavaScript | `js/client-side-unvalidated-url-redirection` |
| Python | `py/reflective-xss` |
| Ruby | `rb/reflected-xss` |
| Ruby | `rb/stored-xss` |
| Swift | `swift/webview-html-injection` |

### CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
| Language | Query |
|----------|-------|
| C/C++ | `cpp/sql-injection` |
| C# | `cs/sql-injection` |
| Go | `go/sql-injection` |
| Java | `java/sql-injection` |
| JavaScript | `js/sql-injection` |
| Python | `py/sql-injection` |
| Ruby | `rb/sql-injection` |
| Swift | `swift/sql-injection` |

### CWE-94: Improper Control of Generation of Code ('Code Injection')
| Language | Query |
|----------|-------|
| C# | `cs/code-injection` |
| Go | `go/unsafe-reflection` |
| Java | `java/code-injection` |
| JavaScript | `js/code-injection` |
| Python | `py/code-injection` |
| Ruby | `rb/code-injection` |
| Swift | `swift/code-injection` |

### CWE-119: Improper Restriction of Operations within the Bounds of a Memory Buffer
| Language | Query |
|----------|-------|
| C/C++ | `cpp/badly-bounded-write` |
| C/C++ | `cpp/overflow-buffer` |
| C/C++ | `cpp/very-likely-overrunning-write` |

### CWE-125: Out-of-bounds Read
| Language | Query |
|----------|-------|
| C/C++ | `cpp/overrunning-write-with-float` |
| C/C++ | `cpp/unclear-array-index-validation` |
| C/C++ | `cpp/unterminated-variadic-call` |

### CWE-190: Integer Overflow or Wraparound
| Language | Query |
|----------|-------|
| C/C++ | `cpp/overflow-calculated` |
| C/C++ | `cpp/overflow-destination` |
| C/C++ | `cpp/tainted-arithmetic` |
| C# | `cs/integer-overflow` |
| Go | `go/allocation-size-overflow` |
| Java | `java/integer-multiplication-cast-to-long` |

### CWE-269: Improper Privilege Management
**Note:** CodeQL does not currently have dedicated queries specifically for CWE-269. However, related authorization and access control issues may be detected through CWE-862 (Missing Authorization) and CWE-863 (Incorrect Authorization) queries.

### CWE-276: Incorrect Default Permissions
**Note:** CodeQL does not currently have dedicated queries specifically for CWE-276. File and resource permission issues are often environment and platform-specific and may require manual security configuration reviews.

### CWE-287: Improper Authentication
| Language | Query |
|----------|-------|
| Java | `java/improper-validation-of-array-construction` |

**Note:** Authentication issues are often application-specific. Additional authentication vulnerabilities may be detected through queries for CWE-306 (Missing Authentication), CWE-798 (Hard-coded Credentials), and related weaknesses.

### CWE-306: Missing Authentication for Critical Function
**Note:** CodeQL does not currently have dedicated queries specifically for CWE-306. However, authentication-related issues may be detected through CWE-287 (Improper Authentication) and CWE-798 (Hard-coded Credentials) queries. Missing authentication is often application-specific and may require manual security reviews.

### CWE-352: Cross-Site Request Forgery (CSRF)
| Language | Query |
|----------|-------|
| C# | `cs/web/missing-token-validation` |
| JavaScript | `js/missing-token-validation` |
| Python | `py/missing-token-validation` |

### CWE-362: Concurrent Execution using Shared Resource with Improper Synchronization ('Race Condition')
**Note:** CodeQL does not currently have dedicated queries specifically for CWE-362. Race conditions and concurrency issues are complex and often require manual code review and dynamic analysis tools. Some related issues may be detected through queries that identify unsafe threading patterns or double-checked locking problems.

### CWE-416: Use After Free
| Language | Query |
|----------|-------|
| C/C++ | `cpp/use-after-free` |

### CWE-434: Unrestricted Upload of File with Dangerous Type
| Language | Query |
|----------|-------|
| C# | `cs/web/file-upload` |
| Go | `go/unsafe-unzip-symlink` |
| Java | `java/file-path-injection` |
| JavaScript | `js/file-access-to-http` |
| Python | `py/file-uploads` |
| Ruby | `rb/file-upload` |

### CWE-476: NULL Pointer Dereference
| Language | Query |
|----------|-------|
| C/C++ | `cpp/null-dereference` |
| C# | `cs/dispose-not-called` |
| Java | `java/non-null-field` |
| Java | `java/non-null-param` |
| Swift | `swift/unsafe-unpacking` |

### CWE-502: Deserialization of Untrusted Data
| Language | Query |
|----------|-------|
| C# | `cs/unsafe-deserialization` |
| C# | `cs/unsafe-deserialization-untrusted-input` |
| Java | `java/unsafe-deserialization` |
| JavaScript | `js/unsafe-deserialization` |
| Python | `py/unsafe-deserialization` |
| Ruby | `rb/unsafe-deserialization` |
| Swift | `swift/unsafe-unpacking` |

### CWE-787: Out-of-bounds Write
| Language | Query |
|----------|-------|
| C/C++ | `cpp/badly-bounded-write` |
| C/C++ | `cpp/overflow-buffer` |
| C/C++ | `cpp/very-likely-overrunning-write` |
| C/C++ | `cpp/overrunning-write` |
| C/C++ | `cpp/overrunning-write-with-float` |

**Note:** CWE-787 (Out-of-bounds Write) is closely related to CWE-119 (Buffer Errors) and uses similar CodeQL queries focused on buffer overflow detection.

### CWE-798: Use of Hard-coded Credentials
| Language | Query |
|----------|-------|
| C# | `cs/hardcoded-credentials` |
| Go | `go/hardcoded-credentials` |
| Java | `java/hardcoded-credential-api-call` |
| JavaScript | `js/hardcoded-credentials` |
| Python | `py/hardcoded-credentials` |
| Ruby | `rb/hardcoded-credentials` |
| Swift | `swift/hardcoded-key` |

### CWE-862: Missing Authorization
| Language | Query |
|----------|-------|
| Java | `java/android-missing-permission-check` |
| JavaScript | `js/missing-origin-check` |

### CWE-863: Incorrect Authorization
**Note:** CodeQL does not currently have dedicated queries specifically for CWE-863. However, authorization issues may be detected through CWE-862 (Missing Authorization) queries and manual security reviews of access control logic.

### CWE-918: Server-Side Request Forgery (SSRF)
| Language | Query |
|----------|-------|
| C# | `cs/web/request-forgery` |
| Go | `go/ssrf` |
| Java | `java/ssrf` |
| JavaScript | `js/request-forgery` |
| Python | `py/ssrf` |
| Ruby | `rb/request-forgery` |
| Swift | `swift/ssrf` |

---

## Summary Statistics

### CodeQL Query Coverage by SANS Top 25 Rank

| Rank | CWE | Coverage Status |
|------|-----|-----------------|
| 1 | CWE-787 (Out-of-bounds Write) | ✅ Covered by buffer overflow queries |
| 2 | CWE-79 (Cross-site Scripting) | ✅ Comprehensive coverage across 8 languages |
| 3 | CWE-89 (SQL Injection) | ✅ Comprehensive coverage across 8 languages |
| 4 | CWE-416 (Use After Free) | ✅ Covered for C/C++ |
| 5 | CWE-78 (OS Command Injection) | ✅ Comprehensive coverage across 8 languages |
| 6 | CWE-20 (Improper Input Validation) | ✅ Covered across multiple languages |
| 7 | CWE-125 (Out-of-bounds Read) | ✅ Covered for C/C++ |
| 8 | CWE-22 (Path Traversal) | ✅ Comprehensive coverage across 8 languages |
| 9 | CWE-352 (CSRF) | ✅ Covered across 3 languages |
| 10 | CWE-434 (Unrestricted Upload) | ✅ Covered across 6 languages |
| 11 | CWE-862 (Missing Authorization) | ⚠️ Limited coverage (Java, JavaScript) |
| 12 | CWE-476 (NULL Pointer Dereference) | ✅ Covered across 5 languages |
| 13 | CWE-287 (Improper Authentication) | ⚠️ Limited coverage |
| 14 | CWE-190 (Integer Overflow) | ✅ Covered across 6 languages |
| 15 | CWE-502 (Deserialization) | ✅ Comprehensive coverage across 7 languages |
| 16 | CWE-77 (Command Injection) | ✅ Covered by OS Command Injection queries |
| 17 | CWE-119 (Buffer Errors) | ✅ Covered for C/C++ |
| 18 | CWE-798 (Hard-coded Credentials) | ✅ Comprehensive coverage across 7 languages |
| 19 | CWE-918 (SSRF) | ✅ Comprehensive coverage across 7 languages |
| 20 | CWE-306 (Missing Authentication) | ⚠️ Limited/indirect coverage |
| 21 | CWE-362 (Race Condition) | ❌ No dedicated queries available |
| 22 | CWE-269 (Improper Privilege Management) | ❌ No dedicated queries available |
| 23 | CWE-94 (Code Injection) | ✅ Comprehensive coverage across 7 languages |
| 24 | CWE-863 (Incorrect Authorization) | ⚠️ Limited/indirect coverage |
| 25 | CWE-276 (Incorrect Default Permissions) | ❌ No dedicated queries available |

### Coverage Overview

- **✅ Comprehensive Coverage**: 17 out of 25 CWEs (68%)
- **⚠️ Limited Coverage**: 5 out of 25 CWEs (20%)
- **❌ No Dedicated Queries**: 3 out of 25 CWEs (12%)

### Language Coverage Statistics

**Most Comprehensive Language Support** (8 languages):
- CWE-22 (Path Traversal)
- CWE-78/77 (Command Injection)
- CWE-79 (Cross-site Scripting)
- CWE-89 (SQL Injection)

**C/C++ Focus** (Memory Safety):
- CWE-119 (Buffer Errors)
- CWE-125 (Out-of-bounds Read)
- CWE-416 (Use After Free)
- CWE-787 (Out-of-bounds Write)

### Notes on Coverage Gaps

1. **CWE-362 (Race Condition)**: Race conditions and concurrency issues are inherently difficult to detect with static analysis. Dynamic analysis and manual code review are recommended.

2. **CWE-269 (Improper Privilege Management)** and **CWE-276 (Incorrect Default Permissions)**: These issues are often platform and environment-specific, requiring configuration reviews and manual security assessments.

3. **CWE-287/306 (Authentication Issues)**: Authentication logic is highly application-specific. CodeQL can detect some authentication weaknesses (like hard-coded credentials), but comprehensive authentication testing requires manual security reviews and penetration testing.

4. **CWE-862/863 (Authorization Issues)**: Authorization logic is application-specific and challenging to analyze statically. Manual security reviews are essential for comprehensive authorization testing.

## Recommendations

1. **Prioritize High-Coverage Weaknesses**: Focus code scanning efforts on the 17 CWEs with comprehensive CodeQL coverage, as these represent 68% of the SANS Top 25.

2. **Supplement with Manual Reviews**: For CWEs with limited or no query coverage (especially CWE-269, CWE-276, CWE-287, CWE-306, CWE-362, CWE-862, CWE-863), conduct manual security reviews and penetration testing.

3. **Enable All Relevant Queries**: Ensure your CodeQL configuration includes all security queries for the languages used in your codebase. Use the `security-extended` or `security-and-quality` query suites for maximum coverage.

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
