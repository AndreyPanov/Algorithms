import XCTest

class PrimeSum: XCTestCase {
  
  func testPrimeSum1() {
    XCTAssertEqual([2, 2], primeSum(4))
  }
  
  func primeSum(_ number: Int) -> [Int] {
    
    for i in 2..<number {
      if isPrime(i) && isPrime(number-i) {
        return [i, number-i]
      }
    }
    return []
  }
  
  func isPrime(_ number: Int) -> Bool {
    guard number > 1 else { return false }
    
    var count = 2
    let sqrtNumber = Int(round(sqrt(Double(number))))
    while count <= sqrtNumber {
      if number % count == 0 {
        return false
      }
      count += 1
    }
    return true
  }
}
