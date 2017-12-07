import Foundation

class InsertSort {
  
  func sort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    var result = array
    for x in 1..<result.count {
      var y = x
      let value = result[x]
      while y > 0 && value < result[y-1] {
        result[y] = result[y-1]
        y -= 1
      }
      result[y] = value
    }
    return result
  }
}
