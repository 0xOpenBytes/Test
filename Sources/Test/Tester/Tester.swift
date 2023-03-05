import t
import Scribe
import Plugin

/**
 The `Tester` class is responsible for managing the execution of a test suite.

 A `Tester` instance contains a `Scribe` object, which is used to log test results and a collection of plugins that are used to perform custom operations during the test run.
 */
open class Tester: ImmutablePluginable {
    /// The `Scribe` object used to log test results.
    open var scribe: Scribe

    /**
     Initializes a new `Tester` object.

     - Parameters:
        - scribe: The `Scribe` object used to log test results. Defaults to `TestConfiguration.scribe`.
        - plugins: An array of plugins to use during the test run. Defaults to an empty array.
     */
    public init(
        scribe: Scribe = TestConfiguration.scribe,
        plugins: [any Plugin] = []
    ) {
        self.scribe = scribe

        super.init(plugins: plugins)
    }
}
