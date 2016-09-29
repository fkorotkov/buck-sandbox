# Buck Examples [![Build Status](https://travis-ci.org/fkorotkov/buck-sandbox.svg?branch=master)](https://travis-ci.org/fkorotkov/buck-sandbox)

`buck test -all` is failing with:

```
[2016-09-28 17:00:52.044][error][command:785ef0dd-d243-4be9-9b6e-f75bb578f603][tid:1660][com.facebook.buck.swift.SwiftCompileStep] Error running /Applications/Xcode.app/Contents/Developer/Toolchains/Swift_2.3.xctoolchain/usr/bin/swift -frontend -sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk -target x86_64-apple-ios10.0 -import-objc-header complex_objc_swift/Foo-Bridging-Header.h -F /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks -enable-testing -c -enable-objc-interop -parse-as-library -module-name Bridging -emit-module -emit-module-path buck-out/gen/complex_objc_swift/Bridging#iphonesimulator-x86_64,swift-compile/Bridging.swiftmodule -o buck-out/gen/complex_objc_swift/Bridging#iphonesimulator-x86_64,swift-compile/Bridging.o -emit-objc-header-path buck-out/gen/complex_objc_swift/Bridging#iphonesimulator-x86_64,swift-compile/Bridging-Swift.h complex_objc_swift/swift/Foo+Greeting.swift: /Users/fedor_korotkov/workspace/buck-sandbox/./complex_objc_swift/Foo-Bridging-Header.h:1:9: note: in file included from /Users/fedor_korotkov/workspace/buck-sandbox/./complex_objc_swift/Foo-Bridging-Header.h:1:
#import "objc/Foo.h"
        ^
/Users/fedor_korotkov/workspace/buck-sandbox/complex_objc_swift/objc/Foo.h:3:9: error: 'Version.h' file not found
#import "Version.h"
        ^
<unknown>:0: error: failed to import bridging header 'complex_objc_swift/Foo-Bridging-Header.h'
```