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
                try await Expect("Examples") {
                    tester.logInfo("Info!")

                    try tester.assert(0, isEqualTo: 0)

                    try await tester.handle(value: true)

                    tester.logError("There should have been an error")
                }
            }
        )
    }

    func testWaiter() async throws {
        class Value {
            var count = 0
        }

        let value = Value()
        let waiter = Waiter(value)

        try await waiter.wait(
            for: \.value.count,
            expecting: 0
        )

        XCTAssertEqual(value.count, 0)

        Task {
            try await Task.sleep(nanoseconds: 500_000_000)
            value.count += 1
        }

        XCTAssertEqual(value.count, 0)

        try await waiter.wait(for: \.value.count, duration: 2, interval: 0.5, expecting: 1)

        XCTAssertEqual(value.count, 1)
    }
}
