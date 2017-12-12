import Foundation

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

let first = [[1, 12, 34], [23, 2, 4], [67, 1, 87]]
let second = [[1, 32, 74], [93, 2, 54], [67, 11, 87]]

class MatrixMultiplication {
  
  func multiplay(first: [[Int]], second: [[Int]]) -> [[Int]]? {
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
    //мы берем первый со строки и первый со столбца. Мы идем по строке слева и по столбцу справа
    var result: [[Int]] = []
    for i in 0..<first.first!.count {
      
      var row: [Int] = []
      for j in 0..<second.count {
        let value = first[i][j]*second[i][j]
        
      }
    }
    return []
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
