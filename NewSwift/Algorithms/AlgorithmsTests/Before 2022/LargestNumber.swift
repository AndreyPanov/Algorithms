import XCTest

class LargestNumber: XCTestCase {
  
  func testInput() {
    XCTAssertEqual("9534330", largestNumber([3, 30, 34, 5, 9]))
  }
  
  func testInput1() {
    XCTAssertEqual("0", largestNumber([0, 0, 0, 0, 0]))
  }
  
  func largestNumber(_ A: [Int]) -> String {
    var result = A
      .sorted(by: { element1, element2 in
      return "\(element1)\(element2)" > "\(element2)\(element1)"
    })
    while result.first == 0 && result.count > 1 {
      result.remove(at: 0)
    }
    return result.reduce("", { sum, element in
      return sum + String(element)
    })
  }
}
