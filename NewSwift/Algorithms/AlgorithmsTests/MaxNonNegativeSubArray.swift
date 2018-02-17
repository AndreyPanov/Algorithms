import XCTest

class MaxNonNegativeSubArray: XCTestCase {
  
  func testInput() {
    XCTAssertEqual([1, 2, 5], maxset([1, 2, 5, -7, 2, 3]))
  }
  
  func testInput1() {
    XCTAssertEqual([0, 0], maxset([ 0, 0, -1, 0]))
  }
  // 2.417.147.951
  // 3.364.657.82
  func testInput2() {
    XCTAssertEqual([1101513929, 1315634022], maxset([336465782, -278722862, -2145174067, 1101513929, 1315634022, -1369133069, 1059961393, 628175011, -1131176229, -859484421]))
  }
  
  func testInput3() {
    XCTAssertEqual([1424268980], maxset([756898537, -1973594324, -2038664370, -184803526, 1424268980]))
  }
  
  func maxset(_ A: [Int]) -> [Int] {
    var array: [(sum: Int, range: Range<Int>)] = []
    
    var startIndex = 0
    var endIndex = 0
    for index in 0..<A.count {
      if A[index] >= 0 {
        endIndex = index
        if A[startIndex] < 0 {
          startIndex = index
        }
        //last loop
        if index == A.count-1 {
          if startIndex == endIndex {
            array.append((A[startIndex], startIndex..<endIndex+1))
          } else {
            array.append(((A[startIndex...endIndex]).reduce(0, +), startIndex..<endIndex+1))
          }
        }
      } else {
        if A[endIndex] >= 0 {
          if startIndex == endIndex {
            array.append((A[startIndex], startIndex..<endIndex+1))
          } else {
            array.append(((A[startIndex...endIndex]).reduce(0, +), startIndex..<endIndex+1))
          }
        }
        startIndex = index
        endIndex = index
      }
    }
    if let biggestRange = findMax(of: array) {
      return Array(A[biggestRange])
    }
    return []
  }
  func findMax(of array: [(sum: Int, range: Range<Int>)]) -> Range<Int>? {
    return array.sorted(by: {arg1,arg2 in
      (arg1.sum > arg2.sum)
      || (arg1.sum == arg2.sum && arg1.range.count > arg2.range.count)
      || (arg1.sum == arg2.sum && arg1.range.count == arg2.range.count && arg1.range.lowerBound < arg2.range.lowerBound)
    }).first?.range
  }
}
