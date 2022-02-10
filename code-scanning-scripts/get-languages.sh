#!/usr/bin/env bash

curl -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $GH_TOKEN" \                                                                           
https://api.github.com/repos/advanced-security/ghas-bootcamp-dryrun/languages |  \
jq 'with_entries(select([.key] | inside(["Go", "Java", "JavaScript", "Python", "C++", "C#", "C", "TypeScript"])) | if .key == "C" then .key = "cpp" else . end | if .key == "C#" then .key = "csharp" else . end | if .key == "C++" then .key = "cpp" else . end | if .key == "Go" then .key = "go" else . end | if .key == "Java" then .key = "java" else . end | if .key == "JavaScript" then .key = "javascript" else . end | if .key == "Python" then .key = "python" else . end | if .key == "TypScript" then .key = "typescript" else . end)' | jq "keys"
