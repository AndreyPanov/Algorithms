import Foundation

// CountInversion and merge algorithm
class CountInversion {
  
  func inversion(array: [Int]) -> [[Int]]? {
    let result = sort(array: array)
    return result.inversedPairs.isEmpty ? nil : result.inversedPairs
  }
  
  func sort(array: [Int]) -> (sortedArray: [Int], inversedPairs: [[Int]]) {
    guard array.count > 1 else { return (array, []) }
    
    let middle = array.count/2
    let left = sort(array: Array(array[0..<middle]))
    let right = sort(array: Array(array[middle..<array.count]))
    return merge(leftTuple: left, rightTyple: right)
  }
  
  private func merge(leftTuple: ([Int], [[Int]]), rightTyple: ([Int], [[Int]])) -> (sortedArray: [Int], inversedPairs: [[Int]]) {
    
    var leftCount = 0
    var rightCount = 0
    var sortedArray = [Int]()
    var pairs = [[Int]]()
    let left = leftTuple.0
    let right = rightTyple.0
    
    while leftCount < left.count && rightCount < right.count {
      if left[leftCount] > right[rightCount] {
        sortedArray.append(right[rightCount])
        pairs.append([left[leftCount], right[rightCount]])
        rightCount += 1
      } else if left[leftCount] < right[rightCount] {
        sortedArray.append(left[leftCount])
        leftCount += 1
      } else {
        sortedArray.append(right[rightCount])
        rightCount += 1
        sortedArray.append(left[leftCount])
        leftCount += 1
      }
    }
    
    while leftCount < left.count {
      sortedArray.append(left[leftCount])
      leftCount += 1
    }
    while rightCount < right.count {
      sortedArray.append(right[rightCount])
      rightCount += 1
    }
    return (sortedArray, pairs)
  }
}
