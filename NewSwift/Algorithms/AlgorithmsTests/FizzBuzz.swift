import XCTest

class FuzzBuzz: XCTestCase {
  
  func testFizzBuzz() {
    XCTAssertEqual(["1", "2", "Fizz", "4", "Buzz"], fizzBuzz(5))
  }
  
  func fizzBuzz(_ number: Int) -> [String] {
    
    var result: [String] = []
    for index in 1..<number+1 {
      if index % 3 == 0 && index % 5 == 0 {
        result.append("FizzBuzz")
      } else if index % 3 == 0 {
        result.append("Fizz")
      } else if index % 5 == 0 {
        result.append("Buzz")
      } else {
        result.append("\(index)")
      }
    }
    return result
  }
}
