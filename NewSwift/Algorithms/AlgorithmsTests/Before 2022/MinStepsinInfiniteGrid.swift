import XCTest

class MinStepsinInfiniteGrid: XCTestCase {
  
  func testValues() {
    XCTAssertEqual(6, coverPoints([-7, -13], [1, -5]))
  }
  
  func testValues1() {
    XCTAssertEqual(108, coverPoints([4, 8, -7, -5, -13, 9, -7, 8], [4, -15, -10, -3, -13, 12, 8, -8]))
  }
  /*
   Coordinates go (x:A[0], y:B[0]), (x:A[1], y:B[1])
   Example A: [ -7, -13 ] B: [ 1, -5 ]
   0. -7 1
   1. -8 0
   2. -9 -1
   3. -10 -2
   4. -11 -3
   5. -12 -4
   6. -13 -5
   
   Example (answer 108)
   A : [ 4, 8, -7, -5, -13, 9, -7, 8 ]
   B : [ 4, -15, -10, -3, -13, 12, 8, -8 ]
   
   0. 4 4
   1. 5 3
   2. 6 2
   3. 7 1
   4. 8 0
   5. 8 -1
   6. 8 -2
   7. 8 -3
   ...
   
   */
  func coverPoints(_ A: [Int], _ B: [Int]) -> Int {
    guard A.count == B.count else { return 0 }
    
    var result = 0
    var xStep = A[0]
    var yStep = B[0]
    for index in 1..<A.count {
      let a = A[index]
      let b = B[index]
      
      result += abs(max(abs(xStep-a), abs(yStep-b)))
      
      xStep = a
      yStep = b
    }
    return result
  }
}
