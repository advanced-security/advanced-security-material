# OWASP Top 10 2025 to CodeQL Queries Mapping

## Overview
This document provides a mapping between the OWASP Top 10 2025 vulnerabilities and available CodeQL queries through their Common Weakness Enumeration (CWE) identifiers.

## Complete CWE List per OWASP Top 10 2025 Category

### A01:2025 – Broken Access Control (34 CWEs)
- CWE-22: Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')
- CWE-23: Relative Path Traversal
- CWE-35: Path Traversal: '.../...//'
- CWE-36: Absolute Path Traversal
- CWE-59: Improper Link Resolution Before File Access ('Link Following')
- CWE-200: Exposure of Sensitive Information to an Unauthorized Actor
- CWE-201: Insertion of Sensitive Information Into Sent Data
- CWE-219: Storage of File with Sensitive Data Under Web Root
- CWE-264: Permissions, Privileges, and Access Controls (Category)
- CWE-275: Permission Issues
- CWE-276: Incorrect Default Permissions
- CWE-284: Improper Access Control
- CWE-285: Improper Authorization
- CWE-352: Cross-Site Request Forgery (CSRF)
- CWE-359: Exposure of Private Personal Information to an Unauthorized Actor
- CWE-377: Insecure Temporary File
- CWE-402: Transmission of Private Resources into a New Sphere ('Resource Leak')
- CWE-425: Direct Request ('Forced Browsing')
- CWE-441: Unintended Proxy or Intermediary ('Confused Deputy')
- CWE-497: Exposure of Sensitive System Information to an Unauthorized Control Sphere
- CWE-538: Insertion of Sensitive Information into Externally-Accessible File or Directory
- CWE-540: Inclusion of Sensitive Information in Source Code
- CWE-548: Exposure of Information Through Directory Listing
- CWE-552: Files or Directories Accessible to External Parties
- CWE-566: Authorization Bypass Through User-Controlled SQL Primary Key
- CWE-601: URL Redirection to Untrusted Site ('Open Redirect')
- CWE-639: Authorization Bypass Through User-Controlled Key
- CWE-651: Exposure of WSDL File Containing Sensitive Information
- CWE-668: Exposure of Resource to Wrong Sphere
- CWE-706: Use of Incorrectly-Resolved Name or Reference
- CWE-862: Missing Authorization
- CWE-863: Incorrect Authorization
- CWE-913: Improper Control of Dynamically-Managed Code Resources
- CWE-922: Insecure Storage of Sensitive Information

### A02:2025 – Security Misconfiguration (27 CWEs)
- CWE-2: Environmental Security Flaws (Category)
- CWE-11: ASP.NET Misconfiguration: Creating Debug Binary
- CWE-13: ASP.NET Misconfiguration: Password in Configuration File
- CWE-15: External Control of System or Configuration Setting
- CWE-16: Configuration
- CWE-260: Password in Configuration File
- CWE-315: Cleartext Storage of Sensitive Information in a Cookie
- CWE-319: Cleartext Transmission of Sensitive Information
- CWE-520: .NET Misconfiguration: Use of Impersonation
- CWE-526: Exposure of Sensitive Information Through Environmental Variables
- CWE-537: Java Runtime Error Message Containing Sensitive Information
- CWE-541: Inclusion of Sensitive Information in an Include File
- CWE-547: Use of Hard-coded, Security-relevant Constants
- CWE-598: Use of GET Request Method with Sensitive Query Strings
- CWE-611: Improper Restriction of XML External Entity Reference
- CWE-614: Sensitive Cookie in HTTPS Session Without 'Secure' Attribute
- CWE-615: Inclusion of Sensitive Information in Source Code Comments
- CWE-656: Reliance on Security Through Obscurity
- CWE-693: Protection Mechanism Failure
- CWE-756: Missing Custom Error Page
- CWE-776: Improper Restriction of Recursive Entity References in DTDs ('XML Entity Expansion')
- CWE-918: Server-Side Request Forgery (SSRF)
- CWE-942: Permissive Cross-domain Policy with Untrusted Domains
- CWE-1004: Sensitive Cookie Without 'HttpOnly' Flag
- CWE-1032: OWASP Top Ten 2017 Category A6 - Security Misconfiguration
- CWE-1174: ASP.NET Misconfiguration: Improper Model Validation
- CWE-1176: Inefficient CPU Computation

### A03:2025 – Software Supply Chain Failures (7 CWEs)
- CWE-494: Download of Code Without Integrity Check
- CWE-502: Deserialization of Untrusted Data
- CWE-506: Embedded Malicious Code
- CWE-507: Trojan Horse
- CWE-669: Incorrect Resource Transfer Between Spheres
- CWE-829: Inclusion of Functionality from Untrusted Control Sphere
- CWE-830: Inclusion of Web Functionality from an Untrusted Source

