import XCTest

class GridUniquePaths: XCTestCase {
  
  func testInput() {
    XCTAssertEqual(2, uniquePaths(2, 2))
  }
  // Returns count of possible paths to reach
  // cell at row number m and column number n from
  // the topmost leftmost cell (cell at 1, 1)
  func uniquePathsWrong(_ A: Int, _ B: Int) -> Int {
    if A == 1 || B == 1 {
      return 1
    }
    return uniquePaths(A-1, B) + uniquePaths(A, B-1)
  }
  
  func uniquePaths(_ A: Int, _ B: Int) -> Int {
    if A == 1 || B == 1 {
      return 1
    }
    
    var array = Array<[Int]>(repeating: Array<Int>(repeating: 1, count: B), count: A)
    for index in 1..<A {
      for jndax in 1..<B {
        array[index][jndax] = array[index-1][jndax] + array[index][jndax-1]
      }
    }
    return array[A-1][B-1]
  }
}
