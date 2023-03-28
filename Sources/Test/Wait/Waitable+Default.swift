import Foundation

extension Waitable {
    @discardableResult
    public func wait<Value>(
        for keyPath: KeyPath<Self, Value>,
        duration: TimeInterval = 3,
        interval: TimeInterval = 0.1,
        expecting: @escaping (Value) -> Bool
    ) async throws -> Value {
        try await wait(
            for: keyPath,
            interation: 0,
            duration: abs(duration),
            interval: abs(interval),
            expecting: expecting
        )
    }

    @discardableResult
    public func wait<Value: Equatable>(
        for keyPath: KeyPath<Self, Value>,
        duration: TimeInterval = 3,
        interval: TimeInterval = 0.1,
        expecting: Value
    ) async throws -> Value {
        try await wait(
            for: keyPath,
            interation: 0,
            duration: abs(duration),
            interval: abs(interval),
            expecting: { value in
                expecting == value
            }
        )
    }

    private func wait(duration: TimeInterval) async throws {
        try await Task.sleep(nanoseconds: UInt64(1_000_000_000 * abs(duration)))
    }

    private func wait<Value>(
        for keyPath: KeyPath<Self, Value>,
        interation: UInt,
        duration: TimeInterval,
        interval: TimeInterval,
        expecting: @escaping (Value) -> Bool
    ) async throws -> Value {
        guard Double(interation) * interval < duration else {
            throw WaitableError.timeout(duration)
        }

        let value = self[keyPath: keyPath]

        if expecting(value) {
            return value
        }

        try await wait(duration: interval)

        return try await wait(
            for: keyPath,
            interation: interation + 1,
            duration: duration,
            interval: interval,
            expecting: expecting
        )
    }
}
