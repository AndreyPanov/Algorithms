import XCTest

class AllFactors: XCTestCase {
  func testFactors() {
    XCTAssertEqual([1, 2, 3, 6], allFactorsImproved(number: 6))
  }
  
  func testFactorsNew() {
    XCTAssertEqual([1, 2, 3, 6], allFactorsABitImproved(number: 6))
  }
  
  func testFactorsBest() {
    XCTAssertEqual([1, 2, 3, 4, 6, 8, 9, 12, 16, 18, 24, 27, 32, 36, 48, 54, 64, 72, 81, 96, 108, 128, 144, 162, 192, 216, 256, 288, 324, 384, 432, 512, 576, 648, 768, 864, 1024, 1152, 1296, 1536, 1728, 2304, 2592, 3072, 3456, 4608, 5184, 6912, 9216, 10368, 13824, 20736, 27648, 41472, 82944], allFactorsImproved(number: 82944))
  }
  
  func testFactorsBest2() {
    XCTAssertEqual([1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 14, 18, 21, 22, 24, 28, 33, 36, 42, 44, 49, 56, 63, 66, 72, 77, 84, 88, 98, 99, 126, 132, 147, 154, 168, 196, 198, 231, 252, 264, 294, 308, 392, 396, 441, 462, 504, 539, 588, 616, 693, 792, 882, 924, 1078, 1176, 1386, 1617, 1764, 1848, 2156, 2772, 3234, 3528, 4312, 4851, 5544, 6468, 9702, 12936, 19404, 38808], allFactorsImproved(number: 38808))
  }
  
  func testFactorsBest3() {
    XCTAssertEqual([1, 2, 7, 13, 14, 26, 91, 182], allFactorsImproved(number: 182))
  }
  
  func allFactors(number: Int) -> [Int] {
    var result: [Int] = []
    var tmpNumber = 1
    while tmpNumber <= number {
      if number % tmpNumber == 0 {
        result.append(tmpNumber)
      }
      tmpNumber += 1
    }
    return result
  }
  
  func allFactorsABitImproved(number: Int) -> [Int] {
    guard number > 1 else { return [1] }
    
    var result: [Int] = [1, number]
    var tmpNumber = 2
    while tmpNumber <= number/2 {
      if number % tmpNumber == 0 {
        result.append(tmpNumber)
      }
      tmpNumber += 1
    }
    return result.sorted()
  }
  
  func allFactorsImproved(number: Int) -> [Int] {
    guard number > 1 else { return [1] }
    
    var result: [Int] = []
    var tmpNumber = 1
    
    let sqrtNumber = Int(round(sqrt(Double(number))))
    print("---------------------------")
    print("For test number: \(number)")
    print("sqrt: \(sqrt(Double(number)))")
    print("int: \(sqrtNumber)")
    print("---------------------------")
    while tmpNumber <= sqrtNumber {
      if number % tmpNumber == 0 {
        result.append(tmpNumber)
        if tmpNumber != sqrtNumber {
          result.append(number/tmpNumber)
        }
      }
      tmpNumber += 1
    }
    return result.sorted()
  }
}
