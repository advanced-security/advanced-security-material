# FAQ

## Does CodeQL need the resulting object files from the C++ build?

CodeQL needs to monitor the actual build. Every time we see the build invoke the C++ compiler, we also "compile" the same source code with our own "compiler" that generates what we need for the actual analysis. We don't use the object files from the regular compiler at all.