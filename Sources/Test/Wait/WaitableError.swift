import Foundation

/**
 An error that is thrown when a wait operation times out.
 
 - Note: Conforms to the `LocalizedError` protocol for localized error messages.
 */
public enum WaitableError: LocalizedError {
    /// The wait operation timed out before the condition was satisfied.
    case timeout(TimeInterval)
    
    /**
     The error message associated with the error.
     
     - Returns: The error message.
     */
    public var errorDescription: String? {
        switch self {
        case let .timeout(duration): return "Waitable Timeout: Exceeded duration of \(duration) seconds."
        }
    }
}
