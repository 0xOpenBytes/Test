import Foundation

public protocol Waitable {
    @discardableResult
    func wait<Value>(
        for keyPath: KeyPath<Self, Value>,
        duration: TimeInterval,
        interval: TimeInterval,
        expecting: @escaping (Value) -> Bool
    ) async throws -> Value

    @discardableResult
    func wait<Value: Equatable>(
        for keyPath: KeyPath<Self, Value>,
        duration: TimeInterval,
        interval: TimeInterval,
        expecting: Value
    ) async throws -> Value
}
