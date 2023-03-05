import t
import Scribe

/**
 The `TestConfiguration` enum provides a global configuration for tests.

 Use this enum to customize the logger and scribe for the test framework.

 Example usage:

 TestConfiguration.logger = { print($0) }
 TestConfiguration.scribe = Scribe(label: "Custom Scribe")

 */
public enum TestConfiguration {
    /**
     A closure that receives a string and logs it. This is used by the framework to log messages when tests run.

     By default, the logger is set to `t.logger` from the `t` library.

     - Note: To change the logger, set `TestConfiguration.logger`.

     Example usage:

            TestConfiguration.logger = { print($0) }
     */
    public static var logger: (String) -> Void {
        get { t.logger }
        set { t.logger = newValue }
    }

    /**
     The scribe used by the test framework.

     By default, the scribe is set to a new instance of `Scribe` with a label of "Test.Scribe".

     - Note: To change the scribe, set `TestConfiguration.scribe`.

     Example usage:

         TestConfiguration.scribe = Scribe(label: "Custom Scribe")

    */
    public static var scribe: Scribe = Scribe(label: "Test.Scribe")
}
