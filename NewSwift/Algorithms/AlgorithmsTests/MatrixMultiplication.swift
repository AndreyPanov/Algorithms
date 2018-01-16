import XCTest
/*
 Example
 First one:
 1  12 34
 23  2  4
 67  1 87
 
 Second one:
 1  32 74
 93  2 54
 67 11 87
 */

class MatrixMultiplication: XCTestCase {
  
  func testMatrix() {
    let first = [[1, 12, 34], [23, 2, 4], [67, 1, 87]]
    let second = [[1, 32, 74], [93, 2, 54], [67, 11, 87]]
    let matrix = multiplay(first: first, second: second)
    print(matrix)
    XCTAssert(true)
  }
  
  func testAnotherMatrix() {
    let first = [[1, 3], [7, 5]]
    let second = [[6, 8], [4, 2]]
    let matrix = multiplay(first: first, second: second)
    print(matrix)
    XCTAssert(true)
  }
  
  func multiplay(first: [[Int]], second: [[Int]]) -> [[Int]] {
    //мы берем первый со строки и первый со столбца. Мы идем по строке слева и по столбцу справа
    var result = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    let rowsNumber = first.count
    for i in 0..<rowsNumber {
      for j in 0..<rowsNumber {
        for k in 0..<rowsNumber {
          result[i][j] = result[i][j] + first[i][k]*second[k][j]
        }
      }
    }
    return result
  }
  
  private func isEqualSizeOfRows(in array: [[Int]]) -> Bool {
    let count = array.first?.count ?? 0
    for subarray in array {
      if subarray.count != count {
        return false
      }
    }
    return true
  }
}

/*
 //number of colums of the first one should be equal to number of rows on second one
 guard
 first.count == second.first?.count
 && isEqualSizeOfRows(in: first)
 && isEqualSizeOfRows(in: second)
 && !first.isEmpty
 && !second.isEmpty
 && first.first?.isEmpty == false
 && second.first?.isEmpty == false
 else { return nil }
 */
