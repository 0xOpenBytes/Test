import t

/**
 The `Expect` function is used to define a test expectation within a `Test` function. The expectation closure contains the code that should succeed and produce the expected result.

 - Parameters:
    - description: A string describing the expectation.
    - expectation: A closure that contains the code to test the expectation.
 */
public func Expect(
    _ description: String? = nil,
    expectation: @escaping () throws -> Void
) throws {
    try t.expect(description, expectation: expectation)
}

/**
 The `Expect` function is used to define a test expectation within a `Test` function. The expectation closure contains the code that should succeed and produce the expected result.

 - Parameters:
    - description: A string describing the expectation.
    - expectation: A closure that contains the code to test the expectation.
 */
public func Expect(
    _ description: String? = nil,
    expectation: @escaping () async throws -> Void
) async throws {
    try await t.expect(description, expectation: expectation)
}
