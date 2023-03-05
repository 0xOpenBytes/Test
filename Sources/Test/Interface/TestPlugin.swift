import Plugin

/**
 The `TestPlugin` protocol defines a contract for plugins that can be used to extend the behavior of the `Tester` class.

 `TestPlugin` extends the `ImmutablePlugin` protocol, which allows the plugin to be treated as an immutable object.

 `TestPlugin` is used for conveince when creating a `Plugin` for a `Tester`.
 */
public protocol TestPlugin: ImmutablePlugin { }
