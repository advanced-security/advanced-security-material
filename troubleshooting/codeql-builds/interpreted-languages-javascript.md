## NPM Private Modules
The below example shows how you can pull dependencies from private npm registries.

### GitHub Actions Example

```yml
name: CodeQL
env:
NPM_REGISTRY_URL: '${{ secrets.NPM_REGISTRY_URL }}'
NPM_TOKEN: '${{ secrets.NPM_TOKEN }}'
NODE_VERSION: 16.x

jobs:
build:
runs-on: ubuntu-latest
steps:
- name: checks out code
uses: actions/checkout@v2
- name: Use Node.js
uses: actions/setup-node@v2
with:
always-auth: true
node-version: '${{env.NODE_VERSION}}'
registry-url: '${{env.NPM_REGISTRY_URL}}'
- name: Install dependencies
run: npm ci --ignore-scripts
env:
NODE_AUTH_TOKEN: '${{env.NPM_TOKEN}}'


# ... Start scanning
```