### A04:2025 – Cryptographic Failures (31 CWEs)
- CWE-256: Plaintext Storage of a Password
- CWE-257: Storing Passwords in a Recoverable Format
- CWE-261: Weak Encoding for Password
- CWE-296: Improper Following of a Certificate's Chain of Trust
- CWE-306: Missing Authentication for Critical Function
- CWE-310: Cryptographic Issues (Category)
- CWE-311: Missing Encryption of Sensitive Data
- CWE-312: Cleartext Storage of Sensitive Information
- CWE-313: Cleartext Storage in a File or on Disk
- CWE-314: Cleartext Storage in the Registry
- CWE-316: Cleartext Storage of Sensitive Information in Memory
- CWE-317: Cleartext Storage of Sensitive Information in GUI
- CWE-318: Cleartext Storage of Sensitive Information in Executable
- CWE-319: Cleartext Transmission of Sensitive Information
- CWE-321: Use of Hard-coded Cryptographic Key
- CWE-322: Key Exchange without Entity Authentication
- CWE-323: Reusing a Nonce, Key Pair in Encryption
- CWE-324: Use of a Key Past its Expiration Date
- CWE-325: Missing Cryptographic Step
- CWE-326: Inadequate Encryption Strength
- CWE-327: Use of a Broken or Risky Cryptographic Algorithm
- CWE-328: Use of Weak Hash
- CWE-329: Generation of Predictable IV with CBC Mode
- CWE-330: Use of Insufficiently Random Values
- CWE-331: Insufficient Entropy
- CWE-335: Incorrect Usage of Seeds in Pseudo-Random Number Generator (PRNG)
- CWE-336: Same Seed in Pseudo-Random Number Generator (PRNG)
- CWE-337: Predictable Seed in Pseudo-Random Number Generator (PRNG)
- CWE-338: Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)
- CWE-522: Insufficiently Protected Credentials
- CWE-523: Unprotected Transport of Credentials

### A05:2025 – Injection (32 CWEs)
- CWE-20: Improper Input Validation
- CWE-74: Improper Neutralization of Special Elements in Output Used by a Downstream Component ('Injection')
- CWE-75: Failure to Sanitize Special Elements into a Different Plane (Special Element Injection)
- CWE-77: Improper Neutralization of Special Elements used in a Command ('Command Injection')
- CWE-78: Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')
- CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
- CWE-80: Improper Neutralization of Script-Related HTML in a Basic Crosssite Scripting
- CWE-83: Improper Neutralization of Script in Attributes in a Web Page
- CWE-87: Improper Neutralization of Alternate XSS Syntax
- CWE-88: Improper Neutralization of Argument Delimiters in a Command ('Argument Injection')
- CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
- CWE-90: Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')
- CWE-91: XML Injection (aka Blind XPath Injection)
- CWE-93: Improper Neutralization of CRLF Sequences ('CRLF Injection')
- CWE-94: Improper Control of Generation of Code ('Code Injection')
- CWE-95: Improper Neutralization of Directives in Dynamically Evaluated Code ('Eval Injection')
- CWE-96: Improper Neutralization of Directives in Statically Saved Code ('Static Code Injection')
- CWE-97: Improper Neutralization of Server-Side Includes (SSI) Within a Web Page
- CWE-98: Improper Control of Filename for Include/Require Statement in PHP Program ('PHP Remote File Inclusion')
- CWE-99: Improper Control of Resource Identifiers ('Resource Injection')
- CWE-100: Deprecated: Technology-Specific Input Validation Issues
- CWE-113: Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Request/Response Splitting')
- CWE-116: Improper Encoding or Escaping of Output
- CWE-138: Improper Neutralization of Special Elements
- CWE-184: Incomplete List of Disallowed Inputs
- CWE-470: Use of Externally-Controlled Input to Select Classes or Code ('Unsafe Reflection')
- CWE-471: Modification of Assumed-Immutable Data (MAID)
- CWE-564: SQL Injection: Hibernate
- CWE-610: Externally Controlled Reference to a Resource in Another Sphere
- CWE-643: Improper Neutralization of Data within XPath Expressions ('XPath Injection')
- CWE-644: Improper Neutralization of HTTP Headers for Scripting Syntax
- CWE-652: Improper Neutralization of Data within XQuery Expressions ('XQuery Injection')

### A06:2025 – Insecure Design (24 CWEs)
- CWE-73: External Control of File Name or Path
- CWE-183: Permissive List of Allowed Inputs
- CWE-209: Generation of Error Message Containing Sensitive Information
- CWE-213: Exposure of Sensitive Information Due to Incompatible Policies
- CWE-235: Improper Handling of Extra Parameters
- CWE-256: Plaintext Storage of a Password
- CWE-257: Storing Passwords in a Recoverable Format
- CWE-266: Incorrect Privilege Assignment
- CWE-269: Improper Privilege Management
- CWE-280: Improper Handling of Insufficient Permissions or Privileges
- CWE-311: Missing Encryption of Sensitive Data
- CWE-312: Cleartext Storage of Sensitive Information
- CWE-313: Cleartext Storage in a File or on Disk
- CWE-316: Cleartext Storage of Sensitive Information in Memory
- CWE-419: Unprotected Primary Channel
- CWE-430: Deployment of Wrong Handler
- CWE-434: Unrestricted Upload of File with Dangerous Type
- CWE-444: Inconsistent Interpretation of HTTP Requests ('HTTP Request/Response Smuggling')
- CWE-451: User Interface (UI) Misrepresentation of Critical Information
- CWE-472: External Control of Assumed-Immutable Web Parameter
- CWE-501: Trust Boundary Violation
- CWE-522: Insufficiently Protected Credentials
- CWE-525: Use of Web Browser Cache Containing Sensitive Information
- CWE-539: Use of Persistent Cookies Containing Sensitive Information

