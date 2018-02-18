import XCTest

class MaximumAbsoluteDifference: XCTestCase {
  
  func testInput() {
    XCTAssertEqual(5, maxArr([1, 3, -1]))
  }
  
  // |A[i] - A[j]| + |i - j|
  func maxArr(_ A: [Int]) -> Int {
    var result = 0
    
    let combinations: [(i:Int, j:Int)] = self.combinations(by: A)
    
    for container in combinations {
      let value = abs(A[container.i]-A[container.j]) + abs(container.i-container.j)
      if value > result {
        result = value
      }
    }
    return result
  }
  
  func combinations(by array: [Int]) -> [(Int, Int)] {
    var combinations: [(Int, Int)] = []
    
    for i in 0..<array.count {
      for j in 0..<array.count {
        if i != j {
          combinations.append((i, j))
        }
      }
    }
    return combinations
  }
}

