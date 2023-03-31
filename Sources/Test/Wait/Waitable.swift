import Foundation

/**
 A protocol that defines methods for waiting on a value to change in a specified object.
 */
public protocol Waitable {
    /**
     Waits asynchronously for the value of the specified key path to satisfy the provided condition.
     
     - Parameters:
     - `keyPath`: The key path of the value to wait for.
     - `duration`: The maximum amount of time to wait for the value to change.
     - `interval`: The interval at which to check the value.
     - `expecting`: The closure that determines whether the value satisfies the condition.
     
     - Returns: The value of the key path once it satisfies the condition.
     
     - Throws: An error if the wait times out.
     */
    @discardableResult
    func wait<Value>(
        for keyPath: KeyPath<Self, Value>,
        duration: TimeInterval,
        interval: TimeInterval,
        expecting: @escaping (Value) -> Bool
    ) async throws -> Value
    
    /**
     Waits asynchronously for the value of the specified key path to become equal to the provided value.
     
     - Parameters:
     - `keyPath`: The key path of the value to wait for.
     - `duration`: The maximum amount of time to wait for the value to change.
     - `interval`: The interval at which to check the value.
     - `expecting`: The expected value to wait for.
     
     - Returns: The value of the key path once it becomes equal to the provided value.
     
     - Throws: An error if the wait times out.
     */
    @discardableResult
    func wait<Value: Equatable>(
        for keyPath: KeyPath<Self, Value>,
        duration: TimeInterval,
        interval: TimeInterval,
        expecting: Value
    ) async throws -> Value
}
