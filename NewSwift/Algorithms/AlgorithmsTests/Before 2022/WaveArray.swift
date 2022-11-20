import XCTest

class WaveArray: XCTestCase {
  
  func testInput() {
    XCTAssertEqual([2, 1, 4, 3], wave([1, 2, 3, 4]))
  }
  
  func testInput1() {
    XCTAssertEqual([13, 6, 17, 15], wave([6, 17, 15, 13]))
  }
  func testInput2() {
    XCTAssertEqual([2, 1, 4, 3, 5], wave([5, 1, 3, 2, 4]))
  }
  
  func testInput3() {
    XCTAssertEqual([1, 1, 2, 1, 2], wave([2, 1, 1, 1, 2]))
  }
  
  func testInput4() {
    XCTAssertEqual([2, 1, 10, 5, 49, 23, 90], wave([10, 90, 49, 2, 1, 5, 23]))
  }
  
  // a1 >= a2 <= a3 >= a4 <= a5
  func waveWrongSolution(_ A: [Int]) -> [Int] {
    let array = A.sorted()
    var isNeedsToBeBiggerThanNextOne = false
    return array.sorted(by: { element1, element2 in
      isNeedsToBeBiggerThanNextOne = !isNeedsToBeBiggerThanNextOne
      return isNeedsToBeBiggerThanNextOne
        ? element1 > element2
        : element1 < element2
    })
  }
  
  func wave(_ A: [Int]) -> [Int] {
    var array = A.sorted()
    var index = 0
    while index < array.count-1 {
      swap(from: &array, index1: index, index2: index+1)
      index += 2
    }
    return array
  }
  
  func swap(from array: inout [Int], index1: Int, index2: Int) {
    let tmp = array[index1]
    array[index1] = array[index2]
    array[index2] = tmp
  }
}