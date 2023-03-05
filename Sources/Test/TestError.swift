import t

/**
 The `TestError` function creates an instance of a test error with a given description and location information.

 - Parameters:
   - description: A string describing the error.
   - lineNumber: The line number where the error occurred. Defaults to the line number where the function is called.
   - functionName: The name of the function where the error occurred. Defaults to the name of the function where the function is called.
   - fileName: The name of the file where the error occurred. Defaults to the name of the file where the function is called.

 - Returns: An instance of `Error` representing the test error.

 Example usage:

     throw TestError(description: "Test failed.")
*/
public func TestError(
    description: String,
    lineNumber: Int = #line,
    functionName: String = #function,
    fileName: String = #file
) -> Error {
    t.error(
        description: description,
        lineNumber: lineNumber,
        functionName: functionName,
        fileName: fileName
    )
}
