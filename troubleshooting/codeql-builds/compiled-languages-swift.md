# Unable to automatically build your code - XCode version issue

The GitHub runners for macos will have a default version of xcode in use. See ["included software"](https://github.com/actions/runner-images/tree/main?tab=readme-ov-file#available-images) for the appropriate macos label.  

To use any other version that is installed, you can run this command to explicitly set an Xcode version

```yml
 - name: Select Xcode version 
   run: sudo xcode-select -s '/Applications/Xcode_15.3.app/Contents/Developer'
```


Sample output:
```
Command line invocation:
  [2024-04-25 18:01:23] [build-stdout]     /Applications/Xcode_15.3.app/Contents/Developer/usr/bin/xcodebuild build -project /Users/runner/work/felickz-advanced-security-mobile-ios-test/felickz-advanced-security-mobile-ios-test/iGoat-Swift/iGoat-Swift.xcodeproj -target iGoat-Swift CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO
```


Alternatively, use a GitHub action to set this: https://github.com/marketplace/actions/setup-xcode-version
