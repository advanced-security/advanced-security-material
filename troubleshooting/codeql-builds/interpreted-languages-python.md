# Build Failures

## ERROR: In --require-hashes mode, all requirements must have their versions pinned with ==.

Error/Warning in the workflow logs like:

```yml
ERROR: In --require-hashes mode, all requirements must have their versions pinned with ==. These do not:
    importlib-metadata from https://files.pythonhosted.org/packages/b5/64/ef29a63cf08f047bb7fb22ab0f1f774b87eed0bb46d067a5a524798a4af8/importlib_metadata-5.0.0-py3-none-any.whl (from alembic==1.8.1->-r requirements.txt (line ###))
package installation with `pip install -r requirements.txt` failed, see error above
##[endgroup]
##[warning]An error occurred while trying to automatically install Python dependencies: Error: The process '/usr/bin/python3' failed with exit code 1
Please make sure any necessary dependencies are installed before calling the codeql-action/analyze step, and add a 'setup-python-dependencies: false' argument to this step to disable our automatic dependency installation and avoid this warning.
```
![image](https://user-images.githubusercontent.com/1760475/198150549-61326671-e7cc-4cbc-b640-4858fe294f93.png)


This is likely due to a python/pypi/pip version mismatch.  Ensure you configure your proper version required to build via [actions/setup-python](https://github.com/actions/setup-python/blob/main/docs/advanced-usage.md#using-the-python-version-input)
- see [stackoverflow](https://stackoverflow.com/a/72980455/343347)

To resolve, specify your required versions before the codeql-action/init step:
```yml
#Set python version
- uses: actions/setup-python@v4
  with:
    python-version: '3.9' 
    cache: 'pip' # caching pip dependencies
#Downgrade to specific pip version
-run: python -m pip install pip==22.0.4
```

Alternatively, you can disable the auto-install dependency functionality. You will need to configure the build requirements/commands from your existing CI.  Specify that codeql should disable the python automatic package restoration and run the CI tooling / commands directly before the analysis step as shown [here](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/configuring-code-scanning#analyzing-python-dependencies).
```yml
          # Override the default behavior so that the action doesn't attempt
          # to auto-install Python dependencies
          setup-python-dependencies: false
```