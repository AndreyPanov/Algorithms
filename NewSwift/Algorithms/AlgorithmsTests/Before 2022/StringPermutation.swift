import XCTest

class StringPermutation: XCTestCase {
  
  func testIsPermTrue() {
    XCTAssertEqual(true, isPermutation(first: "cat dog", second: " dtcago"))
  }
  
  func isPermutation(first: String, second: String) -> Bool {
    return first.sorted() == second.sorted()
  }
}
