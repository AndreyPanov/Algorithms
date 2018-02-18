import XCTest

class NobleInteger: XCTestCase {
  
  func testInput() {
    XCTAssertEqual(-1, solve([3, 5, 6, 2]))
  }
  
  func testInput1() {
    XCTAssertEqual(-1, solve([1, 2, 7, 0, 9, 3, 6, 0, 6]))
  }
  
  func testInput2() {
    XCTAssertEqual(1, solve([5, 6, 2]))
  }
  
  func solve(_ A: [Int]) -> Int {
    let array = A.sorted()
    // 2 5 6
    // 2 3 5 6
    var index = array.count-1
    while index >= 0 {
      if array[index] == array.count-1-index {
        return 1
      }
      index -= 1
    }
    return -1
  }
}
