import XCTest
@testable import AIProductIOSTemplate

final class BasicTests: XCTestCase {
    func testViewStateEquality() {
        XCTAssertEqual(ViewState.success, ViewState.success)
    }
}
