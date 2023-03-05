import XCTest
@testable import Test

final class TestTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        TestConfiguration.logger = { _ in }
    }

    func testExample() async throws {
        struct ExampleTestPlugin: TestPlugin {
            func handle(value: Bool) async throws {
                guard value else {
                    throw TestError(description: "False value")
                }
            }
        }

        try await Test(
            named: "Development",
            tester: Tester(
                plugins: [
                    ExampleTestPlugin()
                ]
            ),
            operation: { tester in
                try await Expect(description) {
                    tester.logInfo("Info!")

                    try tester.assert(0, isEqualTo: 0)

                    try await tester.handle(value: true)

                    tester.logError("There should have been an error")
                }
            }
        )
    }
}