### A07:2025 – Authentication Failures (18 CWEs)
- CWE-255: Credentials Management Errors
- CWE-259: Use of Hard-coded Password
- CWE-287: Improper Authentication
- CWE-288: Authentication Bypass Using an Alternate Path or Channel
- CWE-290: Authentication Bypass by Spoofing
- CWE-294: Authentication Bypass by Capture-replay
- CWE-295: Improper Certificate Validation
- CWE-297: Improper Validation of Certificate with Host Mismatch
- CWE-300: Channel Accessible by Non-Endpoint
- CWE-302: Authentication Bypass by Assumed-Immutable Data
- CWE-304: Missing Critical Step in Authentication
- CWE-307: Improper Restriction of Excessive Authentication Attempts
- CWE-308: Use of Single-factor Authentication
- CWE-309: Use of Password System for Primary Authentication
- CWE-346: Origin Validation Error
- CWE-384: Session Fixation
- CWE-521: Weak Password Requirements
- CWE-613: Insufficient Session Expiration

### A08:2025 – Software or Data Integrity Failures (15 CWEs)
- CWE-345: Insufficient Verification of Data Authenticity
- CWE-346: Origin Validation Error
- CWE-347: Improper Verification of Cryptographic Signature
- CWE-353: Missing Support for Integrity Check
- CWE-354: Improper Validation of Integrity Check Value
- CWE-426: Untrusted Search Path
- CWE-427: Uncontrolled Search Path Element
- CWE-494: Download of Code Without Integrity Check
- CWE-502: Deserialization of Untrusted Data
- CWE-565: Reliance on Cookies without Validation and Integrity Checking
- CWE-784: Reliance on Cookies without Validation and Integrity Checking in a Security Decision
- CWE-829: Inclusion of Functionality from Untrusted Control Sphere
- CWE-830: Inclusion of Web Functionality from an Untrusted Source
- CWE-913: Improper Control of Dynamically-Managed Code Resources
- CWE-915: Improperly Controlled Modification of Dynamically-Determined Object Attributes

### A09:2025 – Security Logging and Alerting Failures (11 CWEs)
- CWE-117: Improper Output Neutralization for Logs
- CWE-223: Omission of Security-relevant Information
- CWE-224: Obscured Security-relevant Information by Alternate Name
- CWE-532: Insertion of Sensitive Information into Log File
- CWE-539: Use of Persistent Cookies Containing Sensitive Information
- CWE-778: Insufficient Logging
- CWE-779: Logging of Excessive Data
- CWE-1021: Improper Restriction of Rendered UI Layers or Frames
- CWE-1295: Debug Messages Revealing Unnecessary Information
- CWE-1300: Improper Protection of Physical Side Channels
- CWE-1035: OWASP Top Ten 2017 Category A10 - Insufficient Logging & Monitoring

### A10:2025 – Mishandling of Exceptional Conditions (38 CWEs)
- CWE-119: Improper Restriction of Operations within the Bounds of a Memory Buffer
- CWE-120: Buffer Copy without Checking Size of Input ('Classic Buffer Overflow')
- CWE-125: Out-of-bounds Read
- CWE-129: Improper Validation of Array Index
- CWE-190: Integer Overflow or Wraparound
- CWE-191: Integer Underflow (Wrap or Wraparound)
- CWE-193: Off-by-one Error
- CWE-194: Unexpected Sign Extension
- CWE-195: Signed to Unsigned Conversion Error
- CWE-196: Unsigned to Signed Conversion Error
- CWE-197: Numeric Truncation Error
- CWE-228: Improper Handling of Syntactically Invalid Structure
- CWE-229: Improper Handling of Values
- CWE-230: Improper Handling of Missing Values
- CWE-232: Improper Handling of Undefined Values
- CWE-233: Improper Handling of Parameters
- CWE-234: Failure to Handle Missing Parameter
- CWE-235: Improper Handling of Extra Parameters
- CWE-236: Improper Handling of Undefined Parameters
- CWE-237: Improper Handling of Structural Elements
- CWE-238: Improper Handling of Incomplete Structural Elements
- CWE-239: Failure to Handle Incomplete Element
- CWE-240: Improper Handling of Inconsistent Structural Elements
- CWE-241: Improper Handling of Unexpected Data Type
- CWE-248: Uncaught Exception
- CWE-252: Unchecked Return Value
- CWE-253: Incorrect Check of Function Return Value
- CWE-391: Unchecked Error Condition
- CWE-392: Missing Report of Error Condition
- CWE-393: Return of Wrong Status Code
- CWE-394: Unexpected Status Code or Return Value
- CWE-395: Use of NullPointerException Catch to Detect NULL Pointer Dereference
- CWE-396: Declaration of Catch for Generic Exception
- CWE-397: Declaration of Throws for Generic Exception
- CWE-476: NULL Pointer Dereference
- CWE-600: Uncaught Exception in Servlet
- CWE-754: Improper Check for Unusual or Exceptional Conditions
- CWE-755: Improper Handling of Exceptional Conditions

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

### CWE-22: Path Traversal
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

### CWE-73: External Control of File Name or Path
| Language | Query |
|----------|-------|
| JavaScript | `js/path-injection` |
| Swift | `swift/path-injection` |

### CWE-74: Injection
| Language | Query |
|----------|-------|
| JavaScript | `js/template-object-injection` |

### CWE-78: OS Command Injection
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

### CWE-79: Cross-site Scripting (XSS)
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

### CWE-88: Argument Injection
| Language | Query |
|----------|-------|
| Python | `py/command-injection` |
| Ruby | `rb/command-line-injection` |

