# Test

*🧪 Expect and assert*

## What is `Test`?

`Test` is a simple testing function that allows you to create test suites with multiple steps, expectations, and assertions. You can specify a name for the test suite, an instance of the `Tester` class to be used for running the tests, and a closure that contains the test steps.

## Where can `Test` be used?

`Test` can be used anywhere! `Test` can be used to test quickly inside a function to make sure something is working as expected. It is especially useful when you want to test a complex piece of code with multiple steps and assertions. `Test` can even be used for your unit tests!

## Examples

### Simple test with assertions

```swift
try await Test(named: "Test someMethod()") { tester in
    try tester.assert(SomeClass.someMethod())
    try await tester.assertNoThrows(try await SomeClass.someOtherMethod())
    try tester.assert(SomeClass.someBooleanValue, isEqualTo: false)
}
```

### Test with expectations

```swift
try Test(named: "Test someMethod() with expectations") { tester in
    try Expect("First step should succeed") {
        try SomeClass.someMethod()
    }
    
    tester.logInfo("Just finished first step")

    try Expect("Second step should succeed") {
        try SomeClass.someOtherMethod()
    }
            
    tester.logWarning("Something unexpected happened during the second step")

    try Expect("Final assertion should be true") {
        try tester.assert(SomeClass.someBooleanValue)
    }
    
    tester.logSuccess("All steps and assertions passed!")
}
```
