import XCTest

// (([]))[]{([])}

class BraceStringBalance: XCTestCase {
  
  func testStringSuccess() {
    XCTAssertEqual(true, stringBraceBalance(string: "(())"))
  }
  
  func testStringFail() {
    XCTAssertEqual(false, stringBraceBalance(string: "(()))"))
  }
  
  func testStringFail1() {
    XCTAssertEqual(false, stringBraceBalance(string: "(()))(((("))
  }
  
  func testStringFail2() {
    XCTAssertEqual(false, stringBraceBalance(string: ")("))
  }
  
  func testStringFail3() {
    XCTAssertEqual(false, stringBraceBalance(string: "())()))(((("))
  }
  
  func testStringFail4() {
    XCTAssertEqual(true, stringBraceBalance(string: "((()(())))"))
  }
  
  func testStringSuccess1() {
    XCTAssertEqual(true, stringBraceBalance(string: "(([]))[]{([])}"))
  }
  
  class Stack {
    private var array: [Character] = []
    
    func pop() -> Character? {
      guard isEmpty() == false else { return nil }
      let last = array.last
      array.removeLast()
      return last
    }
    
    func push(_ element: Character) {
      array.append(element)
    }
    
    func isEmpty() -> Bool {
      return array.isEmpty
    }
  }
  
  func isMatch(first: Character, second: Character) -> Bool {
    return (first == "(" && second == ")")
      || (first == "[" && second == "]")
      || (first == "{" && second == "}")
  }
  
  func stringBraceBalance(string: String) -> Bool {
    guard string.isEmpty == false else { return false }
    
    let stack = Stack()
    
    for character in string {
      if character == "(" || character == "[" || character == "{" {
        stack.push(character)
      } else if character == ")" || character == "]" || character == "}" {
        if let saved = stack.pop() {
          if isMatch(first: saved, second: character) == false {
            return false
          }
        } else {
          return false
        }
      } else {
        return false
      }
    }
    return true
  }
}
