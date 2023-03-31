import Foundation

public struct Waiter<Object: AnyObject>: Waitable {
    public var object: Object

    public init(_ object: Object) {
        self.object = object
    }
}