### CWE-89: SQL Injection
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

### CWE-90: LDAP Injection
| Language | Query |
|----------|-------|
| C# | `cs/ldap-injection` |
| Go | `go/ldap-injection` |
| Java | `java/ldap-injection` |
| JavaScript | `js/ldap-injection` |
| Python | `py/ldap-injection` |
| Ruby | `rb/ldap-injection` |

### CWE-94: Code Injection
| Language | Query |
|----------|-------|
| C# | `cs/code-injection` |
| Go | `go/unsafe-reflection` |
| Java | `java/code-injection` |
| JavaScript | `js/code-injection` |
| Python | `py/code-injection` |
| Ruby | `rb/code-injection` |
| Swift | `swift/code-injection` |

### CWE-113: HTTP Response Splitting
| Language | Query |
|----------|-------|
| C# | `cs/web/header-injection` |
| Java | `java/http-response-splitting` |
| JavaScript | `js/http-response-splitting` |

### CWE-116: Improper Encoding or Escaping of Output
| Language | Query |
|----------|-------|
| JavaScript | `js/bad-tag-filter` |
| JavaScript | `js/html-constructed-from-input` |

### CWE-117: Log Injection
| Language | Query |
|----------|-------|
| C# | `cs/log-forging` |
| Go | `go/log-injection` |
| Java | `java/log-injection` |
| JavaScript | `js/log-injection` |
| Python | `py/log-injection` |
| Ruby | `rb/log-injection` |
| Swift | `swift/log-injection` |

### CWE-119: Buffer Errors
| Language | Query |
|----------|-------|
| C/C++ | `cpp/badly-bounded-write` |
| C/C++ | `cpp/overflow-buffer` |
| C/C++ | `cpp/very-likely-overrunning-write` |

### CWE-120: Buffer Overflow
| Language | Query |
|----------|-------|
| C/C++ | `cpp/overflow-buffer` |
| C/C++ | `cpp/badly-bounded-write` |
| C/C++ | `cpp/overrunning-write` |
| C/C++ | `cpp/unbounded-write` |
| C/C++ | `cpp/very-likely-overrunning-write` |

### CWE-125: Out-of-bounds Read
| Language | Query |
|----------|-------|
| C/C++ | `cpp/overrunning-write-with-float` |
| C/C++ | `cpp/unclear-array-index-validation` |
| C/C++ | `cpp/unterminated-variadic-call` |

### CWE-129: Improper Validation of Array Index
| Language | Query |
|----------|-------|
| Java | `java/index-out-of-bounds` |

### CWE-134: Uncontrolled Format String
| Language | Query |
|----------|-------|
| C/C++ | `cpp/tainted-format-string` |
| C/C++ | `cpp/non-constant-format` |
| Swift | `swift/string-format-injection` |

### CWE-190: Integer Overflow
| Language | Query |
|----------|-------|
| C/C++ | `cpp/overflow-calculated` |
| C/C++ | `cpp/overflow-destination` |
| C/C++ | `cpp/tainted-arithmetic` |
| C# | `cs/integer-overflow` |
| Go | `go/allocation-size-overflow` |
| Java | `java/integer-multiplication-cast-to-long` |

### CWE-191: Integer Underflow
| Language | Query |
|----------|-------|
| C/C++ | `cpp/unsigned-difference-expression-compared-zero` |

### CWE-193: Off-by-one Error
| Language | Query |
|----------|-------|
| Java | `java/index-out-of-bounds` |

### CWE-197: Numeric Truncation Error
| Language | Query |
|----------|-------|
| C/C++ | `cpp/integer-multiplication-cast-to-long` |

### CWE-200: Information Exposure
| Language | Query |
|----------|-------|
| Go | `go/clear-text-logging` |
| Java | `java/android-intent-redirection` |
| JavaScript | `js/actions/actions-artifact-leak` |

### CWE-201: Information Exposure Through Sent Data
| Language | Query |
|----------|-------|
| JavaScript | `js/server-crash` |
| JavaScript | `js/sensitive-actions-get-request` |
| Python | `py/stack-trace-exposure` |
| Swift | `swift/cleartext-transmission` |

### CWE-209: Error Message Information Leak
| Language | Query |
|----------|-------|
| C# | `cs/information-exposure-through-exception` |
| Go | `go/stack-trace-exposure` |
| Java | `java/stack-trace-exposure` |
| JavaScript | `js/stack-trace-exposure` |
| Python | `py/stack-trace-exposure` |
| Ruby | `rb/stack-trace-exposure` |

### CWE-248: Uncaught Exception
| Language | Query |
|----------|-------|
| Java | `java/uncaught-number-format-exception` |
| Java | `java/uncaught-servlet-exception` |

### CWE-252: Unchecked Return Value
| Language | Query |
|----------|-------|
| C/C++ | `cpp/missing-check-scanf` |
| C# | `cs/unchecked-return-value` |
| Python | `py/ignored-return-value` |

### CWE-256: Plaintext Storage of Password
| Language | Query |
|----------|-------|
| C# | `cs/password-in-configuration` |
| JavaScript | `js/password-in-configuration-file` |
| Swift | `swift/cleartext-storage-preferences` |

