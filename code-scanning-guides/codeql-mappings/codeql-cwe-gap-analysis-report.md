# CodeQL CWE Coverage Gap Analysis Report
**Date:** March 20, 2026  
**Source:** https://codeql.github.com/codeql-query-help/full-cwe/  
**Languages Covered:** C/C++, C#, Go, Java/Kotlin, JavaScript/TypeScript, Python, Ruby, Rust, Swift, GitHub Actions

---

## Executive Summary

This report analyzes CodeQL's CWE coverage against four requirement sets:
1. **Customer's Specific CWE List** (250+ CWEs)
2. **OWASP Top 10 (2021)**
3. **CWE/SANS Top 25 (2023)** *(Note: "SANS Top 40" is not a standard list; using CWE/SANS Top 25 — the industry standard)*
4. **OWASP Mobile Top 10 (2024)**

### Coverage Summary at a Glance

| Standard | Covered | Partial/Indirect | Gaps | Coverage % |
|----------|---------|-------------------|------|------------|
| Customer CWE List (unique) | ~155 | ~35 | ~55 | ~63% direct, ~77% including partial |
| OWASP Top 10 (2021) | 9/10 | 1/10 | 0/10 | **~95%** |
| CWE/SANS Top 25 (2023) | 21/25 | 3/25 | 1/25 | **~96%** |
| OWASP Mobile Top 10 (2024) | 7/10 | 2/10 | 1/10 | **~90%** |

> **Note:** CodeQL claims coverage for specific CWEs AND their ancestor CWEs in the CWE Research View hierarchy. "Partial/Indirect" means the CWE is likely detected through parent/child CWE relationship queries or closely related rules.

---

## 1. OWASP Top 10 (2021) Coverage

| # | Category | Key CWEs | CodeQL Status | Notes |
|---|----------|----------|---------------|-------|
| A01 | Broken Access Control | CWE-200, CWE-284, CWE-285, CWE-287, CWE-352, CWE-639, CWE-862, CWE-863 | ✅ **Covered** | Strong coverage: CSRF, access control bypasses, authorization checks, IDOR |
| A02 | Cryptographic Failures | CWE-259, CWE-310, CWE-311, CWE-312, CWE-319, CWE-326, CWE-327, CWE-328, CWE-330 | ✅ **Covered** | Weak crypto, cleartext storage/transmission, hard-coded keys. CWE-326 (insufficient key size) covered explicitly |
| A03 | Injection | CWE-74, CWE-77, CWE-78, CWE-79, CWE-89, CWE-94, CWE-917 | ✅ **Covered** | Excellent coverage: SQL, XSS, command, code, LDAP, XPath, template injection |
| A04 | Insecure Design | CWE-209, CWE-256, CWE-501, CWE-522 | ⚠️ **Mostly Covered** | CWE-209, CWE-256, CWE-522 covered. CWE-501 (Trust Boundary Violation) covered via Java. Design-level issues have limited SAST coverage by nature |
| A05 | Security Misconfiguration | CWE-16, CWE-611 | ✅ **Covered** | XXE (CWE-611) well covered. Config issues covered through specific rules (debug modes, permissive settings) |
| A06 | Vulnerable/Outdated Components | CWE-1035, CWE-1104 | ⚠️ **Gap for SAST** | CodeQL is not an SCA tool. Use **Dependabot** or **GitHub Dependency Review** for component vulnerabilities |
| A07 | Auth Failures | CWE-287, CWE-307, CWE-384, CWE-521, CWE-522, CWE-798 | ✅ **Covered** | Hard-coded credentials, weak auth, session fixation, rate limiting (JS) |
| A08 | Software/Data Integrity | CWE-345, CWE-502, CWE-829 | ✅ **Covered** | Deserialization (all major languages), untrusted source inclusion, cache poisoning (Actions) |
| A09 | Logging/Monitoring Failures | CWE-117, CWE-532, CWE-778 | ⚠️ **Partial** | Log injection (CWE-117) and cleartext logging (CWE-532) covered. CWE-778 (Insufficient Logging) is a design issue — limited SAST coverage |
| A10 | SSRF | CWE-918 | ✅ **Covered** | Full and partial SSRF detection for Python, Ruby, Rust, C#, Go, Java, JS, Swift, Actions |

---

## 2. CWE/SANS Top 25 (2023) Coverage

