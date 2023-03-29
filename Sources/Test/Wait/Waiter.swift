import Foundation

public struct Waiter<Value: AnyObject>: Waitable {
    public var value: Value

    public init(_ value: Value) {
        self.value = value
    }
}
