import t

/**
 The `Test` function is used to create a test suite with multiple steps, expectations, and assertions.

 - Parameters:
    - named: An optional name for the test suite.
    - tester: An instance of the `Tester` class to be used for running the test suite.
    - operation: A closure that contains the test steps, expectations, and assertions.
    - lineNumber: The line number where the `Test` function is called. Defaults to the line number where the function is called.
    - functionName: The name of the function where the `Test` function is called. Defaults to the name of the function where the function is called.
    - fileName: The name of the file where the `Test` function is called. Defaults to the name of the file where the function is called.

 - Throws: A `TestError` if the test suite fails.

Example usage:

     try Test(named: "My Test Suite") { tester in
        try Expect("First step should succeed") {
            try SomeClass.someMethod()
        }

        try Expect("Second step should succeed") {
            try SomeClass.someOtherMethod()
        }

        try Expect("Final assertion should be true") {
            try tester.assert(SomeClass.someBooleanValue)
        }
     }
*/
public func Test(
    named name: String? = nil,
    tester: Tester = Tester(),
    operation: @escaping (Tester) throws -> Void,
    lineNumber: Int = #line,
    functionName: String = #function,
    fileName: String = #file
) throws {
    var result: Error?

    t.suite(named: name) {
        do {
            try operation(tester)
        } catch {
            result = error
        }
    }

    if let result = result {
        let testName = name.map { "\($0) Test" } ?? "Test"
        throw TestError(
            description: "\(testName) failed. \(result.localizedDescription)",
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }
}

/**
 The `Test` function is used to create a test suite with multiple steps, expectations, and assertions.

 - Parameters:
    - named: An optional name for the test suite.
    - tester: An instance of the `Tester` class to be used for running the test suite.
    - operation: A closure that contains the test steps, expectations, and assertions.
    - lineNumber: The line number where the `Test` function is called. Defaults to the line number where the function is called.
    - functionName: The name of the function where the `Test` function is called. Defaults to the name of the function where the function is called.
    - fileName: The name of the file where the `Test` function is called. Defaults to the name of the file where the function is called.

 - Throws: A `TestError` if the test suite fails.

Example usage:

     try await Test(named: "My Test Suite") { tester in
        try Expect("First step should succeed") {
            try SomeClass.someMethod()
        }

        try await Expect("Second step should succeed") {
            try await SomeClass.someOtherMethod()
        }

        try Expect("Final assertion should be true") {
            try tester.assert(SomeClass.someBooleanValue)
        }
     }
*/
public func Test(
    named name: String? = nil,
    tester: Tester = Tester(),
    operation: @escaping (Tester) async throws -> Void,
    lineNumber: Int = #line,
    functionName: String = #function,
    fileName: String = #file
) async throws {
    var result: Error?

    await t.suite(named: name) {
        do {
            try await operation(tester)
        } catch {
            result = error
        }
    }

    if let result = result {
        let testName = name.map { "\($0) Test" } ?? "Test"
        throw TestError(
            description: "\(testName) failed. \(result.localizedDescription)",
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }
}