### CWE-259: Hard-coded Password
| Language | Query |
|----------|-------|
| C# | `cs/hardcoded-credentials` |
| Go | `go/hardcoded-credentials` |
| Java | `java/hardcoded-credential-api-call` |
| Java | `java/hardcoded-credential-comparison` |
| Java | `java/hardcoded-credential-sensitive-call` |
| Java | `java/hardcoded-password-field` |
| JavaScript | `js/hardcoded-credentials` |
| Python | `py/hardcoded-credentials` |
| Ruby | `rb/hardcoded-credentials` |
| Swift | `swift/hardcoded-key` |

### CWE-287: Improper Authentication
| Language | Query |
|----------|-------|
| Java | `java/improper-validation-of-array-construction` |

### CWE-290: Authentication Bypass by Spoofing
| Language | Query |
|----------|-------|
| C/C++ | `cpp/world-writable-file-creation` |

### CWE-295: Improper Certificate Validation
| Language | Query |
|----------|-------|
| Go | `go/disabled-certificate-check` |
| Java | `java/insecure-trustmanager` |
| JavaScript | `js/disabling-certificate-validation` |
| Python | `py/insecure-default-protocol` |
| Ruby | `rb/insecure-http-request` |

### CWE-307: Improper Restriction of Excessive Authentication Attempts
| Language | Query |
|----------|-------|
| JavaScript | `js/missing-rate-limiting` |

### CWE-311: Missing Encryption
| Language | Query |
|----------|-------|
| C/C++ | `cpp/cleartext-storage-file` |
| Swift | `swift/cleartext-storage-database` |
| Swift | `swift/cleartext-storage-preferences` |

### CWE-312: Cleartext Storage of Sensitive Information
| Language | Query |
|----------|-------|
| C/C++ | `cpp/cleartext-storage-buffer` |
| C# | `cs/cleartext-storage-of-sensitive-information` |
| Go | `go/clear-text-logging` |
| Java | `java/android-cleartext-storage` |
| JavaScript | `js/clear-text-cookie` |
| JavaScript | `js/clear-text-storage-of-sensitive-data` |
| Python | `py/clear-text-logging-sensitive-data` |
| Python | `py/clear-text-storage-sensitive-data` |
| Swift | `swift/cleartext-logging` |
| Swift | `swift/cleartext-storage-preferences` |

### CWE-319: Cleartext Transmission
| Language | Query |
|----------|-------|
| Go | `go/email-injection` |
| Java | `java/cleartext-storage-in-cookie` |
| Java | `java/insecure-smtp` |
| JavaScript | `js/clear-text-cookie` |
| Python | `py/insecure-protocol` |
| Ruby | `rb/insecure-http` |
| Swift | `swift/cleartext-transmission` |

### CWE-321: Hard-coded Cryptographic Key
| Language | Query |
|----------|-------|
| C# | `cs/hardcoded-credentials` |
| Go | `go/hardcoded-credentials` |
| Java | `java/hardcoded-credential-api-call` |
| JavaScript | `js/hardcoded-credentials` |
| Python | `py/hardcoded-credentials` |
| Ruby | `rb/hardcoded-credentials` |
| Swift | `swift/hardcoded-key` |

### CWE-326: Inadequate Encryption Strength
| Language | Query |
|----------|-------|
| C/C++ | `cpp/weak-crypto/insufficient-key-size` |
| C# | `cs/insufficient-key-size` |
| Java | `java/insufficient-key-size` |
| JavaScript | `js/insufficient-key-size` |
| Python | `py/insufficient-key-size` |

### CWE-327: Broken Crypto Algorithm
| Language | Query |
|----------|-------|
| C/C++ | `cpp/weak-crypto/broken-crypto` |
| C# | `cs/weak-crypto` |
| Go | `go/weak-crypto` |
| Java | `java/weak-cryptographic-algorithm` |
| JavaScript | `js/weak-cryptographic-algorithm` |
| Python | `py/weak-cryptographic-algorithm` |
| Ruby | `rb/weak-cryptographic-algorithm` |
| Swift | `swift/weak-password-hashing` |

### CWE-328: Weak Hash
| Language | Query |
|----------|-------|
| C/C++ | `cpp/weak-crypto/weak-hash` |

### CWE-329: Predictable IV
| Language | Query |
|----------|-------|
| Java | `java/non-cryptographic-prng` |

### CWE-330: Use of Insufficiently Random Values
| Language | Query |
|----------|-------|
| C# | `cs/random-used-once` |
| Go | `go/insecure-randomness` |
| Java | `java/insecure-randomness` |
| JavaScript | `js/insecure-randomness` |
| Python | `py/insecure-randomness` |
| Ruby | `rb/insecure-randomness` |

### CWE-335: PRNG Seed Error
| Language | Query |
|----------|-------|
| Java | `java/random-used-once` |

### CWE-338: Weak PRNG
| Language | Query |
|----------|-------|
| C/C++ | `cpp/weak-crypto/weak-prng` |
| C# | `cs/insecure-randomness` |
| Go | `go/insecure-randomness` |
| Java | `java/predictable-seed` |
| JavaScript | `js/insecure-randomness` |
| Python | `py/insecure-randomness` |
| Ruby | `rb/insecure-randomness` |

### CWE-346: Origin Validation Error
| Language | Query |
|----------|-------|
| JavaScript | `js/cors-misconfiguration` |
| Python | `py/cors-misconfiguration` |

### CWE-347: Improper Verification of Cryptographic Signature
| Language | Query |
|----------|-------|
| JavaScript | `js/jwt-missing-verification` |
| Ruby | `rb/jwt-missing-verification` |