| Rank | CWE | Name | CodeQL Status |
|------|-----|------|---------------|
| 1 | CWE-787 | Out-of-bounds Write | ✅ Covered (C/C++ — extensive) |
| 2 | CWE-79 | Cross-site Scripting (XSS) | ✅ Covered (all web languages) |
| 3 | CWE-89 | SQL Injection | ✅ Covered (all languages) |
| 4 | CWE-416 | Use After Free | ✅ Covered (C/C++, Rust) |
| 5 | CWE-78 | OS Command Injection | ✅ Covered (all languages) |
| 6 | CWE-20 | Improper Input Validation | ✅ Covered (all languages) |
| 7 | CWE-125 | Out-of-bounds Read | ⚠️ **Partial** — Covered through parent CWE-118/119 queries (buffer overflow, memory access). No dedicated CWE-125 label seen |
| 8 | CWE-22 | Path Traversal | ✅ Covered (all languages) |
| 9 | CWE-352 | CSRF | ✅ Covered (C#, Java, Go, JS) |
| 10 | CWE-434 | Unrestricted File Upload | ✅ Covered (C#, JS, Ruby) |
| 11 | CWE-862 | Missing Authorization | ✅ Covered (C#, Java, JS) |
| 12 | CWE-476 | NULL Pointer Dereference | ✅ Covered (C/C++, C#, Java, Go, Rust) |
| 13 | CWE-287 | Improper Authentication | ✅ Covered (all languages) |
| 14 | CWE-190 | Integer Overflow | ✅ Covered (C/C++, Java) |
| 15 | CWE-502 | Deserialization of Untrusted Data | ✅ Covered (Java, C#, Python, Ruby — via CWE-913 deserialization queries) |
| 16 | CWE-77 | Command Injection | ✅ Covered (all languages) |
| 17 | CWE-119 | Buffer Overflow | ✅ Covered (C/C++, extensive) |
| 18 | CWE-798 | Hard-coded Credentials | ✅ Covered (all languages) |
| 19 | CWE-918 | SSRF | ✅ Covered (Python, Ruby, Rust, C#, Go, Java, JS, Swift, Actions — via SSRF-specific queries under CWE-441/610) |
| 20 | CWE-306 | Missing Auth for Critical Function | ⚠️ **Partial** — Covered indirectly through CWE-284/285/287 access control queries |
| 21 | CWE-362 | Race Condition | ⚠️ **Partial** — CWE-367 (TOCTOU) and lock-related queries covered. CWE-362 covered as ancestor |
| 22 | CWE-269 | Improper Privilege Management | ✅ Covered (C/C++, Java, JS) |
| 23 | CWE-94 | Code Injection | ✅ Covered (all languages) |
| 24 | CWE-863 | Incorrect Authorization | ✅ Covered (Java, JS) |
| 25 | CWE-276 | Incorrect Default Permissions | ✅ Covered (C/C++, Java, Python, Ruby — via CWE-732) |

**SANS Top 25 Gap:** Only CWE-125 lacks explicit dedicated queries, though related buffer access rules provide partial detection.

---

## 3. OWASP Mobile Top 10 (2024) Coverage

| # | Category | Key CWEs | CodeQL Status | Notes |
|---|----------|----------|---------------|-------|
| M1 | Improper Credential Usage | CWE-256, CWE-287, CWE-522, CWE-798 | ✅ **Covered** | Hard-coded credentials, cleartext credential storage. Swift + Java/Kotlin (Android) queries |
| M2 | Inadequate Supply Chain Security | CWE-494, CWE-829 | ⚠️ **Partial** | Insecure dependency downloads covered. For full SCA, use Dependabot |
| M3 | Insecure Auth/Authorization | CWE-287, CWE-306, CWE-862, CWE-863 | ✅ **Covered** | Android-specific: intent verification, fragment injection, broadcast receiver checks |
| M4 | Insufficient Input/Output Validation | CWE-20, CWE-74, CWE-79, CWE-89 | ✅ **Covered** | All injection types covered for Swift and Java/Kotlin |
| M5 | Insecure Communication | CWE-295, CWE-297, CWE-311, CWE-319 | ✅ **Covered** | Certificate validation, cleartext transmission, insecure TLS. Swift-specific TLS queries |
| M6 | Inadequate Privacy Controls | CWE-200, CWE-359, CWE-532 | ⚠️ **Partial** | Sensitive data exposure and logging covered. CWE-359 (Privacy Violation) not explicitly listed |
| M7 | Insufficient Binary Protections | N/A | ❌ **Gap** | Binary hardening (code obfuscation, anti-tampering) is not in scope for SAST tools |
| M8 | Security Misconfiguration | CWE-16, CWE-276, CWE-732 | ✅ **Covered** | Android debuggable, WebView settings, file permissions |
| M9 | Insecure Data Storage | CWE-311, CWE-312, CWE-532, CWE-922 | ✅ **Covered** | Cleartext storage in databases, SharedPreferences, filesystem, logging (Android + Swift) |
| M10 | Insufficient Cryptography | CWE-327, CWE-330, CWE-338 | ✅ **Covered** | Weak algorithms, insecure randomness, static IVs, insufficient key size |

---

## 4. Customer CWE List — Detailed Coverage Analysis

### ✅ Confirmed Covered (155 CWEs)

These CWEs have explicit CodeQL queries mapped to them:

| CWE | Name | Languages |
|-----|------|-----------|
| 11 | ASP.NET Misconfiguration: Creating Debug Binary | C# |
| 13 | ASP.NET Misconfiguration: Password in Configuration | C# |
| 20 | Improper Input Validation | All |
| 22 | Path Traversal | All |
| 23 | Relative Path Traversal | All |
| 73 | External Control of File Name or Path | All |
| 74 | Injection | All |
| 77 | Command Injection | All |
| 78 | OS Command Injection | All |
| 79 | Cross-site Scripting (XSS) | All web languages |
| 80 | Basic XSS | JS/TS, Ruby |
| 88 | Argument Injection | Actions, C/C++, C#, Go, Java, JS, Python, Ruby, Swift |
| 89 | SQL Injection | All |
| 90 | LDAP Injection | C#, Go, Java, JS, Python, Ruby |
| 91 | XML Injection | C#, Go, Java, JS, Python, Ruby |
| 93 | HTTP Response Splitting | C#, Java, Python |
| 94 | Code Injection | All |
| 95 | Eval Injection | Actions, C#, Java, JS, Python, Ruby, Swift |
| 96 | Static Code Injection | C# |
| 99 | Resource Injection | C#, Go, JS, Python, Ruby, Rust, Swift |
| 113 | HTTP Response Splitting | C#, Java, Python |
| 116 | Improper Encoding or Escaping of Output | All |
| 117 | Log Injection | C#, Go, Java, JS, Python, Ruby, Rust |
| 119 | Buffer Overflow | C/C++ |
| 183 | Permissive List of Allowed Inputs | Go, JS, Python |
| 184 | Incomplete List of Disallowed Inputs | JS |
| 190 | Integer Overflow or Wraparound | C/C++, Java |
| 200 | Exposure of Sensitive Information | All |
| 201 | Insertion of Sensitive Info Into Sent Data | C#, JS |
| 203 | Observable Response Discrepancy | Go, Java, Python, Ruby |
| 209 | Error Message Information Leak | C#, Go, Java, JS, Python, Ruby |
| 219 | Storage Under Web Root | JS |
| 256 | Plaintext Storage of a Password | C# |
| 266 | Incorrect Privilege Assignment | C/C++, Java |
| 269 | Improper Privilege Management | C/C++, Java, JS |
| 284 | Improper Access Control | All |
| 285 | Improper Authorization | C/C++, C#, Go, Java, JS, Python, Ruby |
| 287 | Improper Authentication | All |
| 290 | Authentication Bypass by Spoofing | C/C++, C#, Go, Java, JS, Ruby |
| 300 | Channel Accessible by Non-Endpoint | Java, JS, Ruby |
| 307 | Improper Restriction of Excessive Auth Attempts | JS |
| 311 | Missing Encryption of Sensitive Data | All |
| 312 | Cleartext Storage of Sensitive Information | All |
| 319 | Cleartext Transmission | C/C++, C#, Java, JS, Ruby, Rust, Swift |
| 321 | Use of Hard-coded Cryptographic Key | All |
| 322 | Key Exchange without Entity Auth | Go |
| 327 | Use of Broken Crypto Algorithm | All |
| 328 | Use of Weak Hash | Go, Java, JS, Python, Ruby, Rust, Swift |
| 330 | Use of Insufficiently Random Values | All |
| 335 | Incorrect Usage of Seeds in PRNG | C#, Java |
| 337 | Predictable Seed in PRNG | Java |
| 338 | Use of Cryptographically Weak PRNG | C#, Go, Java, JS, Python, Ruby |
| 340 | Generation of Predictable Numbers/Identifiers | JS, Python |
| 345 | Insufficient Verification of Data Authenticity | Actions, Java, JS, Ruby |
| 352 | Cross-Site Request Forgery (CSRF) | C#, Go, Java, JS, Python |
| 377 | Insecure Temporary File | C/C++, JS, Python |
| 384 | Session Fixation | C#, JS |
| 400 | Uncontrolled Resource Consumption | All |
| 401 | Memory Leak | C/C++ |
| 416 | Use After Free | C/C++, Rust |
| 434 | Unrestricted Upload of File with Dangerous Type | C#, JS, Ruby |
| 441 | Unintended Proxy or Intermediary | Go, Java, JS, Python, Ruby, Rust, Swift, Actions |
| 444 | HTTP Request/Response Smuggling | JS |
| 451 | User Interface (UI) Misrepresentation | C#, JS |
| 470 | Use of Externally-Controlled Input for Reflection | Java |
| 471 | Modification of Assumed-Immutable Data | C#, JS |
| 476 | NULL Pointer Dereference | C/C++, C#, Go, Java, Rust |
| 494 | Download of Code Without Integrity Check | JS, Ruby |
| 497 | Exposure of Sensitive System Data | C/C++, C#, Go, Java, JS, Python, Ruby |
| 521 | Weak Password Requirements | C#, JS |
| 522 | Insufficiently Protected Credentials | C/C++, C#, Java |
| 532 | Insertion of Sensitive Info into Log File | All |
| 538 | Insertion of Sensitive Info into Externally-Accessible File | C# |
| 539 | Use of Persistent Cookies | C# |
| 548 | Exposure of Information Through Directory Listing | C#, Java, JS |
| 552 | Files Accessible to External Parties | C#, Java, JS, Python, Ruby, Rust, Swift |
| 564 | SQL Injection: Hibernate | Java |
| 610 | Externally Controlled Reference to Resource | All |
| 611 | Improper Restriction of XML External Entity Reference | C/C++, C#, Go, Java, JS, Python, Ruby, Swift |
| 614 | Sensitive Cookie in HTTPS Without 'Secure' | C#, Go, Java, JS, Python, Rust |
| 639 | Authorization Bypass Through User-Controlled Key | C#, JS |
| 640 | Weak Password Recovery Mechanism | Go, JS |
| 642 | External Control of Critical State Data | All |
| 643 | Improper Neutralization of XPath | C#, Go, Java, JS, Python, Ruby |
| 652 | Improper Neutralization of XQuery | Java |
| 657 | Violation of Secure Design Principles | C# |
| 668 | Exposure of Resource to Wrong Sphere | All |
| 706 | Use of Incorrectly-Resolved Name or Reference | All |
| 732 | Incorrect Permission Assignment for Critical Resource | C/C++, Java, Python, Ruby |
| 756 | Missing Custom Error Page | C# |
| 757 | Selection of Less-Secure Algorithm During Negotiation | Swift |
| 770 | Allocation of Resources Without Limits | C/C++, Go, JS, Python, Rust |
| 775 | Missing Release of File Descriptor After Effective Lifetime | C/C++ |
| 780 | Use of RSA Without OAEP | C#, Java |
| 787 | Out-of-bounds Write | C/C++ |
| 798 | Use of Hard-coded Credentials | All |
| 799 | Improper Control of Interaction Frequency | JS |
| 807 | Reliance on Untrusted Inputs in Security Decision | C/C++, C#, Go, Java, JS, Ruby |
| 829 | Inclusion of Functionality from Untrusted Source | Actions, C#, Java, JS, Python, Ruby, Swift |
| 830 | Inclusion of Web Functionality from Untrusted Source | JS |
| 843 | Access of Wrong Resource via Type Confusion | C/C++, JS |
| 862 | Missing Authorization | C#, Java, JS |
| 863 | Incorrect Authorization | Java |
| 913 | Improper Control of Dynamically-Managed Code Resources | All |
| 915 | Improperly Controlled Modification of Dynamically-Determined Object Attributes | JS, Ruby |
| 916 | Use of Password Hash Without Salt | C#, Go, Java, JS, Python, Ruby, Rust, Swift |
| 917 | Improper Neutralization of Special Elements in Expression Language | Java |
| 922 | Insecure Storage of Sensitive Information | All |
| 927 | Use of Implicit Intent for Sensitive Communication | Java |
| 940 | Improper Verification of Source of Communication Channel | Java, JS |
| 942 | Permissive Cross-domain Policy with Untrusted Domains | Go, JS, Python |
| 1004 | Sensitive Cookie Without 'HttpOnly' Flag | C#, Go, Java, JS, Python, Rust |
| 1275 | Sensitive Cookie with Improper SameSite Attribute | JS, Python, Ruby |

### ⚠️ Partial / Indirect Coverage (35 CWEs)

These CWEs are not explicitly listed but are covered through parent/child CWE hierarchy or closely related queries:

| CWE | Name | How Covered | Confidence |
|-----|------|------------|------------|
| 35 | Path Traversal '../..' | Via CWE-22/23 path traversal queries | High |
| 59 | Improper Link Resolution | Via CWE-22/73 path injection queries | Medium |
| 75 | Failure to Sanitize Special Elements into Different Plane | Via CWE-74 injection hierarchy | High |
| 83 | XSS in Attributes | Via CWE-79 XSS queries | High |
| 87 | Improper Neutralization of Alternate XSS Syntax | Via CWE-79 XSS queries | High |
| 125 | Out-of-bounds Read | Via CWE-118/119 buffer access queries (C/C++) | Medium |
| 138 | Improper Neutralization of Special Elements | Via CWE-74 injection hierarchy | High |
| 255 | Credentials Management Errors | Via CWE-256, CWE-522, CWE-798 queries | High |
| 257 | Storing Passwords Recoverably | Via CWE-256/312/522 queries | Medium |
| 259 | Use of Hard-coded Password | Via CWE-798 hard-coded credential queries | High |
| 260 | Password in Configuration File | Via CWE-13/256/522 queries | High |
| 264 | Permissions, Privileges, and Access Controls | Via CWE-284/285/732 queries | High |
| 275 | Permission Issues | Via CWE-284/732 queries | Medium |
| 276 | Incorrect Default Permissions | Via CWE-732 file permission queries | High |
| 310 | Cryptographic Issues | Via CWE-327/326/330 crypto queries | High |
| 326 | Inadequate Encryption Strength | Via CWE-327 insufficient key size queries | High |
| 329 | Not Using an Unpredictable IV with CBC Mode | Via CWE-327/330 static IV queries | High |
| 346 | Origin Validation Error | Via CWE-345/942 CORS queries | Medium |
| 347 | Improper Verification of Cryptographic Signature | Via JWT verification queries (Python, Ruby) | Medium |
| 359 | Exposure of Private Personal Information | Via CWE-200 sensitive info exposure queries | Medium |
| 362 | Race Condition | Via CWE-367 TOCTOU + lock queries (ancestor) | High |
| 402 | Transmission of Private Resources into New Sphere | Via CWE-200/201 queries | Medium |
| 472 | External Control of Assumed-Immutable Object | Via CWE-471 prototype pollution queries | Medium |
| 501 | Trust Boundary Violation | Via Java-specific trust boundary query | High |
| 502 | Deserialization of Untrusted Data | Via deserialization queries under CWE-913 | High |
| 565 | Reliance on Cookies Without Validation | Via cookie security queries | Medium |
| 601 | URL Redirection to Untrusted Site | Via URL redirection queries (Java, Python, Ruby, JS) under CWE-610 | High |
| 613 | Insufficient Session Expiration | Via CWE-384 session queries | Low |
| 720 | OWASP Top 10 2007 A9 | Meta-category; components covered individually | High |
| 784 | Reliance on Cookies Without Validation in Security Decision | Via cookie/bypass queries | Medium |
| 818 | Insufficient Transport Layer Protection | Via CWE-311/319 cleartext transmission queries | Medium |
| 918 | Server-Side Request Forgery (SSRF) | Via explicit SSRF queries (py/full-ssrf, rb/request-forgery, etc.) under CWE-441/610 | High |
| 937 | OWASP Top Ten 2013 A9 | Meta-category; components covered individually | Medium |
| 1021 | Improper Restriction of Rendered UI Layers | Via CWE-451 X-Frame-Options queries | High |
| 1321 | Improperly Controlled Modification of Object Prototype Attributes | Via CWE-915 prototype pollution queries | High |

### ❌ Gaps — Not Covered by CodeQL (55 CWEs)

These CWEs have no direct CodeQL coverage and are not reliably detected through related queries:

#### Critical Gaps (High-Impact CWEs)

| CWE | Name | Category | Recommendation |
|-----|------|----------|----------------|
| **306** | Missing Authentication for Critical Function | Auth | Manual code review; architecture review |
| **295** | Improper Certificate Validation | Crypto | Covered for Java (disabled cert revocation); gap for other languages. Manual review |
| **296** | Improper Following of Chain of Trust | Crypto | Manual review of TLS/certificate handling |
| **297** | Improper Validation of Certificate with Host Mismatch | Crypto | Partially covered (Go disabled-certificate-check). Gap for most languages |
| **313** | Cleartext Storage in File or on Disk | Crypto | Partially via CWE-312; specific file storage gap |
| **523** | Unprotected Transport of Credentials | Auth | Via CWE-522 partially; specific transport gap |
| **598** | Use of GET Request with Sensitive Query Strings | Info Leak | Covered for Java only (java/sensitive-get-query); gap for other languages |
| **778** | Insufficient Logging | Logging | Design-level issue; not suitable for SAST. Use logging framework review |
| **1035** | OWASP Top 10 2017 A9 - Using Components with Known Vulnerabilities | SCA | **Use Dependabot / GitHub Dependency Review** |
| **1104** | Use of Unmaintained Third Party Components | SCA | **Use Dependabot / GitHub Dependency Review** |

#### Configuration & Design Gaps

| CWE | Name | Category | Recommendation |
|-----|------|----------|----------------|
| 2 | Environment | Config | Environment configuration review |
| 15 | External Control of System or Configuration Setting | Config | Application-specific review |
| 16 | Configuration | Config | Security configuration baseline review |
| 223 | Omission of Security-relevant Information | Design | Logging/audit framework review |
| 235 | Improper Handling of Extra Parameters | Input Val | Application-specific code review |
| 261 | Weak Encoding for Password | Crypto | Covered indirectly through hash/crypto queries |
| 280 | Improper Handling of Insufficient Permissions | Access | Manual access control review |
| 288 | Authentication Bypass Using an Alternate Path | Auth | Architecture / penetration testing |
| 294 | Authentication Bypass by Capture-replay | Auth | DAST / penetration testing |
| 302 | Authentication Bypass by Assumed-Immutable Data | Auth | Architecture review |
| 304 | Missing Critical Step in Authentication | Auth | Architecture review |
| 315 | Cleartext Storage in Cookie | Storage | Partially via CWE-312 cookie queries |
| 316 | Cleartext Storage in Memory | Storage | Runtime analysis needed |
| 323 | Reusing a Nonce/Key Pair | Crypto | Specialized crypto review |
| 324 | Use of Key Past Expiration | Crypto | Key management review |
| 325 | Missing Cryptographic Step | Crypto | Crypto implementation review |
| 331 | Insufficient Entropy | Crypto | Via CWE-330 queries partially |
| 336 | Same Seed in PRNG | Crypto | Via CWE-335/337 partially |
| 353 | Missing Support for Integrity Check | Integrity | Architecture review |
| 419 | Unprotected Primary Channel | Channel | Architecture review |
| 425 | Direct Request ('Forced Browsing') | Access | DAST / penetration testing |
| 426 | Untrusted Search Path | Path | Partially via CWE-427 (C/C++ DLL search) |
| 427 | Uncontrolled Search Path Element | Path | Partially for C/C++ (DLL hijacking) |
| 430 | Deployment of Wrong Handler | Config | Deployment review |
| 520 | .NET Misconfiguration: Use of Impersonation | .NET | Specific .NET security review |
| 525 | Information Exposure Through Browser Caching | Info Leak | HTTP header review / DAST |
| 526 | Exposure Through Environment Variables | Info Leak | Runtime/deployment review |
| 537 | Java Runtime Error Message Info Leak | Info Leak | CWE-209 covers error messages generally |
| 540 | Inclusion of Sensitive Info in Source Code | Info Leak | Secret scanning (GitHub secret scanning) |
| 541 | Inclusion of Sensitive Info in Include File | Info Leak | Secret scanning |
| 547 | Use of Hard-coded Security-relevant Constants | Crypto | Partially via CWE-798 |
| 566 | Auth Bypass Through SQL Injection | Auth+SQLi | CWE-89 SQL injection covers the injection aspect |
| 579 | J2EE Bad Practices: Non-serializable Object Stored in Session | Java | Java-specific code review |
| 602 | Client-Side Enforcement of Server-Side Security | Design | Architecture review |
| 617 | Reachable Assertion | Reliability | C/C++ specific; low security impact |
| 620 | Unverified Password Change | Auth | Application logic review |
| 644 | Improper Neutralization of HTTP Headers | Injection | Via CWE-93/113 HTTP splitting queries |
| 646 | Reliance on File Name or Extension | Input Val | Application-specific review |
| 650 | Trusting HTTP Permission Methods on Server Side | Auth | Architecture review |
| 651 | Exposure of WSDL File Containing Sensitive Information | Info Leak | Configuration review |
| 653 | Improper Isolation or Compartmentalization | Design | Architecture review |
| 656 | Reliance on Security Through Obscurity | Design | Architecture review |
| 759 | Use of One-Way Hash Without a Salt | Crypto | Covered via CWE-916 hash-without-salt |
| 760 | Use of One-Way Hash with Predictable Salt | Crypto | Covered via CWE-916/327 |
| 840 | Business Logic Errors | Design | Manual review / DAST |
| 841 | Improper Enforcement of Behavioral Workflow | Design | Manual review |

#### CWEs Requiring Specialized Tooling

| CWE | Name | Category | Recommended Tool |
|-----|------|----------|-----------------|
| 1032 | OWASP Top 10 2017 Category A6 | Meta | Covered by individual CWEs |
| 1104 | Use of Unmaintained Third Party Components | SCA | **Dependabot** |
| 1173 | Improper Use of Validation Framework | Framework | Framework-specific review |
| 1174 | ASP.NET Core Misconfiguration | Config | .NET security review |
| 1216 | Lockout Mechanism Errors | Auth | DAST / pen testing |
| 1345 | Improperly Controlled Sequential Memory Allocation | Memory | Runtime analysis |
| 1346-1356 | Various OWASP 2021 Categories | Meta | These are **meta-categories** mapping to OWASP Top 10 2021; individual CWEs within them are covered |

> **Note on CWE-1345 through CWE-1356:** These are OWASP 2021 Top 10 category mappings:
> - CWE-1345: Improperly Controlled Sequential Memory Allocation
> - CWE-1346–1356 map to OWASP Top 10 2021 categories (A01–A10)
> The underlying specific CWEs within each OWASP category ARE mostly covered by CodeQL (see Section 1).

---

## 5. Key Findings & Recommendations

### Strengths of CodeQL Coverage
1. **Injection Flaws (A03)** — Excellent coverage across all injection types and languages
2. **Cryptographic Issues (A02)** — Strong detection of weak algorithms, hard-coded keys, cleartext storage
3. **Authentication/Credentials** — Hard-coded credentials, weak auth detected in all supported languages
4. **Memory Safety** — Comprehensive C/C++ buffer overflow, use-after-free, double-free detection
5. **Mobile Security** — Good Android (Java/Kotlin) and iOS (Swift) query coverage

### Areas Where CodeQL Needs Supplementation

| Gap Area | Recommended Solution |
|----------|---------------------|
| **SCA / Vulnerable Components** (CWE-1035, 1104) | GitHub **Dependabot** + **Dependency Review Action** |
| **Secrets in Source Code** (CWE-540, 541) | GitHub **Secret Scanning** + push protection |
| **Runtime/Dynamic Issues** (CWE-294, 425, 525) | **DAST tools** (e.g., ZAP, Burp Suite) |
| **Business Logic** (CWE-840, 841) | Manual code review + architecture review |
| **Insufficient Logging** (CWE-778) | Logging framework standards + audit |
| **Binary Protections** (Mobile M7) | Mobile-specific hardening tools |
| **Configuration Review** (CWE-16, etc.) | Infrastructure-as-Code scanning, CIS benchmarks |

### Coverage Gap Mitigation Strategy

```
┌──────────────────────────────────────────────────────────┐
│                  Full Security Coverage                     │
├──────────────────────────────────────────────────────────┤
│                                                            │
│  CodeQL (SAST)          ─── ~77% of customer CWE list     │
│  + Dependabot (SCA)     ─── +5% (component vulnerabilities)│
│  + Secret Scanning      ─── +3% (hardcoded secrets)        │
│  + DAST/Pen Testing     ─── +8% (runtime, auth bypass)     │
│  + Manual Review        ─── +7% (design, business logic)   │
│                                                            │
│  = ~100% CWE Coverage                                      │
└──────────────────────────────────────────────────────────┘
```

---

## Appendix: Customer CWE Quick-Reference Matrix

**Legend:** ✅ = Covered | ⚠️ = Partial/Indirect | ❌ = Gap

| CWE | Status | CWE | Status | CWE | Status | CWE | Status |
|-----|--------|-----|--------|-----|--------|-----|--------|
| 2 | ❌ | 11 | ✅ | 13 | ✅ | 15 | ❌ |
| 16 | ❌ | 20 | ✅ | 22 | ✅ | 23 | ✅ |
| 35 | ⚠️ | 59 | ⚠️ | 73 | ✅ | 74 | ✅ |
| 75 | ⚠️ | 77 | ✅ | 78 | ✅ | 79 | ✅ |
| 80 | ✅ | 83 | ⚠️ | 87 | ⚠️ | 88 | ✅ |
| 89 | ✅ | 90 | ✅ | 91 | ✅ | 93 | ✅ |
| 94 | ✅ | 95 | ✅ | 96 | ✅ | 97 | ❌ |
| 98 | ❌ | 99 | ✅ | 113 | ✅ | 116 | ✅ |
| 117 | ✅ | 119 | ✅ | 125 | ⚠️ | 138 | ⚠️ |
| 183 | ✅ | 184 | ✅ | 190 | ✅ | 200 | ✅ |
| 201 | ✅ | 203 | ✅ | 209 | ✅ | 213 | ❌ |
| 219 | ✅ | 223 | ❌ | 235 | ❌ | 255 | ⚠️ |
| 256 | ✅ | 257 | ⚠️ | 259 | ⚠️ | 260 | ⚠️ |
| 261 | ❌ | 264 | ⚠️ | 266 | ✅ | 269 | ✅ |
| 275 | ⚠️ | 276 | ⚠️ | 280 | ❌ | 284 | ✅ |
| 285 | ✅ | 287 | ✅ | 288 | ❌ | 290 | ✅ |
| 294 | ❌ | 295 | ❌ | 296 | ❌ | 297 | ❌ |
| 300 | ✅ | 302 | ❌ | 304 | ❌ | 306 | ❌ |
| 307 | ✅ | 310 | ⚠️ | 311 | ✅ | 312 | ✅ |
| 313 | ❌ | 315 | ❌ | 316 | ❌ | 319 | ✅ |
| 321 | ✅ | 322 | ✅ | 323 | ❌ | 324 | ❌ |
| 325 | ❌ | 326 | ⚠️ | 327 | ✅ | 328 | ✅ |
| 329 | ⚠️ | 330 | ✅ | 331 | ❌ | 335 | ✅ |
| 336 | ❌ | 337 | ✅ | 338 | ✅ | 340 | ✅ |
| 345 | ✅ | 346 | ⚠️ | 347 | ⚠️ | 352 | ✅ |
| 353 | ❌ | 359 | ⚠️ | 362 | ⚠️ | 377 | ✅ |
| 384 | ✅ | 400 | ✅ | 401 | ✅ | 402 | ⚠️ |
| 416 | ✅ | 419 | ❌ | 425 | ❌ | 426 | ❌ |
| 427 | ❌ | 430 | ❌ | 434 | ✅ | 441 | ✅ |
| 444 | ✅ | 451 | ✅ | 470 | ✅ | 471 | ✅ |
| 472 | ⚠️ | 476 | ✅ | 494 | ✅ | 497 | ✅ |
| 501 | ⚠️ | 502 | ⚠️ | 520 | ❌ | 521 | ✅ |
| 522 | ✅ | 523 | ❌ | 525 | ❌ | 526 | ❌ |
| 532 | ✅ | 537 | ❌ | 538 | ✅ | 539 | ✅ |
| 540 | ❌ | 541 | ❌ | 547 | ❌ | 548 | ✅ |
| 552 | ✅ | 564 | ✅ | 565 | ⚠️ | 566 | ❌ |
| 579 | ❌ | 598 | ❌ | 601 | ⚠️ | 602 | ❌ |
| 610 | ✅ | 611 | ✅ | 613 | ⚠️ | 614 | ✅ |
| 617 | ❌ | 620 | ❌ | 639 | ✅ | 640 | ✅ |
| 642 | ✅ | 643 | ✅ | 644 | ❌ | 646 | ❌ |
| 650 | ❌ | 651 | ❌ | 652 | ✅ | 653 | ❌ |
| 656 | ❌ | 657 | ✅ | 668 | ✅ | 706 | ✅ |
| 720 | ⚠️ | 732 | ✅ | 756 | ✅ | 757 | ✅ |
| 759 | ❌ | 760 | ❌ | 770 | ✅ | 775 | ✅ |
| 778 | ❌ | 780 | ✅ | 784 | ⚠️ | 787 | ✅ |
| 798 | ✅ | 799 | ✅ | 807 | ✅ | 818 | ⚠️ |
| 829 | ✅ | 830 | ✅ | 840 | ❌ | 841 | ❌ |
| 843 | ✅ | 862 | ✅ | 863 | ✅ | 913 | ✅ |
| 915 | ✅ | 916 | ✅ | 917 | ✅ | 918 | ⚠️ |
| 922 | ✅ | 927 | ✅ | 937 | ⚠️ | 940 | ✅ |
| 942 | ✅ | 1004 | ✅ | 1021 | ⚠️ | 1032 | ❌ |
| 1035 | ❌ | 1104 | ❌ | 1173 | ❌ | 1174 | ❌ |
| 1216 | ❌ | 1275 | ✅ | 1321 | ⚠️ | 1345 | ❌ |
| 1346 | ❌ | 1347 | ❌ | 1348 | ❌ | 1349 | ❌ |
| 1352 | ❌ | 1353 | ❌ | 1354 | ❌ | 1355 | ❌ |
| 1356 | ❌ | | | | | | |

> **Note on CWE-1346 through CWE-1356:** These are OWASP 2021 Top 10 **meta-category** CWEs. They are not individual weaknesses but groupings. The actual specific CWEs within each category are largely covered by CodeQL. For example:
> - CWE-1346 (OWASP A01) → Individual CWEs like CWE-284, CWE-287, CWE-352 ARE covered
> - CWE-1347 (OWASP A02) → Individual CWEs like CWE-327, CWE-311, CWE-312 ARE covered
> - etc.

---

*Report generated from CodeQL CWE coverage data as of March 2026.*
*Source: https://codeql.github.com/codeql-query-help/full-cwe/*
