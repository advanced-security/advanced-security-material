# Juice Shop

> OWASP Juice Shop is probably the most modern and sophisticated insecure web application!
> It can be used in security trainings, awareness demos, CTFs and as a guinea pig for security tools!
> Juice Shop encompasses vulnerabilities from the entire OWASP Top Ten along with many other security flaws found in real-world applications!

## Workflow(s)

[See full Actions workflow here](./juice-shop.yml)

## Guide

Use the [GitHub SecurityLab synthetic application CodeQL Configuration file](https://github.com/GitHubSecurityLab/CodeQL-Community-Packs/blob/main/configs/synthetics.yml) to scan the Juice Shop application.
This will do the following:

1. Enable additional queries to run
2. Enable Local Threat Models 
    - This will inclide `local` and `responses` threat models for the application testing
3. Ignore common paths with tests, samples, etc.
