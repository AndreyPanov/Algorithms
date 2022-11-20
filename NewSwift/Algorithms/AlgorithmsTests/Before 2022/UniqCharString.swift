import XCTest

class UniqCharString: XCTestCase {
  
  func testUniq() {
    XCTAssertEqual(true, isUniqueChars(string: "qwertyuioplkjhgfdsazxcvbnm"))
  }
  
  func testNotUniq() {
    XCTAssertEqual(false, isUniqueChars(string: "qwertyuioplkggjhgfdsazxcvbnm"))
  }
  
  func testNotUniq1() {
    XCTAssertEqual(false, isUniqueChars(string: "qqqqqqqqqqwwwwwwwww"))
  }
  
  func isUniqueChars(string: String) -> Bool {
    guard string.count < 128 else { return false }
    
    let set = Set<Character>(string)
    return set.count == string.count
  }
}
