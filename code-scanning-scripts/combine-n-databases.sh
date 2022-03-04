#!/usr/bin/env bash

# For n number of dirs, initialise each of them. In this example I have two dirs at the root:
codeql database init dbs/db-js1 --language=javascript --source-root dir1 --overwrite
codeql database init dbs/db-js2 --language=javascript --source-root dir2 --overwrite

# After db skeletons are created, use the trace command to call out the extractor/add build instructions
codeql database trace-command dbs/db-js1 -- /Users/cmboling/Projects/codeql-home/codeql-latest/javascript/tools/autobuild.sh
codeql database trace-command dbs/db-js2 -- /Users/cmboling/Projects/codeql-home/codeql-latest/javascript/tools/autobuild.sh

# Then import n unfinalized dbs to the target db
codeql database import dbs/db-js1 db-js2
codeql database finalize --finalize-dataset db-js1

# Analyze target db as usual
codeql database analyze db-js1 javascript-code-scanning.qls --format=sarif-latest --output=codeql-javascript-results.sarif
