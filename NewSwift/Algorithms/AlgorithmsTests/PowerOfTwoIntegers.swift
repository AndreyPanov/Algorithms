import XCTest

class PowerOfTwoIntegers: XCTestCase {
  
  func testPower() {
    XCTAssertEqual(true, isPower(4))
  }
  
  func testPower1() {
    XCTAssertEqual(true, isPower(1024064001))
  }
  
  func testPower2() {
    XCTAssertEqual(false, isPower(2))
  }
  
  func testPower3() {
    XCTAssertEqual(false, isPower(16808))
  }
  
  func isPower(_ number: Int) -> Bool {
    guard number != 1 else { return true }
    guard number != 2 else { return false }
    
    var tmp = number
    var index = 2
    while index <= number/2 {
      if tmp % index == 0 {
        print("tmp \(tmp)")
        tmp = tmp / index
        if tmp == 1 {
          print("index \(index)")
          return true
        }
      } else {
        index += 1
        tmp = number
      }
    }
    return false
  }
}
