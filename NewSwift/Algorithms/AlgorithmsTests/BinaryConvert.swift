import XCTest

class BinaryConvert: XCTestCase {
  
  func testBinary156() {
    XCTAssertEqual("10011100", convertToBinary(number: 156))
  }
  
  func testBinary357() {
    XCTAssertEqual("101100101", convertToBinary(number: 357))
  }
  
  func testBinary0() {
    XCTAssertEqual("0", convertToBinary(number: 0))
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