### CWE-352: CSRF
| Language | Query |
|----------|-------|
| C# | `cs/web/missing-token-validation` |
| JavaScript | `js/missing-token-validation` |
| Python | `py/missing-token-validation` |

### CWE-367: TOCTOU
| Language | Query |
|----------|-------|
| C/C++ | `cpp/toctou-race-condition` |
| Go | `go/file-access-toctou` |

### CWE-377: Insecure Temporary File
| Language | Query |
|----------|-------|
| C# | `cs/insecure-temporary-file` |
| Java | `java/insecure-temporary-file` |
| JavaScript | `js/insecure-temporary-file` |

### CWE-384: Session Fixation
| Language | Query |
|----------|-------|
| JavaScript | `js/session-fixation` |

### CWE-391: Unchecked Error Condition
| Language | Query |
|----------|-------|
| Java | `java/ignored-error-status-of-call` |

### CWE-400: Resource Consumption
| Language | Query |
|----------|-------|
| C# | `cs/regex-injection` |
| Go | `go/uncontrolled-allocation-size` |
| Java | `java/polynomial-redos` |
| JavaScript | `js/polynomial-redos` |
| JavaScript | `js/redos` |
| Python | `py/polynomial-redos` |
| Python | `py/redos` |
| Ruby | `rb/polynomial-redos` |
| Ruby | `rb/redos` |

### CWE-401: Memory Leak
| Language | Query |
|----------|-------|
| C/C++ | `cpp/memory-leak` |
| C/C++ | `cpp/memory-may-not-be-freed` |
| C/C++ | `cpp/memory-never-freed` |
| C/C++ | `cpp/new-free-mismatch` |

### CWE-404: Improper Resource Shutdown
| Language | Query |
|----------|-------|
| C/C++ | `cpp/descriptor-may-not-be-closed` |
| C/C++ | `cpp/descriptor-never-closed` |
| C/C++ | `cpp/file-may-not-be-closed` |
| C/C++ | `cpp/file-never-closed` |

### CWE-416: Use After Free
| Language | Query |
|----------|-------|
| C/C++ | `cpp/use-after-free` |

### CWE-426: Untrusted Search Path
| Language | Query |
|----------|-------|
| C/C++ | `cpp/untrusted-data-to-external-api` |

### CWE-434: Unrestricted Upload
| Language | Query |
|----------|-------|
| C# | `cs/web/file-upload` |
| Go | `go/unsafe-unzip-symlink` |
| Java | `java/file-path-injection` |
| JavaScript | `js/file-access-to-http` |
| Python | `py/file-uploads` |
| Ruby | `rb/file-upload` |

### CWE-444: HTTP Request Smuggling
| Language | Query |
|----------|-------|
| JavaScript | `js/http-request-smuggling` |

### CWE-451: UI Misrepresentation
| Language | Query |
|----------|-------|
| JavaScript | `js/ui-redress` |

### CWE-457: Use of Uninitialized Variable
| Language | Query |
|----------|-------|
| C/C++ | `cpp/uninitialized-local` |

### CWE-470: Unsafe Reflection
| Language | Query |
|----------|-------|
| Go | `go/unsafe-reflection` |
| Java | `java/expression-injection` |

### CWE-471: Modification of Assumed-Immutable Data
| Language | Query |
|----------|-------|
| JavaScript | `js/prototype-pollution` |

### CWE-476: NULL Pointer Dereference
| Language | Query |
|----------|-------|
| C/C++ | `cpp/null-dereference` |
| C# | `cs/dispose-not-called` |
| Java | `java/non-null-field` |
| Java | `java/non-null-param` |
| Swift | `swift/unsafe-unpacking` |

### CWE-489: Leftover Debug Code
| Language | Query |
|----------|-------|
| JavaScript | `js/angular-debug-enabled` |

### CWE-497: Exposure of System Information
| Language | Query |
|----------|-------|
| C/C++ | `cpp/system-data-exposure` |

### CWE-501: Trust Boundary Violation
| Language | Query |
|----------|-------|
| Java | `java/trust-boundary-violation` |

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

### CWE-506: Embedded Malicious Code
| Language | Query |
|----------|-------|
| JavaScript | `js/actions/pull-request-target` |
| JavaScript | `js/hardcoded-data-interpreted-as-code` |

### CWE-522: Insufficiently Protected Credentials
| Language | Query |
|----------|-------|
| C# | `cs/password-in-configuration` |
| Go | `go/hardcoded-credentials` |
| Java | `java/android-intent-redirection` |
| JavaScript | `js/password-in-configuration-file` |
| Python | `py/paramiko-not-verify-host-key` |
| Ruby | `rb/hardcoded-credentials` |

### CWE-532: Information in Log Files
| Language | Query |
|----------|-------|
| Go | `go/clear-text-logging` |
| Swift | `swift/cleartext-logging` |

### CWE-552: Files Accessible to External Parties
| Language | Query |
|----------|-------|
| JavaScript | `js/exposure-of-private-files` |

### CWE-597: Wrong Operator in String Comparison
| Language | Query |
|----------|-------|
| C/C++ | `cpp/string-comparison-bypass` |

