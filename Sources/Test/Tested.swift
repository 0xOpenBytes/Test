import t

/**
 The Tested function is used to test a single operation and return its output.

     Parameters:
         description: A description of the operation being tested.
         operation: A closure that contains the operation to be tested.

     Returns: The output of the tested operation.

     Throws: Any errors that occur during the operation.

 Example usage:

     let result = try Tested("Tested operation") {
        return SomeClass.someMethod()
     }
 */
public func Tested<Output>(
    _ description: String,
    operation: @escaping () throws -> Output
) throws -> Output {
    try t.tested(description, operation)
}

/**
 The Tested function is used to test a single operation and return its output.

     Parameters:
         operation: A closure that contains the operation to be tested.

     Returns: The output of the tested operation.

     Throws: Any errors that occur during the operation.

 Example usage:

     let result = try Tested("Tested operation") {
        return SomeClass.someMethod()
     }
 */
public func Tested<Output>(
    operation: @escaping () throws -> Output
) throws -> Output {
    try t.tested(operation)
}

/**
 The Tested function is used to test a single operation and return its output.

     Parameters:
         description: A description of the operation being tested.
         operation: A closure that contains the operation to be tested.

     Returns: The output of the tested operation.

     Throws: Any errors that occur during the operation.

 Example usage:

     let result = try await Tested("Tested operation") {
        try await SomeClass.someMethod()
     }
 */
public func Tested<Output>(
    _ description: String,
    operation: @escaping () async throws -> Output
) async throws -> Output {
    try await t.tested(description, operation)
}

/**
 The Tested function is used to test a single operation and return its output.

     Parameters:
         operation: A closure that contains the operation to be tested.

     Returns: The output of the tested operation.

     Throws: Any errors that occur during the operation.

 Example usage:

     let result = try await Tested("Tested operation") {
        try await SomeClass.someMethod()
     }
 */
public func Tested<Output>(
    operation: @escaping () async throws -> Output
) async throws -> Output {
    try await t.tested(operation)
}
