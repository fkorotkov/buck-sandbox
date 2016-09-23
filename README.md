# Buck Examples [![Build Status](https://travis-ci.org/fkorotkov/buck-sandbox.svg?branch=master)](https://travis-ci.org/fkorotkov/buck-sandbox)

A set of small examples to reproduce a strange behaviour of Buck running Swift tests.

Note: I have XCode 8 installed and Swift_2_3 toolchain selected.

To reproduce just run `buck test --all`.

`//simple_only_swift_tests/StringUtilTest:StringUtilTest` is failing with:

```
xctool failed with exit code 134: 2016-09-23 09:43:56.559 xctool[89073:12716297] *** Assertion failure in cpu_type_t CpuTypeForTestBundleAtPath(NSString *__strong)(), Common/XCToolUtil.m:948
2016-09-23 09:43:56.561 xctool[89073:12716297] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Bundle's executable code doesn't support nor i386, nor x86_64 CPU types. Bundle path: /Users/fedor_korotkov/workspace/buck-sandbox/buck-out/gen/simple_only_swift_tests/StringUtilTest/StringUtilTest#apple-test-bundle,dwarf,no-include-frameworks/StringUtilTest.xctest, supported cpu types: (null).'
*** First throw call stack:
(
	0   CoreFoundation                      0x00007fff85fb84f2 __exceptionPreprocess + 178
	1   libobjc.A.dylib                     0x00007fff8fc0df7e objc_exception_throw + 48
	2   CoreFoundation                      0x00007fff85fbd1ca +[NSException raise:format:arguments:] + 106
	3   Foundation                          0x00007fff86ada1ee -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:] + 169
	4   xctool                              0x000000010904d941 CpuTypeForTestBundleAtPath + 2577
	5   xctool                              0x00000001090c7b0c -[SimulatorInfo productBundlePathCpuType] + 76
	6   xctool                              0x00000001090c7bbf -[SimulatorInfo simulatedCpuType] + 127
	7   xctool                              0x00000001090c7e7d -[SimulatorInfo simulatedDeviceInfoName] + 429
	8   xctool                              0x00000001090c88b7 -[SimulatorInfo maxSdkVersionForSimulatedDevice] + 71
	9   xctool                              0x00000001090c8ac9 -[SimulatorInfo simulatedSdkVersion] + 137
	10  xctool                              0x00000001090c8fe8 -[SimulatorInfo sdkInfoForSimulatedSdk] + 712
	11  xctool                              0x00000001090c9258 -[SimulatorInfo simulatedRuntime] + 40
	12  xctool                              0x00000001090c9339 -[SimulatorInfo simulatedDevice] + 89
	13  xctool                              0x00000001090ce178 CreateTaskForSimulatorExecutable + 424
	14  xctool                              0x00000001090a5e89 -[OCUnitIOSLogicTestQueryRunner createTaskForQuery] + 713
	15  xctool                              0x00000001090a8aa5 -[OCUnitTestQueryRunner runQueryWithError:] + 805
	16  xctool                              0x00000001090dadad +[TestableExecutionInfo queryTestCasesWithSimulatorInfo:error:] + 589
	17  xctool                              0x00000001090d9c31 +[TestableExecutionInfo infoForTestable:buildSettings:simulatorInfo:] + 369
	18  xctool                              0x00000001090c3934 __56-[RunTestsAction runTestables:options:xcodeSubjectInfo:]_block_invoke + 1380
	19  libdispatch.dylib                   0x00007fff8a9d593d _dispatch_call_block_and_release + 12
	20  libdispatch.dylib                   0x00007fff8a9ca40b _dispatch_client_callout + 8
	21  libdispatch.dylib                   0x00007fff8a9cf03b _dispatch_queue_drain + 754
	22  libdispatch.dylib                   0x00007fff8a9d5707 _dispatch_queue_invoke + 549
	23  libdispatch.dylib                   0x00007fff8a9ca40b _dispatch_client_callout + 8
	24  libdispatch.dylib                   0x00007fff8a9ce29b _dispatch_root_queue_drain + 1890
	25  libdispatch.dylib                   0x00007fff8a9cdb00 _dispatch_worker_thread3 + 91
	26  libsystem_pthread.dylib             0x00007fff8daa24de _pthread_wqthread + 1129
	27  libsystem_pthread.dylib             0x00007fff8daa0341 start_wqthread + 13
)
libc++abi.dylib: terminating with uncaught exception of type NSException
```

But `//simple_mixed_swift_tests/StringUtilTest:StringUtilTest` is working fine!
