import XCTest

class PlusOne: XCTestCase {
  
  func testInput() {
    XCTAssertEqual([1, 0, 0, 0], plusOne([9, 9, 9]))
  }
  
  func testInput1() {
    XCTAssertEqual(
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      plusOne([9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9])
    )
  }
  
  func testInput2() {
    XCTAssertEqual([1, 2, 3], plusOne([1, 2, 2]))
  }
  
  func testInput3() {
    XCTAssertEqual([1, 3, 0], plusOne([1, 2, 9]))
  }
  
  func plusOneWrong(_ A: [Int]) -> [Int] {
    var array = A
    
    while array.first == 0 {
      array.remove(at: 0)
    }
    let string: String = array.reduce("") { result, character in
      return result + String(character)
    }
    //ask how big is input
    if let valueOfString = UInt64(string) {
      let result = valueOfString + 1
      return String(result).flatMap { Int("\($0)") }
    }
    return [1]
  }
  
  func plusOne(_ A: [Int]) -> [Int] {
    var array = A
    
    while array.first == 0 {
      array.remove(at: 0)
    }
    guard array.isEmpty == false else { return [1] }
    
    if array.last == 9 {
      return updateArray(array, index: array.count-1)
    } else {
      var last = array.removeLast()
      last += 1
      array.append(last)
      return array
    }
  }
  
  func updateArray(_ array: [Int], index: Int) -> [Int] {
    var array = array
    guard array[index] == 9 else {
      let number = array[index] + 1
      array.remove(at: index)
      array.insert(number, at: index)
      return array
    }
    array.remove(at: index)
    array.insert(0, at: index)
    if index == 0 {
      array.insert(1, at: 0)
      return array
    }
    return updateArray(array, index:index-1)
  }
}