### CWE-601: URL Redirection
| Language | Query |
|----------|-------|
| C# | `cs/web/unvalidated-url-redirection` |
| Go | `go/unvalidated-url-redirection` |
| Java | `java/unvalidated-url-redirection` |
| JavaScript | `js/server-side-unvalidated-url-redirection` |
| Python | `py/url-redirection` |
| Ruby | `rb/unvalidated-url-redirection` |
| Swift | `swift/unvalidated-url-redirection` |

### CWE-610: Externally Controlled Reference
| Language | Query |
|----------|-------|
| Java | `java/android-arbitrary-file-access` |

### CWE-611: XXE
| Language | Query |
|----------|-------|
| C# | `cs/xml/insecure-dtd-processing` |
| C# | `cs/xml/xpath-injection` |
| Go | `go/xxe` |
| Java | `java/xxe` |
| JavaScript | `js/xxe` |
| Python | `py/xxe` |
| Ruby | `rb/xxe` |
| Swift | `swift/xxe` |

### CWE-614: Sensitive Cookie Without Secure
| Language | Query |
|----------|-------|
| C# | `cs/web/cookie-secure-only-http` |
| JavaScript | `js/clear-text-cookie` |
| Python | `py/clear-text-cookie` |

### CWE-643: XPath Injection
| Language | Query |
|----------|-------|
| C# | `cs/xml/xpath-injection` |
| Go | `go/xpath-injection` |
| Java | `java/xpath-injection` |
| JavaScript | `js/xpath-injection` |
| Python | `py/xpath-injection` |
| Ruby | `rb/xpath-injection` |

### CWE-670: Incorrect Control Flow
| Language | Query |
|----------|-------|
| C/C++ | `cpp/wrong-number-format-specifiers` |
| Java | `java/implicit-cast-in-compound-assignment` |

### CWE-681: Incorrect Conversion
| Language | Query |
|----------|-------|
| Java | `java/integer-multiplication-cast-to-long` |

### CWE-706: Use of Incorrectly-Resolved Name
| Language | Query |
|----------|-------|
| JavaScript | `js/file-access-to-http` |

### CWE-730: OWASP Top Ten 2004 Category A9
| Language | Query |
|----------|-------|
| JavaScript | `js/redos` |
| Python | `py/redos` |
| Ruby | `rb/redos` |

### CWE-732: Incorrect Permission Assignment
| Language | Query |
|----------|-------|
| C/C++ | `cpp/world-writable-file-creation` |
| Go | `go/overly-permissive-file` |
| JavaScript | `js/overly-permissive-file-permissions` |

### CWE-754: Improper Check for Unusual Conditions
| Language | Query |
|----------|-------|
| Java | `java/dereferenced-value-may-be-null` |
| JavaScript | `js/useless-type-test` |

### CWE-755: Improper Handling of Exceptional Conditions
| Language | Query |
|----------|-------|
| Java | `java/arithmetic-with-extreme-values` |

### CWE-758: Undefined Behavior
| Language | Query |
|----------|-------|
| C/C++ | `cpp/comparison-with-wider-type` |

### CWE-759: One-Way Hash without Salt
| Language | Query |
|----------|-------|
| C# | `cs/hash-without-salt` |

### CWE-760: Predictable Salt
| Language | Query |
|----------|-------|
| C# | `cs/hardcoded-credentials` |

### CWE-770: Uncontrolled Resource Consumption
| Language | Query |
|----------|-------|
| Go | `go/uncontrolled-allocation-size` |

### CWE-775: Missing Release of File Descriptor
| Language | Query |
|----------|-------|
| Java | `java/output-resource-leak` |

### CWE-776: XML Entity Expansion
| Language | Query |
|----------|-------|
| JavaScript | `js/xxe` |

### CWE-798: Hard-coded Credentials
| Language | Query |
|----------|-------|
| C# | `cs/hardcoded-credentials` |
| Go | `go/hardcoded-credentials` |
| Java | `java/hardcoded-credential-api-call` |
| JavaScript | `js/hardcoded-credentials` |
| Python | `py/hardcoded-credentials` |
| Ruby | `rb/hardcoded-credentials` |
| Swift | `swift/hardcoded-key` |

### CWE-807: Untrusted Inputs in Security Decision
| Language | Query |
|----------|-------|
| Java | `java/trust-boundary-violation` |

### CWE-829: Inclusion from Untrusted Source
| Language | Query |
|----------|-------|
| JavaScript | `js/enabling-electron-websecurity` |
| JavaScript | `js/actions/setup-node-sandbox` |

### CWE-830: Web Functionality from Untrusted Source
| Language | Query |
|----------|-------|
| JavaScript | `js/cross-window-information-leak` |
| JavaScript | `js/inclusion-of-functionality-from-untrusted-source` |
| Python | `py/unsafe-unpacking` |

### CWE-833: Deadlock
| Language | Query |
|----------|-------|
| Java | `java/unsafe-double-checked-locking` |

### CWE-834: Excessive Iteration
| Language | Query |
|----------|-------|
| JavaScript | `js/loop-bound-injection` |

### CWE-835: Infinite Loop
| Language | Query |
|----------|-------|
| C/C++ | `cpp/constant-comparison` |
| Java | `java/constant-comparison` |
| JavaScript | `js/trivial-conditional` |
| Python | `py/constant-conditional` |
| Ruby | `rb/trivial-conditional` |

### CWE-843: Type Confusion
| Language | Query |
|----------|-------|
| JavaScript | `js/type-confusion-through-parameter-tampering` |

