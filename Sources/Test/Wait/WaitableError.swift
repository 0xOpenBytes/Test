import Foundation

public enum WaitableError: LocalizedError {
    case timeout(TimeInterval)

    public var errorDescription: String? {
        switch self {
        case let .timeout(duration): return "Waitable Timeout: Exceeded duration of \(duration) seconds."
        }
    }
}
