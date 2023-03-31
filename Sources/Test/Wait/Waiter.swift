import Foundation

/**
 A type that provides methods for waiting on a value to change in a specified object.

 Use an instance of `Waiter` to wait for a value on a specified object to change. You can create a `Waiter` instance by initializing it with an object of type class.

```swift
let waiter = Waiter(object)
 
try await waiter.wait(
    for: \.object.property,
    duration: 5.0,
    interval: 0.1,
    expecting: expectedValue
)
 
 try await waiter.wait(
     for: \.object.property,
     duration: 5.0,
     interval: 0.1,
     expecting: { value in value == expectedValue }
 )
```

- Note: `Waiter` is a struct, so it is safe to use in a concurrent context.
*/
public struct Waiter<Object: AnyObject>: Waitable {
    public var object: Object

    public init(_ object: Object) {
        self.object = object
    }
}