### CWE-862: Missing Authorization
| Language | Query |
|----------|-------|
| Java | `java/android-missing-permission-check` |
| JavaScript | `js/missing-origin-check` |

### CWE-912: Hidden Functionality
| Language | Query |
|----------|-------|
| JavaScript | `js/backdoor-node-replace` |
| JavaScript | `js/backdoor-npm-publish` |

### CWE-913: Improper Control of Dynamically-Managed Code
| Language | Query |
|----------|-------|
| JavaScript | `js/command-line-injection` |

### CWE-915: Mass Assignment / Prototype Pollution
| Language | Query |
|----------|-------|
| JavaScript | `js/mass-assignment` |
| JavaScript | `js/prototype-pollution` |
| Python | `py/mass-assignment` |
| Ruby | `rb/mass-assignment` |

### CWE-916: Insufficient Password Hashing
| Language | Query |
|----------|-------|
| Python | `py/weak-password-hashing` |
| Swift | `swift/weak-password-hashing` |

### CWE-918: SSRF
| Language | Query |
|----------|-------|
| C# | `cs/web/request-forgery` |
| Go | `go/ssrf` |
| Java | `java/ssrf` |
| JavaScript | `js/request-forgery` |
| Python | `py/ssrf` |
| Ruby | `rb/request-forgery` |
| Swift | `swift/ssrf` |

### CWE-925: Improper Intent Verification
| Language | Query |
|----------|-------|
| Java | `java/android-intent-redirection` |

### CWE-927: Implicit Intent
| Language | Query |
|----------|-------|
| Java | `java/android-implicit-pendingintents` |

### CWE-1004: HttpOnly Flag Not Set
| Language | Query |
|----------|-------|
| C# | `cs/web/cookie-secure-only-http` |
| JavaScript | `js/cookie-without-httponly` |
| Python | `py/cookie-without-httponly` |

### CWE-1021: Improper Restriction of Rendered UI
| Language | Query |
|----------|-------|
| JavaScript | `js/clickjacking` |

### CWE-1022: HTTP Only in Cookie
| Language | Query |
|----------|-------|
| JavaScript | `js/cookie-without-httponly` |

### CWE-1078: Inappropriate Source Code Style
| Language | Query |
|----------|-------|
| Go | `go/constant-length-comparison` |

### CWE-1104: Use of Unmaintained Third Party Components
| Language | Query |
|----------|-------|
| JavaScript | `js/use-of-broken-or-unmaintained-third-party-module` |

### CWE-1204: Generation of Weak IV
| Language | Query |
|----------|-------|
| Java | `java/static-initialization-vector` |

### CWE-1236: CSV Injection
| Language | Query |
|----------|-------|
| Python | `py/csv-injection` |

### CWE-1269: Product Released in Non-Release Configuration
| Language | Query |
|----------|-------|
| JavaScript | `js/angular-debug-enabled` |

### CWE-1275: Sensitive Cookie Without SameSite
| Language | Query |
|----------|-------|
| JavaScript | `js/cookie-without-samesite` |
| Python | `py/cookie-without-samesite` |

### CWE-1295: Debug Messages
| Language | Query |
|----------|-------|
| Swift | `swift/cleartext-logging` |

### CWE-1321: Prototype Pollution in JSON Merge
| Language | Query |
|----------|-------|
| JavaScript | `js/prototype-pollution` |

### CWE-1333: ReDoS
| Language | Query |
|----------|-------|
| JavaScript | `js/inefficient-regular-expression` |
| Python | `py/inefficient-regular-expression` |
| Ruby | `rb/inefficient-regular-expression` |

---

## Usage Notes

1. **Language Support**: Not all queries are available for all languages. Check the [CodeQL documentation](https://codeql.github.com/codeql-query-help/full-cwe/) for language-specific availability.

2. **Custom Queries**: Some OWASP vulnerabilities may require custom CodeQL queries if specific CWEs aren't covered.

3. **Query Suites**: Consider using CodeQL security query suites that include multiple related queries:
   - `security-extended`: Comprehensive security analysis
   - `security-and-quality`: Security plus code quality checks
   - `security-experimental`: Includes experimental security queries

4. **Running Scans**: Example command for running CodeQL security analysis:
   ```bash
   codeql database analyze <database> \
     --format=sarif-latest \
     --output=results.sarif \
     <language>-security-extended.qls
   ```

## Summary Statistics

- **A01 - Broken Access Control**: 34 CWEs
- **A02 - Security Misconfiguration**: 27 CWEs
- **A03 - Software Supply Chain Failures**: 7 CWEs
- **A04 - Cryptographic Failures**: 31 CWEs
- **A05 - Injection**: 32 CWEs
- **A06 - Insecure Design**: 24 CWEs
- **A07 - Authentication Failures**: 18 CWEs
- **A08 - Software or Data Integrity Failures**: 15 CWEs
- **A09 - Security Logging and Alerting Failures**: 11 CWEs
- **A10 - Mishandling of Exceptional Conditions**: 38 CWEs

**Total Unique CWEs across OWASP Top 10 2025**: ~237 (Note: Some CWEs appear in multiple categories)

## References

- [OWASP Top 10 2025](https://owasp.org/Top10/2025/)
- [CodeQL Query Help - Full CWE](https://codeql.github.com/codeql-query-help/full-cwe/)
- [CodeQL Documentation](https://codeql.github.com/docs/)
- [CWE - Common Weakness Enumeration](https://cwe.mitre.org/)
