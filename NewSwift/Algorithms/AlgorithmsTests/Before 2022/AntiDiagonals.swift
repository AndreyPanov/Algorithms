import XCTest

/*
 Input:
 
 1 2 3
 4 5 6
 7 8 9

 
 Return the following :
 [
  [1],
  [2, 4],
  [3, 5, 7],
  [6, 8],
  [9]
 ]
 */
class AntiDiagonals: XCTestCase {
  
  func XCTAssertEqual(_ left: [[Int]], _ right: [[Int]], file: StaticString = #file, line: UInt = #line) {
    guard left.count == right.count else {
      XCTFail("Correct array \(left) is not equal to output array \(right)",
      file: file, line: line)
      return
    }
    for index in 0..<left.count {
      if left[index] != right[index] {
        XCTFail("Correct array \(left) is not equal to output array \(right)",
          file: file, line: line)
      }
    }
     XCTAssert(true)
  }
  
  func testInput() {
    XCTAssertEqual([[1], [2, 3], [4]], diagonal([[1, 2], [3, 4]]))
  }
  
  func testInput1() {
    XCTAssertEqual([[1], [2, 4], [3, 5, 7], [6, 8], [9]], diagonal([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
  }
  
  func diagonal(_ A: [[Int]]) -> [[Int]] {
    
    var result = createEmptyArray(for: A)
    for array in result {
      for values in array {
        print(A[values.0][values.1])
      }
    }
    return []
  }
  /*
    0 0
    0 1, 1 0
    0 2, 1 1, 2 0
  */
  func createEmptyArray(for matrix:[[Int]]) -> [[(Int, Int)]] {
    var array: [[(Int, Int)]] = []
    
    var index = 0
    while index < matrix.count {
      var subArray: [(Int, Int)] = []
      var l = index
      while l >= 0 {
        subArray.append((index, l))
        l -= 1
      }
      array.append(subArray)
      index += 1
    }
    index = matrix.count-1
    while index >= 0 {
      var subArray: [(Int, Int)] = []
      var l = index
      while l >= 0 {
        subArray.append((index, l))
        l -= 1
      }
      array.append(subArray)
      index -= 1
    }
    return array
  }
}
