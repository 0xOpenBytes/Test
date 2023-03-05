import t

extension Tester {
    /// Assert that the condition is true.
    public func assert(
        _ condition: Bool,
        _ message: String? = nil,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) throws {
        try t.assert(
            condition,
            message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }

    /// Assert that the condition is false.
    public func assert(
        notTrue condition: Bool,
        _ message: String? = nil,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) throws {
        try t.assert(
            notTrue: condition,
            message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }

    /// Assert that the first value is equal to the second.
    public func assert<Value: Equatable>(
        _ firstValue: Value,
        isEqualTo secondValue: Value,
        _ message: String? = nil,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) throws {
        try t.assert(
            firstValue,
            isEqualTo: secondValue,
            message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }

    /// Assert that the first value is not equal to the second.
    public func assert<Value: Equatable>(
        _ firstValue: Value,
        isNotEqualTo secondValue: Value,
        _ message: String? = nil,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) throws {
        try t.assert(
            firstValue,
            isNotEqualTo: secondValue,
            message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }

    /// Assert that the value is not nil.
    public func assert<Value>(
        isNotNil value: Value?,
        _ message: String? = nil,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) throws {
        try t.assert(
            isNotNil: value,
            message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }

    /// Assert that the value is nil.
    public func assert<Value>(
        isNil value: Value?,
        _ message: String? = nil,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) throws {
        try t.assert(
            isNil: value,
            message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }

    /// Assert that the closure should throw
    public func assertThrows<Value>(
        _ message: String? = nil,
        operation: @escaping @autoclosure () throws -> Value,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) throws {
        try t.assertThrows(
            operation,
            message: message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }

    /// Assert that the closure should not throw
    public func assertNoThrows<Value>(
        _ message: String? = nil,
        operation: @escaping @autoclosure () throws -> Value,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) throws {
        try t.assertNoThrows(
            operation,
            message: message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }

    ///
    @discardableResult
    public func unwrap<Value>(
        _ value: Value?,
        message: String? = nil,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) throws -> Value {
        try t.unwrap(
            value,
            message: message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }
}

#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
extension Tester {
    /// Assert that the closure should throw
    public func assertThrows<Value>(
        _ message: String? = nil,
        operation: @escaping @autoclosure () async throws -> Value,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) async throws {
        try await t.assertThrows(
            operation,
            message: message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }

    /// Assert that the closure should not throw
    public func assertNoThrows<Value>(
        _ message: String? = nil,
        operation: @escaping @autoclosure () async throws -> Value,
        lineNumber: Int = #line,
        functionName: String = #function,
        fileName: String = #file
    ) async throws {
        try await t.assertNoThrows(
            operation,
            message: message,
            lineNumber: lineNumber,
            functionName: functionName,
            fileName: fileName
        )
    }
}
#endif
