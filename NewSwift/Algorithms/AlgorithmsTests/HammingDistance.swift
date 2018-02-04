import XCTest

class HammingDistance: XCTestCase {

  func testHammingDistance() {
    XCTAssertEqual(8, hammingDistance([2, 4, 6]))
  }
  
  func hammingDistance(_ numbers: [Int]) -> Int {
    return makePairs(numbers)
      .map({ onePairValue(x: $0, y: $1) })
      .reduce(0, +)
  }
  
  func makePairs(_ numbers: [Int]) -> [(Int, Int)] {
    var result: [(Int, Int)] = []
    for i in 0..<numbers.count {
      for j in 0..<numbers.count {
        if numbers[i] != numbers[j] {
          result.append((numbers[i], numbers[j]))
        }
      }
    }
    return result
  }
  
  func onePairValue(x: Int, y: Int) -> Int {
    var xBin = convertToBinary(number: x)
    var yBin = convertToBinary(number: y)
    let delta = xBin.count - yBin.count
    if delta > 0 {
      for _ in 0..<delta {
        yBin.insert("0", at: yBin.startIndex)
      }
    } else if delta < 0 {
      for _ in 0..<(delta*(-1)) {
        xBin.insert("0", at: xBin.startIndex)
      }
    }
    var sum = 0
    for (d, f) in zip(xBin, yBin) {
      if d != f {
        sum += 1
      }
    }
    return sum
  }
  
  func convertToBinary(number: Int) -> String {
    guard number > 0 else { return "0" }
    var result = ""
    var tmpNumber = number
    while tmpNumber > 1 {
      if tmpNumber % 2 == 0 {
        result.append("0")
        tmpNumber = tmpNumber / 2
      } else {
        tmpNumber = (tmpNumber - 1) / 2
        result.append("1")
      }
    }
    result.append("1")
    return String(result.reversed())
  }
}
